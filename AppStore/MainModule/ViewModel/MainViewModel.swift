import RxCocoa
import RxSwift
import RxRelay

class MainViewModel {
    let model = MainModel()
    let list = BehaviorRelay<[Order]>(value: [])
    let disposeBag = DisposeBag()
    
    init() {
        bindingModel()
    }
    
    func bindingModel() {
        model.list
            .bind(to: list)
            .disposed(by: disposeBag)
    }
    
    func didGetOrderList() {
        model.getOrderList()
    }
}
