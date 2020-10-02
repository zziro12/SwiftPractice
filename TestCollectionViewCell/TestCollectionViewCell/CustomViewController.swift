//
//  CustomViewController.swift
//  TestCollectionViewCell
//
//  Created by Jinho Choi on 2020/10/03.
//

import UIKit
import Photos

class CustomViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifier: String = "cell"
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "앨범"
        
        //스토리보드에서 컬렉션뷰 사이즈인스팩터에서 추정사이즈 None으로 바꾸면 적용됨..
//        let layout = UICollectionViewFlowLayout()
//        collectionView.collectionViewLayout = layout
        
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            print("접근 허가")
            self.requestCollection()
            self.collectionView.reloadData()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("응답하지 않음")
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.collectionView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허")
                default:
                    break
                }
            }
        case .restricted:
            print("restricted 접근제한")
        case .limited:
            print("restricted 접근제한")
        @unknown default:
            break
        }
    }
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }

}
extension CustomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        let asset: PHAsset = self.fetchResult.object(at: indexPath.item)
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 100, height: 100),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in
                                    cell.imageView.image = image
                                  })
        
        return cell
    }
}
extension CustomViewController: UICollectionViewDelegate {
    
}

extension CustomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItem = 3
        let width: CGFloat = (UIScreen.main.bounds.width/CGFloat(numberOfItem)) - 1
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
    //아이템간간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //라인간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
