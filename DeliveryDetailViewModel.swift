import Foundation

class DeliveryDetailViewModel {

    let delivery: Delivery

    init(delivery: Delivery) {
        self.delivery = delivery
    }

    var recipientName: String {
        return delivery.recipientName
    }

    var customerName: String {
        return delivery.customerName
    }

    var streetAddress: String {
        return delivery.streetAddress
    }

    var city: String {
        return delivery.city
    }

    var state: String {
        return delivery.state
    }

    var zipCode: String {
        return delivery.zipCode
    }

    var pickUpTime: Date {
        return delivery.pickUpTime
    }

    var deliveryTime: Date? {
        return delivery.deliveryTime
    }

    var isDelivered: Bool {
        return delivery.isDelivered
    }
}
