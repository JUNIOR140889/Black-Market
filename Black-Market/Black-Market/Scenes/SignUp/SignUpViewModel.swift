//
//  SignUpViewModel.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/30/23.
//
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var newPassword = ""
    @Published var confirmPassword = ""
    
    @Published var fetchError: NetworkError?
    var isLoadingData = true
    private let networkService: UserNetworkInterface
    private var cancellable = Set<AnyCancellable>()
    
    var isFormValid: Bool {
        email.isValidEmail && newPassword.isValidPassword && confirmPassword.isValidPassword
    }
    
    init(networkService: UserNetworkInterface = UserNetworkService()) {
        self.networkService = networkService
    }
    
    func signUp() {
        let params = SignUpRequest(email: email, password: newPassword, confirmedPassword: confirmPassword)
        networkService.signUp(params: params)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    if let error = error as? NetworkError {
                        print(error)
                        self.fetchError = error
                        self.isLoadingData = false
                    }
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else {
                    return
                }
                self.isLoadingData = false
                print(response.success)
            })
            .store(in: &cancellable)
    }
}
