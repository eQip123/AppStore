import RxSwift
import RxRelay
import RxCocoa

class SignUpViewModel {
    let disposeBag = DisposeBag()
    let model = SignUpModel()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let secPass = BehaviorRelay<String>(value: "")
    
    init() {
        
    }
    
    func getData() {
        model.getData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
    }
}
