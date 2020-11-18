//
//  NoneFilter.swift
//  VideoCutter
//
//  Created by VietLV on 11/2/20.
//  Copyright © 2020 Fate. All rights reserved.
//

import UIKit

class NoneFilter: Filter {
    override var displayName: String {
        return "Normal"
    }
    
    override func applyFilter(to ciImage: CIImage) -> CIImage? {
        return nil
    }
}
