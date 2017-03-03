//
//  Scene.swift
//  LeLeLeGame
//
//  Created by Jaap Wijnen on 05/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class Scene: Node {
    var device: MTLDevice
    var size: CGSize
    
    var camera = Camera()
    
    var sceneConstants = SceneConstants()
    
    var light = Light()
    
    init(device: MTLDevice, size: CGSize) {
        self.device = device
        self.size = size
        super.init()
        
        camera.aspect = Float(size.width / size.height)
        camera.position.z = -6
        add(childNode: camera)
    }
    
    func update(deltaTime: Float) {}
    
    func render(commandEncoder: MTLRenderCommandEncoder,
                deltaTime: Float) {
        update(deltaTime: deltaTime)
        sceneConstants.projectionMatrix = camera.projectionMatrix
        commandEncoder.setFragmentBytes(&light, length: MemoryLayout<Light>.stride, at: 3)
        commandEncoder.setVertexBytes(&sceneConstants, length: MemoryLayout<SceneConstants>.stride, at: 2)
        for child in children {
            child.render(commandEncoder: commandEncoder,
                         parentModelViewMatrix: camera.viewMatrix)
        }
    }
    
    func sceneSizeWillChange(to size: CGSize) {
        camera.aspect = Float(size.width / size.height)
    }
    
    func keyIsDown(with event: NSEvent) {
        
    }
    
    func keyIsUp(with event: NSEvent) {
        
    }
}
