//
//  ViewController.swift
//  PhotosExample
//
//  Created by Jinho Choi on 2020/09/21.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem) {
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoAurhorizationsStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationsStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            self.tableView.reloadData()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status{
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                    
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .limited:
            print("접근 제한")
        @unknown default:
            print("error")
        }
        //포토라이브러리가 변화될때마다 uitableview?딜리게이트 메소드가 실행될것
        PHPhotoLibrary.shared().register(self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ImageZoomViewController = segue.destination as? ImageZoomViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        nextViewController.asset = self.fetchResult[index.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        let options: PHImageRequestOptions = PHImageRequestOptions()
        options.resizeMode = PHImageRequestOptionsResizeMode.exact
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: options,
                                  resultHandler: { image, _ in
                                    cell.imageView?.image = image
        })
        
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    //어떤 로우를 편집할수 있게 할거냐 true
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
}
//Library에 변화가 생기면 그걸 우리가 감지를 하겠다.
extension ViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
}
