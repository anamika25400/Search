

import UIKit

class ViewController: UIViewController {
    let FruitsName = ["Mango","Apple","Orange","Lichi","Water Melon"]
    var search = [String]()
    var searching = false

    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var Search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Search.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return search.count
        }else{
            return FruitsName.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching{
            cell?.textLabel?.text = search[indexPath.row]
        }else{
            cell?.textLabel?.text = FruitsName[indexPath.row]
        }
        return cell!
}


}

extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     
        search = FruitsName.filter({$0.lowercased().prefix(searchText.count)==searchText.lowercased()})
        searching = true
        tblView.reloadData()
    
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblView.reloadData()
     
        
    }
}
