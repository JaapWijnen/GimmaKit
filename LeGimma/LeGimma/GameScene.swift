//
//  GameScene.swift
//  LeLeLeGame
//
//  Created by Jaap Wijnen on 05/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class GameScene: Scene {
    
    let mushroom: Model
    
    override init(device: MTLDevice, size: CGSize) {
        mushroom = Model(device: device, modelName: "mushroom")
        super.init(device: device, size: size)
        add(childNode: mushroom)
        camera.position.z = -6
    }
    
    override func update(deltaTime: Float) {
        mushroom.rotation.y += deltaTime
    }
}
