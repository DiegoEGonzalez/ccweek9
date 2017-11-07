//
//  planet.swift
//  objects
//
//  Created by Diego E Gonzalez on 11/7/17.
//  Copyright © 2017 Diego E Gonzalez. All rights reserved.
//

import Foundation
import SceneKit

class planet : SCNNode{
    var size: CGFloat!
    var nickname: String!
    var moons: [SCNNode]!
    var mat: SCNMaterial!

    
    convenience override init(){
        self.init(size: 10,nickname: "earth")
    }
    
    init(size: CGFloat, nickname: String) {
        super.init()
        self.size = size
        geometry = SCNSphere(radius: size)
        self.nickname = nickname
        mat = SCNMaterial()
        mat.diffuse.contents = NSImage(imageLiteralResourceName: nickname)
        geometry?.materials = [mat]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(arc4random_uniform(50))

 
    }
}
