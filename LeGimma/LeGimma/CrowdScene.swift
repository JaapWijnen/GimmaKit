//
//  CrowdScene.swift
//  LeLeLeGame
//
//  Created by Jaap Wijnen on 10/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class CrowdScene: Scene {
    
    var humans = [Model]()
    
    override init(device: MTLDevice, size: CGSize) {
        super.init(device: device, size: size)
        for _ in 0..<40 {
            let human = Model(device: device, modelName: "humanFigure")
            humans.append(human)
            add(childNode: human)
            human.scale = float3(Float(arc4random_uniform(5))/10)
            human.position.x = Float(arc4random_uniform(5)) - 2
            human.position.y = Float(arc4random_uniform(5)) - 3
            human.materialColor = float4(Float(drand48()),
                                         Float(drand48()),
                                         Float(drand48()),
                                         1)
            
            
        }
        
    }
    
    override func update(deltaTime: Float) {
        
    }
}
