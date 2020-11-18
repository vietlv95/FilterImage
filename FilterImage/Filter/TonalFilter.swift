//
//  TonalFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class TonalFilter: Filter {
    override var displayName: String {
        return "Tonal"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIPhotoEffectTonal")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        return filter?.outputImage
    }
}
