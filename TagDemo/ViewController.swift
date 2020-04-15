//
//  ViewController.swift
//  TagDemo
//
//  Created by Quynh on 4/14/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = TagCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(UINib(nibName: "TagCell", bundle: nil), forCellWithReuseIdentifier: "TagCell")
        return collectionView
    }()
    
    let arrTagTitle = ["Sachin Tendulkar", "Virender Sehwag", "Gautam Gambhir", "Virat Kohli", "Yuvraj Singh", "MS Dhoni", "Suresh Raina", "Harbhajan Singh", "Zaheer Khan", "Munaf Patel", "Sreesanth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // hàm layout cho collectionView
    func setupLayout(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
        
        if let flowLayout = collectionView.collectionViewLayout as? TagCollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTagTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        item.tagCell.text = arrTagTitle[indexPath.row]
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
