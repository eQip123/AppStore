import RxRelay
import RxSwift
import RxCocoa

class OrderViewModel {
    let disposeBag = DisposeBag()
    let model = OrderModel()
    let name = BehaviorRelay<String>(value: "")
    let fromWhere = BehaviorRelay<String>(value: "")
    let toWhere = BehaviorRelay<String>(value: "")
    let width = BehaviorRelay<String>(value: "")
    let height = BehaviorRelay<String>(value: "")
    let weight = BehaviorRelay<String>(value: "")
    let comment = BehaviorRelay<String>(value: "")
    
    init() {
        bindingModel()
    }
    
    func bindingModel() {
        model.name
            .bind(to: name)
            .disposed(by: disposeBag)
        
        model.fromWhere
            .bind(to: fromWhere)
            .disposed(by: disposeBag)
        
        model.toWhere
            .bind(to: toWhere)
            .disposed(by: disposeBag)
        
        model.width
            .bind(to: width)
            .disposed(by: disposeBag)
        
        model.height
            .bind(to: height)
            .disposed(by: disposeBag)
        
        model.weight
            .bind(to: weight)
            .disposed(by: disposeBag)
        
        model.comment
            .bind(to: comment)
            .disposed(by: disposeBag)
    }
    
    func getOrder() {
        model.getOrder()
    }
}
