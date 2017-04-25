//
//  SecondViewController.swift
//  Birthday Star
//
//  Created by AL on 11/11/15.
//  Copyright © 2015 AL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var starDescriptionLabel: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    @IBOutlet weak var learnButton: UIButton!
    
    @IBOutlet weak var starFactOneLabel: UILabel!
    
    @IBOutlet weak var starFactTwoLabel: UILabel!
    
    @IBOutlet weak var starFactThreeLabel: UILabel!
    
    @IBOutlet weak var factsLabel: UILabel!
    
    var currentBirthdayStar: String?
    var distance: String?
    var yearsOld: Int?
    var starInfo: String?
    var starFactOne: String?
    var starFactTwo: String?
    var starFactThree: String?
    let toolbar = UIToolbar()
    var actionBarButtonItem: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(SecondViewController.share(_:)))
    }
    var flexibleSpaceBarButtonItem: UIBarButtonItem {
        // Note that there's no target/action since this represents empty space.
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Your Star"
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem = backButton
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            navigationItem.rightBarButtonItem = actionBarButtonItem
        }
        
        
        learnButton.backgroundColor = UIColor.clear
        learnButton.layer.cornerRadius = 5
        learnButton.layer.borderWidth = 2
        learnButton.layer.borderColor = UIColor.white.cgColor
        
        if yearsOld! < 4 {
        starDescriptionLabel.text = "Your first Birthday Star will be waiting for you when you turn 4 years old!  Did you know that \(currentBirthdayStar!) is \(distance!) away?  The light that shines on you was created 8 minutes ago in the past."
            let image = UIImage(named: "Sunset")
            starImage.image = image
            
            factsLabel.text = "Interesting facts about the Sun:"
            starFactOneLabel.text = "1. \(starFactOne!)"
            starFactTwoLabel.text = "2. \(starFactTwo!)"
            starFactThreeLabel.text = "3. \(starFactThree!)"
        } else {
            starDescriptionLabel.text = "Your Star is \(currentBirthdayStar!).  It is \(distance!) light years away.  The light that you see from it today started its journey to Earth approximately the same year you were born."
            starFactOneLabel.text = "1. \(starFactOne!)"
            starFactTwoLabel.text = "2. \(starFactTwo!)"
            starFactThreeLabel.text = "3. \(starFactThree!)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdScene = segue.destination as! ThirdViewController
        thirdScene.currentBirthdayStar = self.currentBirthdayStar
        thirdScene.distance = self.distance
        thirdScene.starInfo = self.starInfo
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
