//
//  ViewController.swift
//  FriendsCollection
//
//  Created by Jinho Choi on 2020/09/29.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.numberOfCell
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? FriendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let friend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.addressLabel.text = friend.fullAddress
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.collectionView.reloadData()
    }


}

