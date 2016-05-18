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
    
    var currentBirthdayStar: String?
    var distance: String?
    var starInfo: String?
    let toolbar = UIToolbar()
    var actionBarButtonItem: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "share:")
    }
    var flexibleSpaceBarButtonItem: UIBarButtonItem {
        // Note that there's no target/action since this represents empty space.
        return UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        
        self.title = "Star Info"
        let url = NSURL (string: starInfo!)
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            navigationItem.rightBarButtonItem = actionBarButtonItem
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            self.tabBarController?.tabBar.hidden = true
        } else {
        toolbar.frame = CGRectMake(0, self.view.frame.size.height - 49, self.view.frame.size.width, 49)
        self.tabBarController!.view.addSubview(toolbar)
        configureToolbar()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.toolbar.removeFromSuperview()
    }
    
    func configureToolbar() {
        
        let toolbarButtonItems = [
            flexibleSpaceBarButtonItem,
            actionBarButtonItem,
            flexibleSpaceBarButtonItem
        ]
        
        toolbar.setItems(toolbarButtonItems, animated: true)
    }
    
    func share(sender: AnyObject) {
        let firstActivityItem = "I found out that my #BirthdayStar is \(currentBirthdayStar!) from the Birthday Star App. What's yours? apple.co/1MlzqFW"
        
        let activityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone {
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        else {
            if activityViewController.respondsToSelector("popoverPresentationController") {
                activityViewController.popoverPresentationController!.barButtonItem = sender as? UIBarButtonItem
                self.presentViewController(activityViewController, animated: true, completion: nil)
            }
        }
    }
}
