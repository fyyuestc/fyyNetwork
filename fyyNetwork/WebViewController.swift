//
//  WebViewController.swift
//  fyyNetwork
//
//  Created by zhangzongping on 2018/12/18.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController,WKNavigationDelegate,WKUIDelegate{

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func clicked(_ sender: Any) {
        if let url = URL(string: tfUrl.text ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: (tfUrl.text)!) {
            webView.load(URLRequest(url: url))
            webView.navigationDelegate = self
            webView.uiDelegate = self
          
        }
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
