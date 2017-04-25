//
//  FirstViewController.swift
//  Birthday Star
//
//  Created by AL on 11/11/15.
//  Copyright © 2015 AL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var yearPickerView: UIPickerView!
    
    @IBOutlet weak var starButton: UIButton!
    
    var years = [String]()
    var stars = [("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun", "It is also referred to as a yellow dwarf star.", "It is 4.5 billion years old.", "It is middle aged and will remain stable for 4 billion more years."),
        ("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun", "Its diameter is about 109 times that of Earth", "It has a mass about 330,000 times that of Earth.", "About three quarters of the Sun's mass consists of hydrogen."),
        ("the Sun", "eight light minutes", "https://en.wikipedia.org/wiki/Sun", "The Sun lies close to the inner rim of the Milky Way's Orion Arm.", "It takes the Sun about 250 million years to complete one orbit through the Milky Way (a galactic year).", "In 5.4 billion years the Sun will start to turn into a red giant."),
        ("the Alpha Centauri system", "4.4", "https://en.wikipedia.org/wiki/Alpha_Centauri", "It is the closest known star to us.", "Pandora,  from the movie Avatar, was fictionally part of this solar system.", "It is the brightest star in the southern constellation of Centaurus."),
        ("Barnard's Star", "5.96", "https://en.wikipedia.org/wiki/Barnard%27s_Star", "It is is a very-low-mass red dwarf star.", "It is in the constellation of Ophiuchus.", "It is the fourth-closest known individual star to the Sun."),
        ("Luhman 16", "6.6", "https://en.wikipedia.org/wiki/Luhman_16", "It is a binary (two star) brown-dwarf system.", "It is in the southern constellation Vela.", "They are the closest known brown-dwarfs."),
        ("Wolf 359", "7.78", "https://en.wikipedia.org/wiki/Wolf_359", "It is in the constellation Leo.", "It is a relatively young star with an age of less than a billion years.  The Sun is 4.5 billion years old.", "It is the subject of numerous Star Trek Episodes, including Battle of Wolf 359."),
        ("the Sirius system", "8.6", "https://en.wikipedia.org/wiki/Sirius", "It is the brightest star in the night sky, almost twice as bright as the next brightest star.", "It is a binary star (two star) system.", "It is gradually moving closer to us over the next 60,000 years."),
        ("Ross 154", "9.7", "https://en.wikipedia.org/wiki/Ross_154", "It is a star in the constellation of Sagittarius.", "It is a red dwarf star.", "It has an estimated mass that is only 17% of our Sun."),
        ("Epsilon Eridani", "10.5", "https://en.wikipedia.org/wiki/Epsilon_Eridani", "It is a star in the southern constellation Eridanus.", "It’s age is estimated at less than a billion years.  The Sun is 4.5 billion years old.", "The system includes two belts of rocky asteroids."),
        ("Procyon", "11.4", "https://en.wikipedia.org/wiki/Procyon", "It is the brightest star in the constellation Canis Minor.", "The eighth brightest in the night sky.", "It appears on the flag of Brazil, symbolizing the state of Amazonas."),
        ("Kapteyn's Star", "12.8", "https://en.wikipedia.org/wiki/Kapteyn%27s_Star", "It is a red dwarf.", "Its diameter is 30% of our Sun’s.", "It possibly has two planets orbiting it, Kapteyn b and Kapteyn c.  Kapteyn b is in the habitable zone and may have life."),
        ("Kruger 60", "13.1", "https://en.wikipedia.org/wiki/Kruger_60", "It is a binary star (two star) system.", "The two stars of the system are roughly the average distance of Saturn from the Sun.", "Both are red dwarf stars."),
        ("Gliese 1", "14.2", "https://en.wikipedia.org/wiki/Gliese_1", "It is a red dwarf.", "It is in the constellation Sculptor.", "It is estimated to have 45–48% of the Sun's mass."),
        ("Groombridge 1618", "15.8", "https://en.wikipedia.org/wiki/Groombridge_1618", "It is in the constellation Ursa Major.", "It is an orange dwarf star.", "It has 67% of the mass of the Sun."),
        ("Altair", "16.7", "https://en.wikipedia.org/wiki/Altair", "It is the twelfth brightest star in the night sky.", "It is the brightest star in the constellation Aquila.", "It is approximately 1.8 times the mass of the Sun."),
        ("EI Cancri", "17.1", "https://en.wikipedia.org/wiki/G_9-38", "It is a binary star (two star) system.", "It consists of two M-type stars.", "In the Star Trek Universe, it would be considered in Federation Space."),
        ("Sigma Draconis", "18.77", "https://en.wikipedia.org/wiki/Sigma_Draconis", "It is in the constellation Draco.", "It has 87% of the Sun's mass.", "It has an unconfirmed Uranus-mass planet on a 308-day orbit."),
        ("Delta Pavonis","19.92","https://en.wikipedia.org/wiki/Delta_Pavonis", "It is in the southern constellation of Pavo.", "It is visible to the naked eye from the southern hemisphere.", "It has 99.1% of the Sun's mass and it’s radius is 22% larger than our sun."),
        ("Gliese 581","20.7","https://en.wikipedia.org/wiki/Gliese_581", "It is confirmed to have three planets orbiting it named: b, c and e.", "Gliese 581 c, was the first low-mass extrasolar planet found near a habitable zone.", "It is an M-class dwarf star."),
        ("V1054 Ophiuchi","21.1","https://en.wikipedia.org/wiki/V1054_Ophiuchi", "It is part of a quintuple(5) star system.", "All of the stars of the system are of type red dwarf.", "It is located in constellation Ophiuchus."),
        ("Xi Boötis","21.89","https://en.wikipedia.org/wiki/Xi_Bo%C3%B6tis", "It is a binary star (two star) system.", "It is the nearest visible star in the constellation Boötes.", "It is visible to the naked eye."),
        ("Gliese 667","23.2","https://en.wikipedia.org/wiki/Gliese_667", "It is a triple star system.", "It is in the constellation of Scorpius.", "It has two confirmed planets in orbit, planet Gliese 667 Cc is thought to be habitable."),
        ("Fomalhaut","24.8","https://en.wikipedia.org/wiki/Fomalhaut", "It is the brightest star in the constellation Piscis Austrinus.", "It is the first star system with a planet (Fomalhaut b) that has been imaged.", "It is the 18th brightest star in the night sky."),
        ("Vega","25.0","https://en.wikipedia.org/wiki/Vega", "It is the fifth brightest star in the night sky.", "In the movie, Contact, Vega was the origin of the message discovered by Ellie.", "It is the brightest star in the constellation Lyra."),
        ("Chi Draconis","26.3","https://en.wikipedia.org/wiki/Chi_Draconis", "It is a star system in the constellation Draco consisting of two stars.", "The first star is a yellow-white star with a mass approximately equal to that of the sun.", "In the Babylon 5 TV series, it is the home of the Minbari race."),
        ("Mu Herculis","27.1","https://en.wikipedia.org/wiki/Mu_Herculis", "It is beginning to expand to become a giant.", "Its mass is about 1.1 times that of the Sun.", "It is in the constellation Hercules."),
        ("Chi1 Orionis","28.26","https://en.wikipedia.org/wiki/Chi1_Orionis", "It is in the constellation Orion.", "In constellation Orion, it is the tip of the Hunter's upraised club.", "It has a red dwarf companion star."),
        ("Gamma Leporis","29.3","https://en.wikipedia.org/wiki/Gamma_Leporis", "It is located in the south central part of the constellation Lepus.", "It is 1.3 times the Sun's mass.", "It has a companion star, AK Leporis."),
        ("Gamma Pavonis","30.21","https://en.wikipedia.org/wiki/Gamma_Pavonis", "It is in the southern constellation of Pavo.", "It is visible in the night sky.", "It has 152% of the Sun's luminosity."),
        ("HR 4458","31","https://en.wikipedia.org/wiki/HR_4458", "It is a binary star (two star) system.", "It is in the constellation Hydra.", "It is a white dwarf star."),
        ("Gliese 75","32.8","https://en.wikipedia.org/wiki/HR_511", "It is an orange dwarf star.", "It is in the constellation Cassiopeia.", "It is estimated to be about the same age as the sun."),
        ("Pollux","33.78","https://en.wikipedia.org/wiki/Pollux_(star)", "It is the brightest star in the northern constellation of Gemini.", "It is the 17th brightest star in the night sky.", "It has a confirmed planet orbiting it called, Thestias."),
        ("Iota Persei","34.4","https://en.wikipedia.org/wiki/Iota_Persei", "It is in the constellation Perseus.", "It is somewhat larger and greater in mass than the Sun.", "It is a yellow-orange dwarf star."),
        ("Denebola","35.9","https://en.wikipedia.org/wiki/Denebola", "It is the third brightest star in constellation of Leo.", "It is visible to the naked eye.", "Its age is estimated at less than 400 million years.  The Sun is 4.5 billion years old."),
        ("Arcturus","36.7","https://en.wikipedia.org/wiki/Arcturus", "It is the 4th brightest star in the night sky.", "It is in the the constellation Boötes.", "It is a red giant star, its radius is 25 times larger than the Sun."),
        ("Eta Boötis","37.2","https://en.wikipedia.org/wiki/Eta_Bo%C3%B6tis", "It is a star in the constellation Boötes.", "It has 2.7 times the Sun's radius.", "It is classified as a subgiant."),
        ("Iota Pegasi","38.2","https://en.wikipedia.org/wiki/Iota_Pegasi", "It is located within the constellation Pegasus.", "It has a companion star, Iota Pegasi B.", "Iota Pegasi A is a yellowish-white star somewhat brighter than the sun."),
        ("Lambda Serpentis","39.5","https://en.wikipedia.org/wiki/Lambda_Serpentis", "It is in the constellation Serpens, in its head (Serpens Caput).", "It is visible to the naked eye in the night sky.", "It is moving toward us and will be 7.4 light years away in 166,000 years."),
        ("Beta Trianguli Australis","40.37","https://en.wikipedia.org/wiki/Beta_Trianguli_Australis", "It is a double star in the southern constellation of Triangulum Australe.", "It appears on the flag of Brazil, symbolizing the state of Santa Catarina.", "It is only 12 million years old. The Sun is 4.5 billion years old."),
        ("Lambda Aurigae","41.2","https://en.wikipedia.org/wiki/Lambda_Aurigae", "It is in the northern constellation of Auriga.", "It is visible to the naked eye.", "It is 73% more luminous than the Sun."),
        ("Capella","42.8","https://en.wikipedia.org/wiki/Capella", "It is the brightest star in the constellation Auriga.", "It is the sixth brightest in the night sky.", "It is actually a star system of four stars in two binary pairs."),
        ("Theta Ursae Majoris","43.96","https://en.wikipedia.org/wiki/Theta_Ursae_Majoris", "It is in the constellation of Ursa Major.", "It may actually be a  triple star system.", "It is larger than the Sun with 141% of the Sun's mass and 250% of the Sun's radius."),
        ("Gamma Cephei","44.9","https://en.wikipedia.org/wiki/Gamma_Cephei", "It is a binary star (two star) system.", "It is in the constellation of Cepheus.", "It has a planet called, Tadmor."),
        ("47 Ursae Majoris","45.9","https://en.wikipedia.org/wiki/47_Ursae_Majoris", "It is in the constellation of Ursa Major.", "It has three planets in orbit around it.", "It is visible to the naked eye."),
        ("Eta Cephei","46.53","https://en.wikipedia.org/wiki/Eta_Cephei", "It is in the constellation of Cepheus.", "It is visible to the naked eye.", "It is 1.6 times the Sun's mass."),
        ("Iota Ursae Majoris","47.3","https://en.wikipedia.org/wiki/Iota_Ursae_Majoris", "It is in the constellation of Ursa Major.", "It is visible to the naked eye.", "It was also named Dnoces (Second, backwards) after Edward H. White II, an Apollo 1 astronaut by his fellow astronaut Gus Grissom as a practical joke."),
        ("Rasalhague","48.6","https://en.wikipedia.org/wiki/Alpha_Ophiuchi", "It is the brightest star in the constellation Ophiuchus.", "It is a binary star (two star) system.", "The primary star in the system, Alpha Ophiuchi A, has a mass of about 2.4 times the mass of the Sun."),
        ("Mu Arae","49.8","https://en.wikipedia.org/wiki/Mu_Arae", "It has four known extrasolar planets named Quijote, Dulcinea, Rocinante and Sancho.", "It is significantly older than the sun, at around 6.34 billion years.", "It is in the constellation of Ara."),
        ("Delta Aquilae","50.6","https://en.wikipedia.org/wiki/Delta_Aquilae", "It is a binary star (two star) system.", "The main star’s mass is 65% greater than the Sun and it has expanded to more than double the Sun's radius.", "It is in the constellation of Aquila."),
        ("Castor","51.0","https://en.wikipedia.org/wiki/Castor_(star)", "It is the second brightest star in the constellation Gemini.", "It is a complex multiple star system made up of six individual stars.", "It is the 24th brightest star in the night sky."),
        ("Gliese 777","51.7","https://en.wikipedia.org/wiki/Gliese_777", "It is a binary star system made up of two stars and possibly a third.", "It is a yellow subgiant.", "Two extrasolar planets are known to orbit the primary star of the binary star system."),
        ("Xi Pegasi","53","https://en.wikipedia.org/wiki/Xi_Pegasi", "It is a star in the constellation Pegasus.", "It has a mass of 1.25 to 1.3 times that of the Sun.", "It is the primary component of a multiple-star system."),
        ("Caph","54.7","https://en.wikipedia.org/wiki/Beta_Cassiopeiae", "It is in the constellation Cassiopeia.", "It is a yellow-white hued subgiant or giant star.", "It completes a full rotation every 1.12–1.16 days giving it a bulge in the middle."),
        ("HD 7924","54.8","https://en.wikipedia.org/wiki/HD_7924", "It is located in the constellation Cassiopeia.", "It has three planets that orbit it.", "It is only 80% the mass of the Sun."),
        ("Iota Horologii","56.0","https://en.wikipedia.org/wiki/Iota_Horologii", "It is a  yellow dwarf star.", "It has a Jupiter sized planet orbiting it.", "It is 50% more luminous than the Sun."),
        ("14 Herculis","57.3","https://en.wikipedia.org/wiki/14_Herculis", "It is in the constellation Hercules.", "It has two planets that orbit it.", "It is an orange dwarf star."),
        ("Menkent","58.8","https://en.wikipedia.org/wiki/Theta_Centauri", "It is a star in the southern constellation of Centaurus, the centaur.", "It is the fourth brightest member of the constellation.", "It is an evolved giant star and has a radius that is 10.6 times the radius of the Sun."),
        ("Sheratan","59.6","https://en.wikipedia.org/wiki/Beta_Arietis", "It is a binary star (two star) system.", "It is in the constellation Aries.", "Its mass is 2.34 times the Sun."),
        ("Eta Serpentis","60.5","https://en.wikipedia.org/wiki/Eta_Serpentis", "It is a star in the constellation Serpens.", "It is visible to the naked eye.", "Its radius is six times the sun."),
        ("Mu Virginis","60.9","https://en.wikipedia.org/wiki/Mu_Virginis", "It is a star in the constellation Virgo.", "It is 1.7 times the mass of the Sun.", "It is a yellow star."),
        ("Gliese 710","62","https://en.wikipedia.org/wiki/Gliese_710", "It is in the constellation Serpens Cauda.", "It is only about 60% of the Sun's mass.", "It is approaching us and will be within 1 light year in 1.4 million years."),
        ("V452 Vulpeculae","63.4","https://en.wikipedia.org/wiki/HD_189733", "It is a binary star (two star) system.", "It is in the constellation of Vulpecula (the Fox).", "It has a planet that orbits it that is slightly larger then Jupiter."),
        ("Wei","63.7","https://en.wikipedia.org/wiki/Epsilon_Scorpii", "It is in the constellation of Scorpius.", "It appears on the flag of Brazil, symbolizing the state of Ceara.", "Its radius is 13 times the radius of the sun"),
        ("Aldebaran","65.3","https://en.wikipedia.org/wiki/Aldebaran", "It is the brightest star in the constellation of Taurus.", "Nasa probe Pioneer 10 is currently heading in the general direction of the star and should make its closest approach in about two million years.", "It has been mentioned in fictional works such as Lord of The Rings and Star Trek."),
        ("53 Aquarii","66","https://en.wikipedia.org/wiki/53_Aquarii", "It is a binary star (two star) system.", "It is visible to the naked eye.", "It is the same size as our sun."),
        ("Kappa Tucanae","66.6","https://en.wikipedia.org/wiki/Kappa_Tucanae", "It consists of two binary pairs (a total of four stars).", "It is in the constellation Tucana.", "The brightest star in the system is Kappa Tucanae A, is a yellow-white subgiant."),
        ("Tau Cygni","68.2","https://en.wikipedia.org/wiki/Tau_Cygni", "It is a binary star (two star) system", "It is in the constellation Cygnus.", "The main star is a yellowish white subgiant star."),
        ("HD 97658","69","https://en.wikipedia.org/wiki/HD_97658", "It is located in the constellation of Leo.", "A super-earth was discovered orbiting the star.", "The star is only 75% the mass of our Sun."),
        ("Zeta Leporis","70.5","https://en.wikipedia.org/wiki/Zeta_Leporis", "It is located in the southern constellation of Lepus.", "It is bright enough to be seen with the naked eye.", "An asteroid belt orbits the star."),
        ("Alpha Hydri","71.8","https://en.wikipedia.org/wiki/Alpha_Hydri", "It is the second brightest star in the southern constellation of Hydrus.", "It is a subgiant star that is 80% larger then our Sun.", "It is readily visible by the naked eye."),
        ("Gienah","72.7","https://en.wikipedia.org/wiki/Epsilon_Cygni", "It is a star in the constellation Cygnus.", "It is readily visible to the naked eye.", "It is a giant star that is about 11 times the radius of the Sun."),
        ("Eta Scorpii","73.5","https://en.wikipedia.org/wiki/Eta_Scorpii", "It is in the southern zodiac constellation of Scorpius.", "It has around 175% of the Sun's mass.", "It is rotating rapidly, completing a turn in less than a day."),
        ("Unukalhai","74","https://en.wikipedia.org/wiki/Alpha_Serpentis", "It is in the equatorial constellation Serpens.", "It is the brightest star in the constellation and it can be viewed with the naked eye.", "It is classified as a giant star and has a radius of about 12 times the radius of the Sun."),
        ("Alpha Coronae Borealis","75.0","https://en.wikipedia.org/wiki/Alpha_Coronae_Borealis", "It is a binary star (two star) system.", "It is in the constellation Corona Borealis.", "The main star has 2.6 times the mass of the Sun."),
        ("HD 1461","75.8","https://en.wikipedia.org/wiki/HD_1461", "It is in the constellation of Cetus.", "It has at least one planet orbiting it.", "It is slightly larger than our Sun."),
        ("Omega Sagittarii","77.6","https://en.wikipedia.org/wiki/Omega_Sagittarii", "It is in the constellation of Sagittarius.", "It is slightly larger than our Sun.", "It is classified as a  G-type subgiant star."),
        ("Kaus Borealis","78.2","https://en.wikipedia.org/wiki/Lambda_Sagittarii", "It is within the southern constellation of Sagittarius.", "It is readily visible to the naked eye.", "Its radius is about 11 times the radius of the Sun."),
        ("Regulus","79.3","https://en.wikipedia.org/wiki/Regulus", "It is the brightest star in the constellation Leo.", "It is the 21st brightest star in the night sky.", "It is a multiple star system composed of four stars."),
        ("Delta Velorum","80.6","https://en.wikipedia.org/wiki/Delta_Velorum", "It is in the southern constellation Vela.", "It is a triple star system.", "All the stars in the system are larger in mass than the Sun."),
        ("Menkalinan","81.1","https://en.wikipedia.org/wiki/Beta_Aurigae", "It is in the northern constellation of Auriga.", "It is the second brightest member of the constellation.", "It is a binary star (two star) system."),
        ("Alioth","82.6","https://en.wikipedia.org/wiki/Epsilon_Ursae_Majoris", "It is the brightest star in the constellation Ursa Major.", "It is the star in the handle of the big dipper closest to the bowl.", "The USS Allioth was a United States Navy ship named after the star."),
        ("Phecda","83.2","https://en.wikipedia.org/wiki/Gamma_Ursae_Majoris", "It is in the constellation Ursa Major.", "It is the lower-left star forming the bowl of the Big Dipper.", "Its radius is three times that of the Sun."),
        ("Mu Ceti","84","https://en.wikipedia.org/wiki/Mu_Ceti", "It is a quadruple visual star system.", "It is located in the constellation Cetus.", "It has a mass 1.6 times the Sun."),
        ("Ankaa","85.0","https://en.wikipedia.org/wiki/Alpha_Phoenicis", "It is the brightest star in the constellation Phoenix.", "It is a binary star (two star) system.", "It is an Orange giant star and has a radius that is 15 times the Sun."),
        ("Mizar and Alcor","86.0","https://en.wikipedia.org/wiki/Mizar_and_Alcor", "It is a double star in the handle of the Big Dipper.", "Together, they form a six star system.", "In the 1998 movie Deep Impact, Mizar and Alcor are the stars beside which a young astronomer discover a comet on a collision path to Earth."),
        ("Beta Columbae","87.2","https://en.wikipedia.org/wiki/Beta_Columbae", "It is the second brightest star in the southern constellation of Columba.", "It is bright enough to be viewed with the naked eye even from an urban location.", "Its radius is 11.5 times the radius of the Sun."),
        ("Gacrux","88.6","https://en.wikipedia.org/wiki/Gamma_Crucis", "It is the nearest red giant star to the Sun.", "It is the third-brightest star in the southern constellation of Crux.", "Its radius is 84 times the radius of the Sun."),
        ("Cursa","89.0","https://en.wikipedia.org/wiki/Beta_Eridani", "It is the second brightest star in the constellation of Eridanus.", "It can be viewed by the naked eye.", "It has been mentioned in Star Trek as a system being controlled by the Klingons."),
        ("Algol","90.0","https://en.wikipedia.org/wiki/Algol", "It is a bright star in the constellation Perseus.", "It is a three-star system.", "Part of the three-star system is an eclipsing binary star system."),
        ("Kappa Ophiuchi","91.5","https://en.wikipedia.org/wiki/Kappa_Ophiuchi", "It is a star in the equatorial constellation Ophiuchus.", "It is visible to the naked eye.", "It has 11 times the radius of our Sun."),
        ("HD 70642","92","https://en.wikipedia.org/wiki/HD_70642", "A planet has been found orbiting this star.", "This system is one of the most similar in conditions to our solar system than any other currently known planetary systems.", "It has about the same mass and radius as the Sun."),
        ("ω² Tauri","93.5","https://en.wikipedia.org/wiki/Omega_Tauri", "It is in the constellation Taurus.", "It is a binary star (two star) system.", "Its radius is 1.5 times the Sun."),
        ("HD 75289","94","https://en.wikipedia.org/wiki/HD_75289", "It is a star in the constellation of Vela.", "Like our Sun, it is a yellow dwarf.", "It has a planet orbiting it."),
        ("Gamma Ophiuchi","95","https://en.wikipedia.org/wiki/Gamma_Ophiuchi", "It is a star in the constellation Ophiuchus.", "It is only 184 million years.  Our Sun is 4.5 billion years old.", "It has nearly three times the mass of the Sun."),
        ("Beta Ceti","96.3","https://en.wikipedia.org/wiki/Beta_Ceti", "It is the brightest star in the constellation Cetus.", "It has an orange giant star classification.", "Its radius is over 17 times as large as the Sun."),
        ("Alpheratz","97.0","https://en.wikipedia.org/wiki/Alpha_Andromedae", "It is the brightest star in the constellation of Andromeda.", "It is a binary star (two star) system.", "It is the brightest mercury-manganese star known."),
        ("Alpha Indi","98.3","https://en.wikipedia.org/wiki/Alpha_Indi", "It is in the constellation Indus.", "Its radius is about 12 times the radius of the Sun.", "It is only a billion years old.  Our Sun is 4.5 billion years old."),
        ("Delta Cassiopeiae","99","https://en.wikipedia.org/wiki/Delta_Cassiopeiae", "It is in the constellation of Cassiopeia.", "It is an eclipsing binary star system consisting of a pair of stars that orbit about each other over a period of 759 days.", "The system has an estimated age of 600 million years.  Our Sun is 4.5 billion years old."),
        ("Lambda Geminorum","100.9","https://en.wikipedia.org/wiki/Lambda_Geminorum", "It is in the constellation Gemini.", "Its radius is 2.8 times the radius of the Sun.", "It is only 800 million years old.  Our Sun is 4.5 billion years old."),
        ("UY Scuti(The Largest Known Star)","9500","https://en.wikipedia.org/wiki/UY_Scuti", "It has been classified as bright red supergiant.", "It has a radius that is 1708 times the radius of the Sun.", "If it was placed at the center of our Solar System, it would engulf the orbit of Jupiter.")]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let year = years[row]
        let myTitle = NSAttributedString(string: year, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.white])
        return myTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem = backButton
        
        starButton.backgroundColor = UIColor.clear
        starButton.layer.cornerRadius = 5
        starButton.layer.borderWidth = 2
        starButton.layer.borderColor = UIColor.white.cgColor
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecond" {
            let secondScene = segue.destination as! SecondViewController
            
            let selectedYearRow = yearPickerView.selectedRow(inComponent: 0)
            
            let (star, distance, info, factOne, factTwo, factThree) = stars[selectedYearRow]
            secondScene.currentBirthdayStar = star
            secondScene.distance = distance
            secondScene.yearsOld = selectedYearRow + 1
            secondScene.starInfo = info
            secondScene.starFactOne = factOne
            secondScene.starFactTwo = factTwo
            secondScene.starFactThree = factThree
        }
    }
}
