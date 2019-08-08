//
//  ViewController.swift
//  HeroADSViewExamples
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit
import Her

class ViewController: UIViewController {

    let adView = ADView()
    
    let adItem = [
        ADItem(image: URL(string: "https://www.citationbonheur.fr/wp-content/uploads/2018/09/L_influence_du_paysage_sur_le_bonheur.jpg")!, title: "Title", website: URL(string: "https://google.com")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adView.data = adItem
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adView.showAtBottomScreen()
        adView.frame.origin.y = 14
    }
    
}

