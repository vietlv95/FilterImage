//
//  ProviderData.swift
//  FilterImage
//
//  Created by Viet Le Van on 11/17/20.
//

import Foundation

struct ProviderData {
    static let filters: [Filter] = [
        NoneFilter(),
        ChromeFilter(),
        DarkFilter(),
        FadeFilter(),
        HueFilter(),
        InstantFilter(),
        InvertFilter(),
        LightFilter(),
        LinearFilter(),
        MonoFilter(),
        NoirFilter(),
        ProcessFilter(),
        SepiaToneFilter(),
        TonalFilter(),
        TransferFilter(),
    ]
}
