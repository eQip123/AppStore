import RxCocoa
import RxSwift
import RxRelay
import Foundation

class SignUpModel {
    
    func getData(sEmail : String, sPass: String, sSecPass: String) {
        let userDefaults = UserDefaults.standard
        
        if sPass == sSecPass {
            userDefaults.setValue(sEmail, forKey: "email")
            userDefaults.setValue(sPass, forKey: "pass")
        } else {
            print("error")
        }
    }
                                        
}
