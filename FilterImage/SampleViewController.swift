//
//  SampleViewController.swift
//  FilterImage
//
//  Created by Viet Le Van on 11/17/20.
//

import UIKit

class SampleViewController: UIViewController {

    let filters = ProviderData.filters
    var tempFilter: Filter?
    var originalImage: UIImage = UIImage.init(named: "hotgirl.png")!
    var resizeImage: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.originalImage
        self.resizeImage = self.originalImage.resizeToFit(maxSize: 200)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.register(UINib.init(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
    }
}

extension SampleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell

        let filter = self.filters[indexPath.row]

        cell.unTitleImageView.isHidden = filter.displayName != "Normal"
        cell.name.text = filter.displayName
        
        if filter == tempFilter {
            cell.showTickMark()
        } else {
            cell.hideTickMark()
        }
    
        if let ciImage = filter.applyFilter(to: CIImage.init(image: self.resizeImage)!) {
            cell.previewImageView.image = UIImage.init(ciImage: ciImage)
        } else {
            cell.previewImageView.image = originalImage
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filter = filters[indexPath.row]
        
        DispatchQueue.global().async {
            if let ciImage = filter.applyFilter(to: CIImage.init(image: self.originalImage)!) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage.init(ciImage: ciImage)
                }
            } else {
                DispatchQueue.main.async {
                    self.imageView.image = self.originalImage
                }
            }
        }
        
    }
}

extension SampleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width
        let contentWidth = cellWidth - (30 * 2)
        return CGSize(width: contentWidth / 4, height: 64)
    }
}


extension UIImage {
    func resizeToFit(maxSize: CGFloat) -> UIImage {
        if self.size.width < size.width && self.size.height < size.height {
            return self
        }
        
        let originSizeRatio = self.size.width/self.size.height
        var targetSize: CGSize
        
        if self.size.width < self.size.height {
            let height = CGFloat.minimum(maxSize, self.size.height)
            targetSize = CGSize(width: height * originSizeRatio, height: height)
        } else {
            let width = CGFloat.minimum(maxSize, self.size.width)
            targetSize = CGSize(width: width, height: width/originSizeRatio)
        }
        
        return self.resize(to: targetSize)
    }
    
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(origin: CGPoint.zero, size:size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? UIImage()
    }
}
