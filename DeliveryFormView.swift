import SwiftUI

struct DeliveryFormView: View {
    @Binding var deliveryManager: DeliveryManager
    @State private var customerName = ""
    @State private var address = ""
    @State private var totalAmountString = ""
    @State private var deliveryChargeString = ""
    @State private var tipString = ""
    @State private var isDeliveryChargeCreditCard = false
    @State private var isTipCreditCard = false
    @State private var date = Date()

    private var totalAmount: Double {
        return Double(totalAmountString) ?? 0
    }

    private var deliveryCharge: Double {
        return Double(deliveryChargeString) ?? 0
    }

    private var tip: Double {
        return Double(tipString) ?? 0
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Delivery Details")) {
                    TextField("Customer Name", text: $customerName)
                    TextField("Address", text: $address)
                    TextField("Total Amount", text: $totalAmountString)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                }
                Section(header: Text("Charge Details")) {
                    TextField("Delivery Charge", text: $deliveryChargeString)
                        .keyboardType(.decimalPad)
                    TextField("Tip", text: $tipString)
                        .keyboardType(.decimalPad)
                    Toggle("Is Delivery Charge Credit Card?", isOn: $isDeliveryChargeCreditCard)
                    Toggle("Is Tip Credit Card?", isOn: $isTipCreditCard)
                }
                Section {
                    Button(action: {
                        let delivery = Delivery(customerName: self.customerName,
                                                address: self.address,
                                                totalAmount: self.totalAmount,
                                                deliveryCharge: self.deliveryCharge,
                                                tip: self.tip,
                                                isDeliveryChargeCreditCard: self.isDeliveryChargeCreditCard,
                                                isTipCreditCard: self.isTipCreditCard,
                                                date: self.date)
                        self.deliveryManager.add(delivery: delivery)
                        self.deliveryManager.showDeliveryForm.toggle()
