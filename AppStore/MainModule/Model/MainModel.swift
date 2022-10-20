import RxCocoa
import RxSwift
import RxRelay
import CoreData
import UIKit

class MainModel {
    let storage = OrderStorage.shared
    let list = BehaviorRelay<[Order]>(value: [])
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getOrderList() {
        let request = NSFetchRequest<Order>(entityName: "Order")
        
        do {
            let orders = try context.fetch(request)
            
            list.accept(orders)
        } catch let err{
            print("Error get products \(err.localizedDescription)")
        }
    }
    
    func getOrder(name: String, fromWhere: String, toWhere: String, width: String, height: String, weight: String, comment: String) {
        
        storage.name = name
        storage.fromWhere = fromWhere
        storage.toWhere = toWhere
        storage.width = width
        storage.height = height
        storage.weight = weight
        storage.comment = comment
    }
}
