//
//  ViewController.swift
//  erickayalapractica3
//
//  Created by Viviana Marcela Cruz Vega on 30/03/22.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var ingrediente: UITextView!
    @IBOutlet weak var instrucciones: UITextView!
    
    var drink: [String:Any]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        name.text  = (drink?["name"] as? String) ?? ""
        ingrediente.text = (drink?["ingredients"] as? String) ?? ""
        instrucciones.text = (drink?["directions"] as? String) ?? ""
      
        
        
       let imagenBebida = (drink?["image"] as? String) ?? ""
       let image =  UIImage(named: imagenBebida.lowercased()) ?? UIImage()
       imageview.image = image
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

