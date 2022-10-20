import RxRelay
import RxSwift
import RxCocoa

class OrderModel {
    let storage = OrderStorage.shared
    let name = BehaviorRelay<String>(value: "")
    let fromWhere = BehaviorRelay<String>(value: "")
    let toWhere = BehaviorRelay<String>(value: "")
    let width = BehaviorRelay<String>(value: "")
    let height = BehaviorRelay<String>(value: "")
    let weight = BehaviorRelay<String>(value: "")
    let comment = BehaviorRelay<String>(value: "")
    
    func getOrder() {
        name.accept(storage.name)
        fromWhere.accept(storage.fromWhere)
        toWhere.accept(storage.toWhere)
        width.accept(storage.width)
        height.accept(storage.height)
        weight.accept(storage.weight)
        comment.accept(storage.comment)
    }
}
