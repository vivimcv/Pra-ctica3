//
//  ViewController.swift
//  Countries
//
//  Created by Viviana Marcela Cruz Vega on 30/03/22.
//

import UIKit

/*struct Drinks: Codable {
    static var instance;? = nil
var image:String
var directions:String
var ingredients:String
var name:String
    
    enum CodingKeys: String, CodingKey{
        case image = "image"
        case directions = "directions"
        case ingredients = "ingredients"
        case name = "name"
    }



}*/

struct Drinks: Decodable {
    private enum CodingKeys: String, CodingKey {
        case image, directions, ingredients, name
    }

    var image: String
    var directions: String
    var ingredients: String
    var name: String
}


class ViewController: UIViewController {
    
   
   

    @IBOutlet weak var name: UILabel!
    var ingrediente: UILabel!
    var instrucciones: UILabel!
    var image: UIImageView!
    var drinks = [Drinks]()
    
 
      
    //como opcional ?
  //  var pokemon: Pokemon?
    var datos = [[String:Any]]()
    var drink: [String:Any]?
      
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
    
        let dicts = functionsStruct()
        
        name.text  = (drink?["name"] as? String) ?? ""
        

        
       // for item in dicts {

                    // item["name"] as Any
         //   name.text = item["name"]  as? String
                     // cell.detailTextLabel?.text = dicts[0]["directions"] as! String
                     //  print(item.count)
                     //  print(plist.count)
             // cell.detailTextLabel?.text = item["name"] as Any as! String
           //        }
    //   print(dicts[]["name"])
     //   print(dicts[0]["ingredients"] as Any)
      
        
       // name.text = (dicts[0]["name"] as! String)
        ingrediente.text = (dicts[0]["ingredients"] as! String)
        instrucciones.text = (dicts[0]["directions"] as! String)
       // image.image = (dicts[0]["image"] as? UIImage)
        
       
        
        
        
        
        guard let path = Bundle.main.path(forResource: "Drinks", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        var data = try! Data(contentsOf: url)
        guard let plist =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String:String]] else {return}
        
        
        
      //print(plist[0]["name"])
      //  print(plist.forEach(KeyPath<"name", Any>))
      
      /*  for (key,value) in plist.enumerated() {
            print("\(key) = \(value)")
          //  print("\(value)")
           // print("\(value)[0]")
           
           // name.text = (dicts[0]["name"] as! String)
            
            if (key == 0) {name.text = (dicts[0]["name"] as! String)} else{ name.text = (dicts[1]["name"] as! String)}
            if (key == 2) {name.text = (dicts[2]["name"] as! String)} else{ name.text = (dicts[3]["name"] as! String)}
        }*/
        
       /* if let path = Bundle.main.path(forResource: "Drinks", ofType: "plist") {
            
        if let arrayOfDictionaries = NSArray(contentsOfFile: path){
            for dict in arrayOfDictionaries{
                data.append(dict.objectForKey("name") as! String)
            }
        }
        }
*/
        
        
      //  image.image = (plist[0]["image"] as UIImage
        
        

      //  let config = parseConfig()
      //  print(config.name)
       

    
 
       //let p = getPlist(withName: "Drinks")?.contains("name")
       // print(p as Any)
       // name.text = getPlist(withName: "Drinks").name
        
        
         // name.text = drink?.name
         // let tipo
        
         // name.text = pokemon?.name
        //  let pokemonType: String = (pokemon?.type.name) ?? ""
         // type.text = "Tipo: \(pokemonType)"
         // image.image = pokemon?.photo
        
        
        
        
     /*   var config: [String: Any]?
                
        if let infoPlistPath = Bundle.main.url(forResource: "Drinks", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }*/
        
        
        
    
        
        }
    
        
    

    override func viewDidLoad() {
      super.viewDidLoad()
      name = UILabel()
      name.text="Nombre bebida"
      name.font=UIFont.systemFont(ofSize: 24)
        //aquí indica que solo puede variar el ancho
      name.autoresizingMask = .flexibleWidth
      name.translatesAutoresizingMaskIntoConstraints=true
      name.frame=CGRect(x:self.view.bounds.width / 2, y:50, width: self.view.bounds.width / 2, height: 50)
      self.view.addSubview(name)
      
      ingrediente = UILabel()
      ingrediente.text="Ingredientes"
      ingrediente.autoresizingMask = .flexibleWidth
      ingrediente.translatesAutoresizingMaskIntoConstraints=true
      ingrediente.frame=CGRect(x:self.view.bounds.width / 2, y:100, width:self.view.bounds.width / 2, height: 40)
      self.view.addSubview(ingrediente)
        
        
      instrucciones = UILabel()
      instrucciones.text="Instrucciones"
      instrucciones.autoresizingMask = .flexibleWidth
      instrucciones.translatesAutoresizingMaskIntoConstraints=true
      instrucciones.frame=CGRect(x:self.view.bounds.width / 2, y:150, width:self.view.bounds.width / 2, height:40)
      self.view.addSubview(instrucciones)
      
      image = UIImageView()
      image.backgroundColor = .lightGray
      image.autoresizingMask = [.flexibleWidth, .flexibleWidth]
      image.frame=CGRect(x:0, y:50, width:self.view.bounds.width / 2, height:self.view.frame.width / 2)
      self.view.addSubview(image)
      

        //ejecutará el método que se llama back
     // btnBack.addTarget(self, action: #selector(self.back(_:)), for:.touchUpInside)
        
        
       /* if let ingredients = getPlist(withName: "Drinks") {
        print(ingredients) // Output: [“Orange”, “Pineapple”, “Raspberry”, ]
        }*/
        
      
        
    }
   /* @objc func back(_ sender: Any) {
        //lo opuesto a present , elimina el controler actual para que se muestre el anterior
        self.dismiss(animated: true, completion: nil)
    }*/
    
    func functionsStruct() -> [[String: Any]] {
        let url = Bundle.main.url(forResource: "Drinks", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode([[String: String]].self, from: data)
    }
    
    
    
    
    
    func getPlist(withName name: String) -> [String]?
    {
    if let path = Bundle.main.path(forResource: name, ofType: "plist"),
    let xml = FileManager.default.contents(atPath: path)
    {
    return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
    }

    return nil
    }
    
    
    func parseConfig() -> Drinks {
        let url = Bundle.main.url(forResource: "Drinks", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(Drinks.self, from: data)
    }
    

    
        
    }


