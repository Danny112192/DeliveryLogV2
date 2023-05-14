import UIKit

class DeliveryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    var deliveries = [Delivery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func unwindFromDeliveryDetailViewController(segue: UIStoryboardSegue) {
        if let source = segue.source as? DeliveryDetailViewController, let delivery = source.delivery {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                deliveries[selectedIndexPath.row] = delivery
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                deliveries.append(delivery)
                let newIndexPath = IndexPath(row: deliveries.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDelivery" {
            let indexPath = tableView.indexPathForSelectedRow!
            let delivery = deliveries[indexPath.row]
            let destinationViewController = segue.destination as! DeliveryDetailViewController
            destinationViewController.delivery = delivery
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension DeliveryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath)
        
        let delivery = deliveries[indexPath.row]
        
        cell.textLabel?.text = delivery.address
        cell.detailTextLabel?.text = String(format: "$%.2f", delivery.total)
        
        return cell
    }
}

