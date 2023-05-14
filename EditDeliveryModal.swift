import SwiftUI

struct EditDeliveryModal: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DeliveryDetailViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Delivery Information")) {
                    TextField("Delivery Name", text: $viewModel.name)
                    TextField("Delivery Address", text: $viewModel.address)
                    TextField("Customer Name", text: $viewModel.customerName)
                }
                
                Section(header: Text("Delivery Amounts")) {
                    TextField("Delivery Charge", text: $viewModel.deliveryCharge)
                        .keyboardType(.decimalPad)
                    TextField("Tip", text: $viewModel.tip)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Payment Information")) {
                    Toggle("Delivery Charge Paid with Credit Card", isOn: $viewModel.isDeliveryChargeCreditCard)
                    Toggle("Tip Paid with Credit Card", isOn: $viewModel.isTipCreditCard)
                }
            }
            .navigationBarTitle(Text("Edit Delivery"))
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    self.viewModel.saveDelivery()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
                .disabled(!self.viewModel.isValid)
            )
        }
    }
}
