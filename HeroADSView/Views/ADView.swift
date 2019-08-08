//
//  ADView.swift
//  HeroADSView
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit

public class ADView: UIView {
    
    var collectionView: UICollectionView?
    
    public var data = [ADItem]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}


// MARK: - Set view

extension ADView {
    
    func setup() {
        tag = 2395
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
        frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.height - frame.height)
        
        collectionView = createCollectionView()
        
        guard let collectionView = collectionView else { return }
        addSubview(collectionView)
    }
    
    public func showAtBottomScreen() {
        //        guard let window = UIApplication.shared.keyWindow, window.subviews.first(where: { $0.tag == 2395 }) == nil else { return }
        //        window.addSubview(self)
        
        guard let topViewController = UIApplication.getTopViewController(), topViewController.view.subviews.first(where: { $0.tag == 2395 }) == nil else { return }
        topViewController.view.addSubview(self)
    }
    
}


// MARK: Set collectionView and delegate methods

extension ADView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        imageView.loadAndCacheImage(from: data[indexPath.row].image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        
        cell.addSubview(imageView)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let topViewController = UIApplication.getTopViewController() else { return }
        let webView = WebViewController()
        webView.url = data[indexPath.row].website
        webView.adsView = self
        
        //        collectionView.isHidden = true
        
        topViewController.present(webView, animated: true)
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let size = frame.height / 1.3
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: size, height: size)
        layout.scrollDirection = .horizontal
        
        let collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }
    
    func showCollectionView() {
        collectionView?.isHidden = false
    }
    
}

