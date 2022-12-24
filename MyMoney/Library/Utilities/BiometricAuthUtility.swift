//
//  BiometricAuthUtility.swift
//  MyMoney
//
//  Created by Akniyet Turdybay on 24/12/22.
//

import Foundation
import Combine
import LocalAuthentication

struct BiometericAuthError: LocalizedError {
    var description: String
    var errorDescription: String? {
        return description
    }
    
    init(description: String){
        self.description = description
    }
    
    init(error: Error){
        self.description = error.localizedDescription
    }
}

class BiometricAuthUtility {
    static let shared = BiometricAuthUtility()

    private init() {}

    public func authenticate() -> Future<Bool, BiometericAuthError> {
        Future { promise in
            func handleReply(success: Bool, error: Error?) -> Void {
                if let error = error {
                    return promise(
                        .failure(BiometericAuthError(error: error))
                    )
                }

                promise(.success(success))
            }
            
            let context = LAContext()
            var error: NSError?
            let reason = "Please authenticate to use \(Constants.shared.APP_NAME)"
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: handleReply)
            } else if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: handleReply)
            } else {
                let error = BiometericAuthError(description: "Something went wrong. Please try again")
                promise(.failure(error))
            }
        }
    }


}
