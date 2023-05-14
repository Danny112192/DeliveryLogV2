import SwiftUI

struct DeliveryDetailView: View {
    @ObservedObject var viewModel: DeliveryDetailViewModel
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Delivery Information")) {
                    Text("Name: \(viewModel.name)")
                    Text("Address: \(viewModel.address)")
                    Text("Customer Name: \(viewModel.customerName)")
                }
                
                Section(header: Text("Delivery Amounts")) {
                    Text("Delivery Charge: $\(viewModel.deliveryCharge)")
                    Text("Tip: $\(viewModel.tip)")
                }
                
                Section(header: Text("Payment Information")) {
                    Toggle("Delivery Charge Paid with Credit Card", isOn: $viewModel.delivery.isDeliveryChargeCreditCard)
                    Toggle("Tip Paid with Credit Card", isOn: $viewModel.delivery.isTipCreditCard)
                }
            }
            .navigationBarTitle(Text("Delivery Detail"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.isEditing = true
                }) {
                    Text("Edit")
                }
            )
            .sheet(isPresented: $isEditing) {
                EditDeliveryModal(viewModel: self.viewModel)
            }
        }
    }
}
