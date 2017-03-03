//
//  InstanceScene.swift
//  LeLeLeGame
//
//  Created by Jaap Wijnen on 10/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class InstanceScene: Scene {
    
    var humans: Instance
    
    override init(device: MTLDevice, size: CGSize) {
        humans = Instance(device: device, modelName: "humanFigure", instances: 40)
        super.init(device: device, size: size)
        add(childNode: humans)
        for human in humans.nodes {
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
