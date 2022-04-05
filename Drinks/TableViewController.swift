import UIKit

/*func configure(

  imageName: String
) -> CountriesTableViewController {
   // iv.image = UIImage(named: imageName)
    return self
}
*/


class TableViewController: UITableViewController {
    
    var datos = [[String:Any]]()
    
   

    
   
    @IBOutlet weak var auteurImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dicts = functionsStruct().count
        print(dicts)
        
       getData()
      //  functionsStruct()
     //   self.animals = result.animals
       
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //self.countries.count
      //  datos.count
     functionsStruct().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

      //  let country = self.countries[indexPath.row]
       // cell.textLabel?.text = country.name
       // cell.detailTextLabel?.text = country.isoCode
        //cell.imageView?.image = UIImage(named: country.isoCode)

        let dicts = functionsStruct()
        let count = functionsStruct().count
     //   let c = functionsStruct().
      //  print(dicts[0]["name"] as Any)
      //  print(dicts[0]["directions"] as Any)
        
      // for item in dicts {

                 //  print(item["name"] as Any)
                   // cell.detailTextLabel?.text = dicts[0]["directions"] as! String
                   //  print(item.count)
                   //  print(plist.count)
           // cell.detailTextLabel?.text = item["name"] as Any as! String
               //  }
       // cell.detailTextLabel?.text = dicts[indexPath.row]["directions"] as! String
        cell.textLabel?.text = dicts[indexPath.row]["name"] as! String
        cell.imageView?.image = UIImage(named: dicts[indexPath.row]["image"] as! String)
       // cell.detailTextLabel?.text = dicts[0]["directions"] as! String
      //  cell.textLabel?.text = dicts[0]["name"] as! String
        //cell.imageView?.image = UIImage(named: dicts[0]["image"] as! String)
     
       
        
        
        return cell
     
        
       
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Drinks"
    }
 
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "identificador", sender: self)
    }
    
    
    
    func functionsStruct() -> [[String: Any]] {
        let url = Bundle.main.url(forResource: "Drinks", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode([[String: String]].self, from: data)
      //  return try! decoder.decode([Config].self, from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! ViewController2
        if let indexPath = tableView.indexPathForSelectedRow {
            let bebidas = datos[indexPath.row]
            detailsVC.drink = bebidas
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func getData(){
        if let filePath = Bundle.main.url(forResource: "Drinks", withExtension: "plist"){
            do{
                let bytes = try Data(contentsOf: filePath)
                let tmp   = try PropertyListSerialization.propertyList(from: bytes, options: .mutableContainers, format: nil)
                datos = tmp as! [[String:Any]]
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}
