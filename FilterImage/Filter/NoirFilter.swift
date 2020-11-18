//
//  NoirFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class NoirFilter: Filter {
    override var displayName: String {
        return "Noir"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIPhotoEffectNoir")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        return filter?.outputImage
    }
}
