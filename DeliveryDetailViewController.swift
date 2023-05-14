import UIKit
import MapKit

class DeliveryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var delivery: Delivery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextField.delegate = self
        tipTextField.delegate = self
        
        if let delivery = delivery {
            addressTextField.text = delivery.address
            tipTextField.text = String(format: "%.2f", delivery.tip)
            showMap(for: delivery.address)
        }
    }
    
    func showMap(for address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil, let placemarks = placemarks, placemarks.count > 0 {
                let placemark = placemarks[0]
                let annotation = MKPointAnnotation()
                annotation.coordinate = placemark.location!.coordinate
                annotation.title = self.delivery?.address
                self.mapView.addAnnotation(annotation)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, latitudinalMeters
