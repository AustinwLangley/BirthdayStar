//
//  ViewController.swift
//  Birthday Star
//
//  Created by AL on 11/11/15.
//  Copyright © 2015 AL. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, ADBannerViewDelegate {

    @IBOutlet weak var addBannerOne: ADBannerView!
    
    @IBOutlet weak var yearPickerView: UIPickerView!

    var years = [String]()
    var stars = [("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"), ("the Alpha Centauri system", "4.4", "https://en.wikipedia.org/wiki/Alpha_Centauri"), ("Barnard's Star", "5.96", "https://en.wikipedia.org/wiki/Barnard%27s_Star"), ("Luhman 16", "6.6", "https://en.wikipedia.org/wiki/Luhman_16"), ("Wolf 359", "7.78", "https://en.wikipedia.org/wiki/Wolf_359"), ("the Sirius system which is the brightest star in the night sky", "8.6", "https://en.wikipedia.org/wiki/Sirius"), ("Ross 154", "9.7", "https://en.wikipedia.org/wiki/Ross_154"), ("Epsilon Eridani", "10.5", "https://en.wikipedia.org/wiki/Epsilon_Eridani"), ("Procyon", "11.4", "https://en.wikipedia.org/wiki/Procyon"), ("Kapteyn's Star", "12.8", "https://en.wikipedia.org/wiki/Kapteyn%27s_Star"), ("Kruger 60", "13.1", "https://en.wikipedia.org/wiki/Kruger_60"), ("Gliese 1", "14.2", "https://en.wikipedia.org/wiki/Gliese_1"), ("Groombridge 1618", "15.8", "https://en.wikipedia.org/wiki/Groombridge_1618"), ("Gliese 832", "16.085", "https://en.wikipedia.org/wiki/Gliese_832"), ("EI Cancri", "17.1", "https://en.wikipedia.org/wiki/G_9-38"), ("Sigma Draconis", "18.77", "https://en.wikipedia.org/wiki/Sigma_Draconis"),("Delta Pavonis","19.92","https://en.wikipedia.org/wiki/Delta_Pavonis"),("Gliese 581","20.7","https://en.wikipedia.org/wiki/Gliese_581"),("V1054 Ophiuchi","21.1","https://en.wikipedia.org/wiki/V1054_Ophiuchi"),("","22",""),("Gliese 105","23.42","https://en.wikipedia.org/wiki/Gliese_105"),("Fomalhaut","24.8","https://en.wikipedia.org/wiki/Fomalhaut"),("","25",""),("Chi Draconis","26.3","https://en.wikipedia.org/wiki/Chi_Draconis"),("","27",""),("Chi1 Orionis","28.26","https://en.wikipedia.org/wiki/Chi1_Orionis"),("Gamma Leporis","29.3","https://en.wikipedia.org/wiki/Gamma_Leporis"),("Gamma Pavonis","30.21","https://en.wikipedia.org/wiki/Gamma_Pavonis"),("HR 4458","31","https://en.wikipedia.org/wiki/HR_4458"),("","32",""),("","33",""),("Iota Persei","34.4","https://en.wikipedia.org/wiki/Iota_Persei"),("Delta Trianguli","35.2","https://en.wikipedia.org/wiki/Delta_Trianguli"),("Arcturus","36.7","https://en.wikipedia.org/wiki/Arcturus"),("Eta Boötis","37.2","https://en.wikipedia.org/wiki/Eta_Bo%C3%B6tis"),("Iota Pegasi","38.2","https://en.wikipedia.org/wiki/Iota_Pegasi"),("Lambda Serpentis","39.5","https://en.wikipedia.org/wiki/Lambda_Serpentis"),("","40",""),("","41",""),("","42",""),("","43",""),("","44",""),("","45",""),("","46",""),("","47",""),("Nu2 Lupi","48.3","https://en.wikipedia.org/wiki/Nu2_Lupi"),("Mu Arae","49.8","https://en.wikipedia.org/wiki/Mu_Arae"),("","50",""),("","51",""),("","52",""),("","53",""),("","54",""),("","55",""),("Iota Horologii","56.0","https://en.wikipedia.org/wiki/Iota_Horologii"),("","57",""),("","58",""),("","59",""),("","60",""),("","61",""),("","62",""),("","63",""),("","64",""),("","65",""),("","66",""),("","67",""),("","68",""),("","69",""),("","70",""),("","71",""),("","72",""),("","73",""),("","74",""),("","75",""),("","76",""),("","77",""),("","78",""),("","79",""),("","80",""),("","81",""),("","82",""),("","83",""),("","84",""),("","85",""),("","86",""),("","87",""),("","88",""),("","89",""),("","90",""),("","91",""),("","92",""),("","93",""),("","94",""),("","95",""),("","96",""),("","97",""),("","98",""),("","99",""),("","100","")]
    
   
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let year = years[row]
        let myTitle = NSAttributedString(string: year, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBannerOne.delegate = self
        for x in 1...100 {
            if x < 26 {
                years.append("\(x) years old")
            } else {
                years.append("\(x) years young")
            }
        }
        years[0] = "1 year old"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("％@", error)
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.addBannerOne.hidden = false
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondScene = segue.destinationViewController as! SecondViewController
        
        let selectedYearRow = yearPickerView.selectedRowInComponent(0)
        
        let (star, distance, info) = stars[selectedYearRow]
        secondScene.currentBirthdayStar = star
        secondScene.distance = distance
        secondScene.yearsOld = selectedYearRow + 1
        secondScene.starInfo = info
        print(secondScene.yearsOld)
    }
    

}

