//
//  AllCityTableViewController.swift
//  fyyNetwork
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit
import Alamofire

class AllCityTableViewController: UITableViewController {

    var cityURL : [String]?
    var allCity : [String]?
    var cityInfo : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        cityURL = ["http://t.weather.sojson.com/api/weather/city/101290101","http://t.weather.sojson.com/api/weather/city/101270101",]
        allCity = ["昆明","成都"]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (allCity?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = allCity![indexPath.row]
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = cityURL![indexPath.row]
        AF.request(url).responseJSON { (response) in
            self.cityInfo = response.value as? [String:Any] 
            //print(self.cityInfo)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ShowCity", sender: self)
            }
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowCity" {
            if let secVC = segue.destination as? ViewController {
                secVC.cityInfo = self.cityInfo
            }
        }
    }
   

}
