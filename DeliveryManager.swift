import Foundation

class DeliveryManager: ObservableObject {
    @Published var deliveries = [Delivery]()
    
    func addDelivery(_ delivery: Delivery) {
        deliveries.append(delivery)
    }
    
    func deleteDelivery(at index: Int) {
        deliveries.remove(at: index)
    }
}
