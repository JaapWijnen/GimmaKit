//
//  LightingScene.swift
//  LeLeLeGame
//
//  Created by Jaap Wijnen on 10/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class LightingScene: Scene {
    let mushroom: Model
    
    var downKey: Bool = false
    var upKey: Bool = false
    var leftKey: Bool = false
    var rightKey: Bool = false
    
    override init(device: MTLDevice, size: CGSize) {
        mushroom = Model(device: device, modelName: "mushroom")
        super.init(device: device, size: size)
        mushroom.position.y = -1
        mushroom.specularIntensity = 0.2
        mushroom.shininess = 2.0
        add(childNode: mushroom)
        
        light.color = float3(1, 1, 1)
        light.ambientIntensity = 0.2
        light.diffuseIntensity = 0.8
        light.direction = float3(0, 0, -1)
    }
    
    override func update(deltaTime: Float) {
        if leftKey {
            mushroom.rotation.y += deltaTime
        }
        if rightKey {
            mushroom.rotation.y -= deltaTime
        }
        if downKey {
            mushroom.rotation.x -= deltaTime
        }
        if upKey {
            mushroom.rotation.x += deltaTime
        }
    }
    
    override func keyIsDown(with event: NSEvent) {
        let keyCode = event.keyCode
        if keyCode == 123 { // left
            leftKey = true
        }
        if keyCode == 124 { // right
            rightKey = true
        }
        if keyCode == 125 { // down
            downKey = true
        }
        if keyCode == 126 { // up
            upKey = true
        }
    }
    
    override func keyIsUp(with event: NSEvent) {
        let keyCode = event.keyCode
        if keyCode == 123 { // left
            leftKey = false
        }
        if keyCode == 124 { // right
            rightKey = false
        }
        if keyCode == 125 { // down
            downKey = false
        }
        if keyCode == 126 { // up
            upKey = false
        }
    }
}
