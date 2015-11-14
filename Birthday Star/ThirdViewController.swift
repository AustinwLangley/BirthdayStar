//
//  ThirdViewController.swift
//  Birthday Star
//
//  Created by AL on 11/13/15.
//  Copyright © 2015 AL. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var starInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: starInfo!)
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
