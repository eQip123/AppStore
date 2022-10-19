import RxSwift
import RxRelay
import RxCocoa

class SignUpViewModel {
    let disposeBag = DisposeBag()
    let model = SignUpModel()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let secPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    init() {
        
    }
    
    func getData() {
        model.getData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
    }
    
    func checkData() {
        model.checkData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
        status.accept(model.status.value)
    }
}
