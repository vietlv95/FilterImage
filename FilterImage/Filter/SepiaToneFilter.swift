//
//  SepiaToneFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class SepiaToneFilter: Filter {
    override var displayName: String {
        return "SepiaTone"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CISepiaTone")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(2, forKey: kCIInputIntensityKey)

        return filter?.outputImage
    }
}
