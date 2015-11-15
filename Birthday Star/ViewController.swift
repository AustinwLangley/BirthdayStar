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
    var stars = [("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"), ("the Alpha Centauri system", "4.4", "https://en.wikipedia.org/wiki/Alpha_Centauri"), ("Barnard's Star", "5.96", "https://en.wikipedia.org/wiki/Barnard%27s_Star"), ("Luhman 16", "6.6", "https://en.wikipedia.org/wiki/Luhman_16"), ("Wolf 359", "7.78", "https://en.wikipedia.org/wiki/Wolf_359"), ("the Sirius system which is the brightest star in the night sky", "8.6", "https://en.wikipedia.org/wiki/Sirius"), ("Ross 154", "9.7", "https://en.wikipedia.org/wiki/Ross_154"), ("Epsilon Eridani", "10.5", "https://en.wikipedia.org/wiki/Epsilon_Eridani"), ("Procyon", "11.4", "https://en.wikipedia.org/wiki/Procyon"), ("Kapteyn's Star", "12.8", "https://en.wikipedia.org/wiki/Kapteyn%27s_Star"), ("Kruger 60", "13.1", "https://en.wikipedia.org/wiki/Kruger_60"), ("Gliese 1", "14.2", "https://en.wikipedia.org/wiki/Gliese_1"), ("Groombridge 1618", "15.8", "https://en.wikipedia.org/wiki/Groombridge_1618"), ("Altair", "16.7", "https://en.wikipedia.org/wiki/Altair"), ("EI Cancri", "17.1", "https://en.wikipedia.org/wiki/G_9-38"), ("Sigma Draconis", "18.77", "https://en.wikipedia.org/wiki/Sigma_Draconis"),("Delta Pavonis","19.92","https://en.wikipedia.org/wiki/Delta_Pavonis"),("Gliese 581","20.7","https://en.wikipedia.org/wiki/Gliese_581"),("V1054 Ophiuchi","21.1","https://en.wikipedia.org/wiki/V1054_Ophiuchi"),("","22",""),("Gliese 667","23.2","https://en.wikipedia.org/wiki/Gliese_667"),("Fomalhaut","24.8","https://en.wikipedia.org/wiki/Fomalhaut"),("Vega","25.0","https://en.wikipedia.org/wiki/Vega"),("Chi Draconis","26.3","https://en.wikipedia.org/wiki/Chi_Draconis"),("Mu Herculis","27.1","https://en.wikipedia.org/wiki/Mu_Herculis"),("Chi1 Orionis","28.26","https://en.wikipedia.org/wiki/Chi1_Orionis"),("Gamma Leporis","29.3","https://en.wikipedia.org/wiki/Gamma_Leporis"),("Gamma Pavonis","30.21","https://en.wikipedia.org/wiki/Gamma_Pavonis"),("HR 4458","31","https://en.wikipedia.org/wiki/HR_4458"),("","32",""),("Pollux","33.78","https://en.wikipedia.org/wiki/Pollux_(star)"),("Iota Persei","34.4","https://en.wikipedia.org/wiki/Iota_Persei"),("Denebola","35.9","https://en.wikipedia.org/wiki/Denebola"),("Arcturus","36.7","https://en.wikipedia.org/wiki/Arcturus"),("Eta Boötis","37.2","https://en.wikipedia.org/wiki/Eta_Bo%C3%B6tis"),("Iota Pegasi","38.2","https://en.wikipedia.org/wiki/Iota_Pegasi"),("Lambda Serpentis","39.5","https://en.wikipedia.org/wiki/Lambda_Serpentis"),("","40",""),("","41",""),("Capella","42.8","https://en.wikipedia.org/wiki/Capella"),("","43",""),("","44",""),("","45",""),("","46",""),("","47",""),("Rasalhague","48.6","https://en.wikipedia.org/wiki/Alpha_Ophiuchi"),("Mu Arae","49.8","https://en.wikipedia.org/wiki/Mu_Arae"),("","50",""),("Castor","51.0","https://en.wikipedia.org/wiki/Castor_(star)"),("","52",""),("","53",""),("Caph","54.7","https://en.wikipedia.org/wiki/Beta_Cassiopeiae"),("","55",""),("Iota Horologii","56.0","https://en.wikipedia.org/wiki/Iota_Horologii"),("","57",""),("Menkent","58.8","https://en.wikipedia.org/wiki/Theta_Centauri"),("","59",""),("","60",""),("","61",""),("","62",""),("Wei","63.7","https://en.wikipedia.org/wiki/Epsilon_Scorpii"),("","64",""),("Aldebaran","65.3","https://en.wikipedia.org/wiki/Aldebaran"),("","66",""),("","67",""),("","68",""),("","69",""),("","70",""),("","71",""),("Gienah","72.7","https://en.wikipedia.org/wiki/Epsilon_Cygni"),("","73",""),("","74",""),("Alpha Coronae Borealis","75.0","https://en.wikipedia.org/wiki/Alpha_Coronae_Borealis"),("","76",""),("","77",""),("","78",""),("Regulus","79.3","https://en.wikipedia.org/wiki/Regulus"),("Delta Velorum","80.6","https://en.wikipedia.org/wiki/Delta_Velorum"),("Menkalinan","81.1","https://en.wikipedia.org/wiki/Beta_Aurigae"),("Alioth","82.6","https://en.wikipedia.org/wiki/Epsilon_Ursae_Majoris"),("Phecda","83.2","https://en.wikipedia.org/wiki/Gamma_Ursae_Majoris"),("","84",""),("Ankaa","85.0","https://en.wikipedia.org/wiki/Alpha_Phoenicis"),("Mizar and Alcor","86.0","https://en.wikipedia.org/wiki/Mizar_and_Alcor"),("","87",""),("Gacrux","88.6","https://en.wikipedia.org/wiki/Gamma_Crucis"),("","89",""),("Algol","90.0","https://en.wikipedia.org/wiki/Algol"),("","91",""),("","92",""),("","93",""),("","94",""),("","95",""),("Beta Ceti","96.3","https://en.wikipedia.org/wiki/Beta_Ceti"),("Alpheratz","97.0","https://en.wikipedia.org/wiki/Alpha_Andromedae"),("","98",""),("","99",""),("","100",""), ("UY Scuti(The Largest Known Star)","9500","https://en.wikipedia.org/wiki/UY_Scuti")]
    
   
    
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
            if x < 30 {
                years.append("\(x) years old")
            } else {
                years.append("\(x) years young")
            }
        }
        years[0] = "1 year old"
        years.append("9500 years young")
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

