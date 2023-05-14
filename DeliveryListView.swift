import SwiftUI

struct DeliveryListView: View {
    @ObservedObject var viewModel: DeliveryListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.deliveries) { delivery in
                DeliveryCellView(delivery: delivery)
            }
        }
        .onAppear {
            viewModel.fetchDeliveries()
        }
    }
}

struct DeliveryCellView: View {
    let delivery: Delivery
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(delivery.recipientName)
                .font(.headline)
            Text(delivery.customerName)
                .font(.subheadline)
        }
    }
}
