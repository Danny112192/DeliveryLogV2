import Foundation

protocol DeliveryServiceProtocol {
    func fetchDeliveries(completion: @escaping ((Result<[Delivery], Error>) -> Void))
}

class DeliveryListViewModel: ObservableObject {
    @Published var deliveries = [Delivery]()
    private let deliveryService: DeliveryServiceProtocol
    
    init(deliveryService: DeliveryServiceProtocol) {
        self.deliveryService = deliveryService
        self.fetchDeliveries()
    }
    
    func fetchDeliveries() {
        deliveryService.fetchDeliveries { [weak self] result in
            switch result {
            case .success(let deliveries):
                DispatchQueue.main.async {
                    self?.deliveries = deliveries
                }
            case .failure(let error):
                print("Error fetching deliveries: \(error.localizedDescription)")
            }
        }
    }
}
