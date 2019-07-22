//
//  JsonDecorderViewController.swift
//  AllJson
//
//  Created by Md Khaled Hasan Manna on 7/22/19.
//  Copyright © 2019 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

struct GroceryProduct : Codable {
    
   var  name :  String?
   var  price : Int?
    var descrioption : String?
    
}



class JsonDecorderViewController: UIViewController {

    

    let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 

        
    }
    

    @IBAction func jsonDecoderAction(_ sender: UIButton) {
        do{
            
            let product = try
                JSONDecoder().decode(GroceryProduct.self, from: json)
            
            print(product.name!)
            
        }catch{
            
            print(error.localizedDescription)
        }
     
        
    }
    
    @IBAction func jsonEncoderAction(_ sender: UIButton) {
        
        let pear = GroceryProduct(name: "Rice", price: 50, descrioption: "Rice is a main food in bangladesh")
        
       let coder = JSONEncoder()
    
        coder.outputFormatting = .prettyPrinted
        do{
            let result = try
                coder.encode(pear)
            print(String(data: result, encoding: .utf8)!)
            
        }catch{
            print(error.localizedDescription)
        }
       
    }
    
}
