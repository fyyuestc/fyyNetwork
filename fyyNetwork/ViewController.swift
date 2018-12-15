//
//  ViewController.swift
//  fyyNetwork
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var wuran: UILabel!
    @IBOutlet weak var tempe: UILabel!
    var cityInfo : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("-----")
        //print(cityInfo as Any)
        // Do any additional setup after loading the view, typically from a nib.
        let info1 = cityInfo!["cityInfo"] as! [String : String]
        city.text = info1["city"]
        date.text = (cityInfo!["date"] as! String)
        let info3 = cityInfo!["data"] as! [String : Any]
        tempe.text = info3["wendu"] as? String
        wuran.text = info3["quality"] as? String
    }


}

