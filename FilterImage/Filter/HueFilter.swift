//
//  HueFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import Foundation
import UIKit

class HueFilter: Filter {
    override var displayName: String {
        return "Hue"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIHueAdjust")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(1, forKey: kCIInputAngleKey)

        return filter?.outputImage
    }
}
