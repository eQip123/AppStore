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
    
    func getOrder(name: String, fromWhere: String, toWhere: String, width: String, height: String, weight: String, comment: String) {
        model.getOrder(name: name, fromWhere: fromWhere, toWhere: toWhere, width: width, height: height, weight: weight, comment: comment)
    }
}
