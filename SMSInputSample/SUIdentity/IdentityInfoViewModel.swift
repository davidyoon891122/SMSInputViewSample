//
//  IdentityInfoViewModel.swift
//  PWM
//
//  Created by Davidyoon on 5/24/24.
//

import Foundation

protocol IdentityInfoViewModelProtocol: ObservableObject {
    
    var name: String { get set }
    var frontRegistrationNumber: String { get set }
    var backRegistrationNumber: String { get set }
    var carrier: String { get set }
    var phoneNumber: String { get set }
    var hasErrorOnName: Bool { get }
    
    
}

final class IdentityInfoViewModel {
    
    @Published var name: String = "" {
        didSet {
            self.validateName()
        }
    }
    @Published var frontRegistrationNumber: String = ""
    @Published var backRegistrationNumber: String = ""
    @Published var carrier: String = ""
    @Published var phoneNumber: String = ""
    
    @Published var hasErrorOnName: Bool = false
    
}

extension IdentityInfoViewModel: IdentityInfoViewModelProtocol {
    
    
}

private extension IdentityInfoViewModel {
    
    func validateName() {
        if self.name != "" && self.name.lowercased() != "david" {
            self.hasErrorOnName = true
        } else {
            self.hasErrorOnName = false
        }
    }
    
}


