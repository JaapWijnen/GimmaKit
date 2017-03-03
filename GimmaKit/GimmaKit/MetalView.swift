//
//  MetalView.swift
//  GimmaKit
//
//  Created by Jaap Wijnen on 03/03/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import MetalKit

class MetalView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    
    var scene: Scene?
    
    var samplerState: MTLSamplerState?
    var depthStencilState: MTLDepthStencilState?
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        let devices = MTLCopyAllDevices()
        for device in devices {
            if !device.isLowPower {
                self.device = device
            }
        }
        
        commandQueue = device!.makeCommandQueue()
        
        self.clearColor = Colors.wenderlichGreen
        self.colorPixelFormat = .bgra8Unorm
        self.depthStencilPixelFormat = .depth32Float
        
        do {
            let descriptor = MTLSamplerDescriptor()
            descriptor.minFilter = .linear
            descriptor.magFilter = .linear
            samplerState = device!.makeSamplerState(descriptor: descriptor)
        }
        
        do {
            let depthStencilDesc = MTLDepthStencilDescriptor()
            depthStencilDesc.isDepthWriteEnabled = true
            depthStencilDesc.depthCompareFunction = .less
            depthStencilState = device!.makeDepthStencilState(descriptor: depthStencilDesc)
        }
        
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let drawable = currentDrawable,
            let descriptor = currentRenderPassDescriptor else { return }
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)
        let deltaTime = 1 / Float(preferredFramesPerSecond)
        commandEncoder.setFragmentSamplerState(samplerState, at: 0)
        commandEncoder.setDepthStencilState(depthStencilState)
        scene?.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}

extension MetalView {
    override var acceptsFirstResponder: Bool { return true }
    
    override func keyDown(with event: NSEvent) {
        scene?.keyIsDown(with: event)
    }
    
    override func keyUp(with event: NSEvent) {
        scene?.keyIsUp(with: event)
    }
}

extension MetalView: NSWindowDelegate {
    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        scene?.sceneSizeWillChange(to: bounds.size)
        
        return frameSize
    }
}
