//
//  Filter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import Foundation
import UIKit

class Filter: NSObject {
    var displayName: String {
        return ""
    }

    func applyFilter(to ciImage: CIImage) -> CIImage? {
        fatalError("overide in sub class")
    }
}
