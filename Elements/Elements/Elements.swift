//
//  Elements.swift
//  Elements
//
//  Created by Olimpia on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Elements: Codable {
    let elementInfo: [ElementInfo]

    struct ElementInfo: Codable {
    
    let name: String?
        let atomic_mass: Double
    let boil: Double?
    let discovered_by: String?
    let melt: Double?
    let named_by: String?
    let number: Int
    let phase: String?
    let spectral_img: String?
    let symbol: String?
    
}

}

