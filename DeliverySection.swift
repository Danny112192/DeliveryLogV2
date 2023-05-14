import SwiftUI

struct DeliverySection: View {
    let title: String
    let deliveries: [Delivery]
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(deliveries) { delivery in
                NavigationLink(destination: DeliveryDetail(viewModel: DeliveryDetailViewModel(delivery: delivery))) {
                    DeliveryCell(delivery: delivery)
                }
            }
        }
    }
}

struct DeliverySection_Previews: PreviewProvider {
    static var previews: some View {
        DeliverySection(title: "Test", deliveries: [Delivery.example])
    }
}
