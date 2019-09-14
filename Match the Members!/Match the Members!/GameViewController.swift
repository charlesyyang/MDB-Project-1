//
//  GameViewController.swift
//  Match the Members!
//
//  Created by Charles Yang on 9/12/19.
//  Copyright © 2019 Charles Yang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var PictureView: UIImageView!
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var Name1: UIButton!
    @IBOutlet weak var Name2: UIButton!
    @IBOutlet weak var Name3: UIButton!
    @IBOutlet weak var Name4: UIButton!
    
    var Score: Int!
    
    var currName: String!
    var randName1: String!
    var randName2: String!
    var randName3: String!
    
    var corPlace: Int!
    var place2: Int!
    var place3: Int!
    var place4: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =
        "Score: 0"
        Score = 0
        randomPicture()
        assignCorrectButton()
        place2 = corPlace
        place3 = corPlace
        place4 = corPlace
        
        randName1 = currName
        randName2 = currName
        randName3 = currName
        
        assignButtons()
        random3Names()
        assignName(buttonNum: place2, name: randName1)
        assignName(buttonNum: place3, name: randName2)
        assignName(buttonNum: place4, name: randName3)
        
        Name1.titleLabel?.numberOfLines = 1;
        Name1.titleLabel?.adjustsFontSizeToFitWidth = true;
        
        Name2.titleLabel?.numberOfLines = 1;
        Name2.titleLabel?.adjustsFontSizeToFitWidth = true;
        
        Name3.titleLabel?.numberOfLines = 1;
        Name3.titleLabel?.adjustsFontSizeToFitWidth = true;
        
        Name4.titleLabel?.numberOfLines = 1;
        Name4.titleLabel?.adjustsFontSizeToFitWidth = true;
    }

    
    /// Takes the correct name which was generated first and sets the image to match that name. Also assigns it a button
    func randomPicture() {
        currName = Constants.names.randomElement()
        PictureView.image = Constants.getImageFor(name: currName)
        corPlace = Int.random(in: 1 ..< 5)
        
    }
    
    /// Gets 3 unique names that aren't the correct name
    func random3Names() {
        while (randName1 == currName) {
            randName1 = Constants.names.randomElement()
            
        }
        while (randName2 == currName || randName2 == randName1) {
            randName2 = Constants.names.randomElement()
        }
        while (randName3 == currName || randName3 == randName1 || randName3 == randName2) {
            randName3 = Constants.names.randomElement()
        }
    }
    
    /// Assigns the button name of the correct name to the right button
    func assignCorrectButton() {
        if (corPlace == 1) {
            Name1.setTitle(currName, for: .normal)
        }
        if (corPlace == 2) {
            Name2.setTitle(currName, for: .normal)
        }
        if (corPlace == 3) {
            Name3.setTitle(currName, for: .normal)
        }
        if (corPlace == 4) {
            Name4.setTitle(currName, for: .normal)
        }
        
    }
    
    /// Assigns button numbers to the randon names
    func assignButtons() {
        while (place2 == corPlace) {
            place2 = Int.random(in: 1 ..< 5)
        }
        while (place3 == corPlace || place3 == place2) {
            place3 = Int.random(in: 1 ..< 5)
        }
        while (place4 == corPlace || place4 == place2 || place4 == place3) {
            place4 = Int.random(in: 1 ..< 5)
        }
    }
    
    /// Sets the name of a button
    ///
    /// - Parameters:
    ///   - buttonNum: Input button position
    ///   - name: Input button name
    func assignName(buttonNum: Int,name: String) {
        if (buttonNum == 1) {
            Name1.setTitle(name, for: .normal)
        }
        if (buttonNum == 2) {
            Name2.setTitle(name, for: .normal)
        }
        if (buttonNum == 3) {
            Name3.setTitle(name, for: .normal)
        }
        if (buttonNum == 4) {
            Name4.setTitle(name, for: .normal)
        }
    }
    
    func score() {
        Score += 1
        self.navigationItem.title =
        "Score: \(Score!)"
        randomPicture()
        assignCorrectButton()
        place2 = corPlace
        place3 = corPlace
        place4 = corPlace
        
        randName1 = currName
        randName2 = currName
        randName3 = currName
        
        assignButtons()
        random3Names()
        assignName(buttonNum: place2, name: randName1)
        assignName(buttonNum: place3, name: randName2)
        assignName(buttonNum: place4, name: randName3)
        
    }
    @IBAction func Button1(_ sender: Any) {
        if (Name1.titleLabel?.text == currName) {
            score()
        }
    }
    @IBAction func Button2(_ sender: Any) {
        if (Name2.titleLabel?.text == currName) {
            score()
        }
    }
    @IBAction func Button3(_ sender: Any) {
        if (Name3.titleLabel?.text == currName) {
            score()
        }
    }
    @IBAction func Button4(_ sender: Any) {
        if (Name4.titleLabel?.text == currName) {
            score()
        }
    }
}

