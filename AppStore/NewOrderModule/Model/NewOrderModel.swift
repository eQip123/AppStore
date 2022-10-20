import RxCocoa
import RxSwift
import RxRelay
import CoreData
import UIKit

class NewOrderModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    func add(name: String, fromWhere: String, toWhere: String, width: String, height: String, weight: String, comment: String) {
        
        var order = Order(context: context)
        
        order.name = name
        order.fromWhere = fromWhere
        order.toWhere = toWhere
        order.width = width
        order.height = height
        order.weight = weight
        order.comment = comment
        
        do {
            try context.save()
        } catch let err {
            print("Error save order \(err.localizedDescription)")
        }
        
        print("Succes")
    }
}
