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
    var stars = [("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"),("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun"), ("the Alpha Centauri system", "4.4", "https://en.wikipedia.org/wiki/Alpha_Centauri"), ("Barnard's Star", "5.96", "https://en.wikipedia.org/wiki/Barnard%27s_Star"), ("Luhman 16", "6.6", "https://en.wikipedia.org/wiki/Luhman_16"), ("Wolf 359", "7.78", "https://en.wikipedia.org/wiki/Wolf_359"), ("the Sirius system which is the brightest star in the night sky", "8.6", "https://en.wikipedia.org/wiki/Sirius"), ("Ross 154", "9.7", "https://en.wikipedia.org/wiki/Ross_154"), ("Epsilon Eridani", "10.5", "https://en.wikipedia.org/wiki/Epsilon_Eridani"), ("Procyon", "11.4", "https://en.wikipedia.org/wiki/Procyon"), ("Kapteyn's Star", "12.8", "https://en.wikipedia.org/wiki/Kapteyn%27s_Star"), ("Kruger 60", "13.1", "https://en.wikipedia.org/wiki/Kruger_60"), ("Gliese 1", "14.2", "https://en.wikipedia.org/wiki/Gliese_1"), ("Groombridge 1618", "15.8", "https://en.wikipedia.org/wiki/Groombridge_1618"), ("Altair", "16.7", "https://en.wikipedia.org/wiki/Altair"), ("EI Cancri", "17.1", "https://en.wikipedia.org/wiki/G_9-38"), ("Sigma Draconis", "18.77", "https://en.wikipedia.org/wiki/Sigma_Draconis"),("Delta Pavonis","19.92","https://en.wikipedia.org/wiki/Delta_Pavonis"),("Gliese 581","20.7","https://en.wikipedia.org/wiki/Gliese_581"),("V1054 Ophiuchi","21.1","https://en.wikipedia.org/wiki/V1054_Ophiuchi"),("Xi Boötis","21.89","https://en.wikipedia.org/wiki/Xi_Bo%C3%B6tis"),("Gliese 667","23.2","https://en.wikipedia.org/wiki/Gliese_667"),("Fomalhaut","24.8","https://en.wikipedia.org/wiki/Fomalhaut"),("Vega","25.0","https://en.wikipedia.org/wiki/Vega"),("Chi Draconis","26.3","https://en.wikipedia.org/wiki/Chi_Draconis"),("Mu Herculis","27.1","https://en.wikipedia.org/wiki/Mu_Herculis"),("Chi1 Orionis","28.26","https://en.wikipedia.org/wiki/Chi1_Orionis"),("Gamma Leporis","29.3","https://en.wikipedia.org/wiki/Gamma_Leporis"),("Gamma Pavonis","30.21","https://en.wikipedia.org/wiki/Gamma_Pavonis"),("HR 4458","31","https://en.wikipedia.org/wiki/HR_4458"),("Gliese 75","32.8","https://en.wikipedia.org/wiki/HR_511"),("Pollux","33.78","https://en.wikipedia.org/wiki/Pollux_(star)"),("Iota Persei","34.4","https://en.wikipedia.org/wiki/Iota_Persei"),("Denebola","35.9","https://en.wikipedia.org/wiki/Denebola"),("Arcturus","36.7","https://en.wikipedia.org/wiki/Arcturus"),("Eta Boötis","37.2","https://en.wikipedia.org/wiki/Eta_Bo%C3%B6tis"),("Iota Pegasi","38.2","https://en.wikipedia.org/wiki/Iota_Pegasi"),("Lambda Serpentis","39.5","https://en.wikipedia.org/wiki/Lambda_Serpentis"),("Beta Trianguli Australis","40.37","https://en.wikipedia.org/wiki/Beta_Trianguli_Australis"),("Lambda Aurigae","41.2","https://en.wikipedia.org/wiki/Lambda_Aurigae"),("Capella","42.8","https://en.wikipedia.org/wiki/Capella"),("Theta Ursae Majoris","43.96","https://en.wikipedia.org/wiki/Theta_Ursae_Majoris"),("Gamma Cephei","44.9","https://en.wikipedia.org/wiki/Gamma_Cephei"),("47 Ursae Majoris","45.9","https://en.wikipedia.org/wiki/47_Ursae_Majoris"),("Eta Cephei","46.53","https://en.wikipedia.org/wiki/Eta_Cephei"),("Iota Ursae Majoris","47.3","https://en.wikipedia.org/wiki/Iota_Ursae_Majoris"),("Rasalhague","48.6","https://en.wikipedia.org/wiki/Alpha_Ophiuchi"),("Mu Arae","49.8","https://en.wikipedia.org/wiki/Mu_Arae"),("Delta Aquilae","50.6","https://en.wikipedia.org/wiki/Delta_Aquilae"),("Castor","51.0","https://en.wikipedia.org/wiki/Castor_(star)"),("Gliese 777","51.7","https://en.wikipedia.org/wiki/Gliese_777"),("Xi Pegasi","53","https://en.wikipedia.org/wiki/Xi_Pegasi"),("Caph","54.7","https://en.wikipedia.org/wiki/Beta_Cassiopeiae"),("HD 7924","54.8","https://en.wikipedia.org/wiki/HD_7924"),("Iota Horologii","56.0","https://en.wikipedia.org/wiki/Iota_Horologii"),("14 Herculis","57.3","https://en.wikipedia.org/wiki/14_Herculis"),("Menkent","58.8","https://en.wikipedia.org/wiki/Theta_Centauri"),("Sheratan","59.6","https://en.wikipedia.org/wiki/Beta_Arietis"),("Eta Serpentis","60.5","https://en.wikipedia.org/wiki/Eta_Serpentis"),("Mu Virginis","60.9","https://en.wikipedia.org/wiki/Mu_Virginis"),("HD 78366","62.4","https://in-the-sky.org/data/object.php?id=10766"),("Wei","63.7","https://en.wikipedia.org/wiki/Epsilon_Scorpii"),("Gliese 710","64","https://en.wikipedia.org/wiki/Gliese_710"),("Aldebaran","65.3","https://en.wikipedia.org/wiki/Aldebaran"),("53 Aquarii","66","https://en.wikipedia.org/wiki/53_Aquarii"),("Kappa Tucanae","66.6","https://en.wikipedia.org/wiki/Kappa_Tucanae"),("Tau Cygni","68.2","https://en.wikipedia.org/wiki/Tau_Cygni"),("HD 97658","69","https://en.wikipedia.org/wiki/HD_97658"),("Zeta Leporis","70.5","https://en.wikipedia.org/wiki/Zeta_Leporis"),("Alpha Hydri","71.8","https://en.wikipedia.org/wiki/Alpha_Hydri"),("Gienah","72.7","https://en.wikipedia.org/wiki/Epsilon_Cygni"),("Eta Scorpii","73.5","https://en.wikipedia.org/wiki/Eta_Scorpii"),("Unukalhai","74","https://en.wikipedia.org/wiki/Alpha_Serpentis"),("Alpha Coronae Borealis","75.0","https://en.wikipedia.org/wiki/Alpha_Coronae_Borealis"),("HD 1461","75.8","https://en.wikipedia.org/wiki/HD_1461"),("Omega Sagittarii","77.6","https://en.wikipedia.org/wiki/Omega_Sagittarii"),("Kaus Borealis","78.2","https://en.wikipedia.org/wiki/Lambda_Sagittarii"),("Regulus","79.3","https://en.wikipedia.org/wiki/Regulus"),("Delta Velorum","80.6","https://en.wikipedia.org/wiki/Delta_Velorum"),("Menkalinan","81.1","https://en.wikipedia.org/wiki/Beta_Aurigae"),("Alioth","82.6","https://en.wikipedia.org/wiki/Epsilon_Ursae_Majoris"),("Phecda","83.2","https://en.wikipedia.org/wiki/Gamma_Ursae_Majoris"),("Mu Ceti","84","https://en.wikipedia.org/wiki/Mu_Ceti"),("Ankaa","85.0","https://en.wikipedia.org/wiki/Alpha_Phoenicis"),("Mizar and Alcor","86.0","https://en.wikipedia.org/wiki/Mizar_and_Alcor"),("Beta Columbae","87.2","https://en.wikipedia.org/wiki/Beta_Columbae"),("Gacrux","88.6","https://en.wikipedia.org/wiki/Gamma_Crucis"),("Cursa","89.0","https://en.wikipedia.org/wiki/Beta_Eridani"),("Algol","90.0","https://en.wikipedia.org/wiki/Algol"),("Kappa Ophiuchi","91.5","https://en.wikipedia.org/wiki/Kappa_Ophiuchi"),("HD 70642","92","https://en.wikipedia.org/wiki/HD_70642"),("ω² Tauri","93.5","https://en.wikipedia.org/wiki/Omega_Tauri"),("HD 75289","94","https://en.wikipedia.org/wiki/HD_75289"),("Gamma Ophiuchi","95","https://en.wikipedia.org/wiki/Gamma_Ophiuchi"),("Beta Ceti","96.3","https://en.wikipedia.org/wiki/Beta_Ceti"),("Alpheratz","97.0","https://en.wikipedia.org/wiki/Alpha_Andromedae"),("Alpha Indi","98.3","https://en.wikipedia.org/wiki/Alpha_Indi"),("Delta Cassiopeiae","99","https://en.wikipedia.org/wiki/Delta_Cassiopeiae"),("Lambda Geminorum","100.9","https://en.wikipedia.org/wiki/Lambda_Geminorum"), ("UY Scuti(The Largest Known Star)","9500","https://en.wikipedia.org/wiki/UY_Scuti")]
    
   
    
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
            if x < 40 {
                years.append("\(x) years old")
            } else {
                years.append("\(x) years young")
            }
        }
        years[0] = "1 year old"
        years.append("9500 years young")
        yearPickerView.selectRow(3, inComponent: 0, animated: true)
        
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
        
        if segue.identifier == "segueToSecond" {
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

}

