//
//  TransferFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class TransferFilter: Filter {
    override var displayName: String {
        return "Transfer"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIPhotoEffectTransfer")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        return filter?.outputImage
    }
}
