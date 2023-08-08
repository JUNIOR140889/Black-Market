//
//  SignInViewModel.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/30/23.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var password = ""
    @Published var email = ""
    @Published var fetchError: NetworkError?
    var isLoadingData = true
    private let networkService: UserNetworkInterface
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: UserNetworkInterface = UserNetworkService()) {
        self.networkService = networkService
    }
    
    var isFormValid: Bool {
        email.isValidEmail && password.isValidPassword
    }
    
    func signIn() {
        let params = SignInRequest(
            email: email,
            password: password
        )
        networkService.signIn(params: params)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self.isLoadingData = false
                    if let error = error as? NetworkError {
                        print(error)
                        self.fetchError = error
                    }
                }
            }, receiveValue: { [weak self] response in
                guard let self else {
                    return
                }
                self.isLoadingData = false
                print(response.accessToken)
            })
            .store(in: &cancellable)
    }
}
