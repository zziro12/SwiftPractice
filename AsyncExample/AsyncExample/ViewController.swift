//
//  ViewController.swift
//  AsyncExample
//
//  Created by Jinho Choi on 2020/09/27.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        //이미지 다운로드 -> 이미지 뷰에 셋팅
        print("button")
        
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
        
        
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

