import RxCocoa
import RxSwift
import RxRelay
import Foundation

class SignUpModel {
    
    let userDefaults = UserDefaults.standard
    let status = BehaviorRelay<Bool>(value: false)
    
    func getData(sEmail : String, sPass: String, sSecPass: String) {
        
        if sPass == sSecPass {
            userDefaults.setValue(sEmail, forKey: "email")
            userDefaults.setValue(sPass, forKey: "pass")
        } else {
            print("error")
        }
        
    }
    
    func checkData(sEmail: String, sPass: String, sSecPass: String) {
        if sPass == sSecPass && sPass != "" && sPass != "" {
            status.accept(true)
        } else {
            status.accept(false)
        }
    }
                                        
}
