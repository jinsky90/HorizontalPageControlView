//
//  ViewController.swift
//  HorizontalPageControlView
//
//  Created by 진하늘 on 30/07/2019.
//  Copyright © 2019 진하늘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView   : UICollectionView!
    @IBOutlet weak var pageControl      : HorizontalPageControlView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPageControlTotalCount()
        
        self.collectionView.layer.cornerRadius = 3
        self.collectionView.layer.masksToBounds = true
    }
    
    func setPageControlTotalCount() {
        // must set HorizontalPageControlView totalPageCount
        self.pageControl.totalPageCount = 7
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell {
            cell.imageView.image = UIImage(named: "\(indexPath.row + 1)")
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // must set HorizontalPageControlView indicatorOffset
        let offset = scrollView.contentOffset.x / scrollView.bounds.width
        self.pageControl?.indicatorOffset = offset
    }
}

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}


