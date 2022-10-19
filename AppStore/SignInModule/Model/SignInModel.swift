import RxSwift
import RxCocoa
import RxRelay
import Foundation

class SignInModel {
    let savedEmail = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func updateSavedData() {
        savedEmail.accept(UserDefaults.standard.string(forKey: "email")!)
        savedPass.accept(UserDefaults.standard.string(forKey: "pass")!)
    }
    
    func canLogIn(sEmail: String, sPass: String){
        updateSavedData()
        if sEmail == savedEmail.value && sPass == savedPass.value {
            status.accept(true)
            print(status)
        } else {
            status.accept(false)
        }
    }
}
