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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.originalImage
        
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
    
        if let ciImage = filter.applyFilter(to: CIImage.init(image: self.originalImage)!) {
            cell.previewImageView.image = UIImage.init(ciImage: ciImage)
        } else {
            cell.previewImageView.image = originalImage
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filter = filters[indexPath.row]
        
        if let ciImage = filter.applyFilter(to: CIImage.init(image: self.originalImage)!) {
            self.imageView.image = UIImage.init(ciImage: ciImage)
        } else {
            self.imageView.image = originalImage
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
