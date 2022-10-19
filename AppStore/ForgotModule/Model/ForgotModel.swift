import RxCocoa
import RxRelay
import RxSwift
import Foundation

class ForgotModel {
    let savedEmail = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func updateSavedData() {
        savedEmail.accept(UserDefaults.standard.string(forKey: "email")!)
        savedPass.accept(UserDefaults.standard.string(forKey: "pass")!)
    }
    
    func isCorrectEmail(sEmail: String) {
        if sEmail == savedEmail.value {
            status.accept(true)
        } else {
            status.accept(false)
        }
    }
}
