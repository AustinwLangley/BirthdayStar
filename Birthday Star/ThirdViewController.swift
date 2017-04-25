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
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(ThirdViewController.share(_:)))
    }
    var flexibleSpaceBarButtonItem: UIBarButtonItem {
        // Note that there's no target/action since this represents empty space.
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        
        self.title = "Star Info"
        let url = URL (string: starInfo!)
        let requestObj = URLRequest(url: url!);
        webView.loadRequest(requestObj)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            navigationItem.rightBarButtonItem = actionBarButtonItem
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            self.tabBarController?.tabBar.isHidden = true
        } else {
        toolbar.frame = CGRect(x: 0, y: self.view.frame.size.height - 49, width: self.view.frame.size.width, height: 49)
        self.tabBarController!.view.addSubview(toolbar)
        configureToolbar()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
    
    func share(_ sender: AnyObject) {
        let firstActivityItem = "I found out that my #BirthdayStar is \(currentBirthdayStar!) from the Birthday Star App. What's yours? apple.co/1MlzqFW"
        
        let activityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            self.present(activityViewController, animated: true, completion: nil)
        }
        else {
            if activityViewController.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
                activityViewController.popoverPresentationController!.barButtonItem = sender as? UIBarButtonItem
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}
