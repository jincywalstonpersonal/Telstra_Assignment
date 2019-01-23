//
//  CollectionViewController.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/21/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    private let collectionView: UICollectionView
    
    init() {
        let layout = UICollectionViewFlowLayout()
        
        // calculate cell size (margin: 5px, column: 3)
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth: CGFloat = (screenWidth - 5 * 2) / 3
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // you have to register cell before dequeue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.set(title: "Cell-\(indexPath.item)")
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap cell index: \(indexPath.item)")
    }
}
