//
//  DarkFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class DarkFilter: Filter {
    override var displayName: String {
        return "Dark"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(-0.05, forKey: kCIInputBrightnessKey)
        return filter?.outputImage
    }
}
