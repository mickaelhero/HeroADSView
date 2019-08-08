//
//  ViewController.swift
//  HeroADSViewExamples
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit
import HeroADSView

class ViewController: UIViewController {
    
    let adItem = [
        ADItem(image: URL(string: "https://www.citationbonheur.fr/wp-content/uploads/2018/09/L_influence_du_paysage_sur_le_bonheur.jpg")!, title: "Title", website: URL(string: "https://google.com")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let adView = ADView()
        adView.data = adItem
        adView.frame = CGRect(x: 50, y: 50, width: 100, height: 150)
        view.addSubview(adView)

        let adView1 = ADView()
        adView1.data = adItem
        adView1.showAtBottomScreen()
    }
    
}

