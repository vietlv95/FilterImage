//
//  ChromeFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class ChromeFilter: Filter {
    override var displayName: String {
        return "Chrome"
    }

    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        let filter = CIFilter.init(name: "CIPhotoEffectChrome")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        if let output = filter?.outputImage {
            let source = UIImage.init(ciImage: ciImage)
            let context = CIContext.init(options: nil)
            guard let cgImage = context.createCGImage(output, from: output.extent) else {
                return nil
            }
            let outputImage = UIImage.init(cgImage: cgImage, scale: source.scale, orientation: source.imageOrientation)
            return CIImage.init(image: outputImage)
        }
        return nil
    }
}
