//
//  ViewController.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/21/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation
import UIKit
class ViewController: UIViewController {
    
    private let collectionView: UICollectionView
    var refreshControl: UIRefreshControl!
    var listDataModel: DataViewModel = DataViewModel()
    var values: [ListResponse]?
    var details: [Details]?
    var isWating = true
    var  pageNumber  = 0
    
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
        
        //Server Request
        listDataModel.fetchData()
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //To register cell before dequeue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        //Refresh control
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        collectionView.addSubview(refreshControl)
        
    }
    
    //pull to refresh function
    
    func refresh(sender: AnyObject) {
        collectionView.reloadData()
        listDataModel.fetchData()
    }
    
    func doPaging() {
        // call the API in this block and after getting the response then
        
        listDataModel.fetchData()
        collectionView.reloadData()
        self.isWating = false // it’s means paging is done and user can able request another page request by scrolling the tableview at the bottom.
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (values?.count) == nil ? 0 : (values?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        if indexPath.item == (self.values?.count)! - 2 && !isWating {
            isWating = true
            self.pageNumber += 1
            self.doPaging()
        }
        cell.setImage(url: (details?[indexPath.item].imageHref)!)
        cell.set(title: (values?[indexPath.item].title)!)
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap cell index: \(indexPath.item)")
        let detailViewController = DetailViewController()
        detailViewController.modalPresentationStyle = .custom
        present(detailViewController, animated: true, completion: nil)
    }
}
