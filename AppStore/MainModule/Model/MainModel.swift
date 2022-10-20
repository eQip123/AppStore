import RxCocoa
import RxSwift
import RxRelay
import CoreData
import UIKit

class MainModel {
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
}
