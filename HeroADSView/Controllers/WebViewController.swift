//
//  WebViewController.swift
//  HeroADSView
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit
import WebKit

// MARK: - WebView controller

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    var url: URL?
    var adsView: ADView?
    
    var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}


// MARK: - Setup controller

extension WebViewController {
    
    private func setup() {
        view.backgroundColor = .white
        view.frame = UIScreen.main.bounds
        
        addingCloseBtn()
        addingWebView()
        setWebView()
        
        guard let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(view)
    }
    
    private func addingCloseBtn() {
        closeButton = UIButton(frame: CGRect(x: 8, y: UIApplication.shared.statusBarView!.frame.height + 8, width: 50, height: 22))
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.black, for: .normal)
        
        closeButton.addTappedGesture {
            self.dismiss(animated: true) {
                //                self.adsView?.showCollectionView()
            }
        }
        
        view.addSubview(closeButton)
    }
    
    private func addingWebView() {
        webView = WKWebView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarView!.frame.height + 16 + closeButton.frame.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50))
        view.addSubview(webView)
    }
    
    private func setWebView() {
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}

