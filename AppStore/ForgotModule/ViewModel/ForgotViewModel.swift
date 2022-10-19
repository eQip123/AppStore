import RxSwift
import RxCocoa
import RxRelay

class ForgotViewModel {
    let model = ForgotModel()
    
    let email = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func updateData() {
        model.updateSavedData()
    }
    
    func isCorrectEmail() {
        model.isCorrectEmail(sEmail: email.value)
        status.accept(model.status.value)
        savedPass.accept(model.savedPass.value)
    }
}
