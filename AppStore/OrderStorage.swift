class OrderStorage {
    static let shared = OrderStorage()
    
    private init() {}
    
    var name = ""
    var fromWhere = ""
    var toWhere = ""
    var width = ""
    var height = ""
    var weight = ""
    var comment = ""
}
