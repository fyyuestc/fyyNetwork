//
//  ThreadViewController.swift
//  fyyNetwork
//
//  Created by zhangzongping on 2018/12/18.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func calculate(_ sender: Any) {
        var sum = 0
        for _ in 1...100 {
            DispatchQueue.global().async {
                print("Run thread:\(Thread.current)")
                
                for i in 1...1000 {
                    usleep(10000)
                    sum += i
                }
                DispatchQueue.main.async {
                    self.testLabel.text = "sum:\(sum)"
                }
            }
        }
    }
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timerLabel.text = "\(self.count)"
            //            print("timer thread:\(Thread.current)")
            }.fire()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
