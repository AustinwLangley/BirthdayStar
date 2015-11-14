//
//  SecondViewController.swift
//  Birthday Star
//
//  Created by AL on 11/11/15.
//  Copyright © 2015 AL. All rights reserved.
//

import UIKit
import iAd

class SecondViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var starView: UIImageView!
    
    @IBOutlet weak var addBannerTwo: ADBannerView!
    
    @IBOutlet weak var starDescriptionLabel: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    var currentBirthdayStar: String?
    var distance: String?
    var yearsOld: Int?
    var starInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBannerTwo.delegate = self
        // Do any additional setup after loading the view.
        print("In Second VC, years old is \(yearsOld!)")
        if yearsOld! < 4 {
        starDescriptionLabel.text = "Unfortunately, there are no stars that are close enough to be a true Birthday Star.  Cheer up, your first Birthday Star will be waiting for you when you turn 4 years old!  Fyi, did you know that \(currentBirthdayStar!) is \(distance!) away?  The light that shines on you was created 8 minutes ago."
            let image = UIImage(named: "Sunset")
            starImage.image = image
            
        } else {
            starDescriptionLabel.text = "Your Star is \(currentBirthdayStar!).  It is \(distance!) light years away.  The light that you see from it today started its journey to Earth approximately the same year you were born."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("％@", error)
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.addBannerTwo.hidden = false
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let thirdScene = segue.destinationViewController as! ThirdViewController
        // Pass the selected object to the new view controller.
        thirdScene.starInfo = self.starInfo
        
    }
 
    

}
