//
//  FadeFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class FadeFilter: Filter {
    override var displayName: String {
        return "Fade"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let context = CIContext.init(options: nil)
        let filter = CIFilter.init(name: "CIPhotoEffectFade")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        return filter?.outputImage
    }
}
