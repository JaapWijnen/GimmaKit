//
//  Types.swift
//  MacOSGimma
//
//  Created by Jaap Wijnen on 05/02/2017.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import simd
import Metal

struct Vertex {
    var position: float3
    var color: float4
    var texture: float2
}

struct ModelConstants {
    var modelViewMatrix = matrix_identity_float4x4
    var materialColor = float4(1)
    var normalMatrix = matrix_identity_float3x3
    var specularIntensity: Float = 1
    var shininess: Float = 1
}

struct SceneConstants {
    var projectionMatrix = matrix_identity_float4x4
}

struct Light {
    var color = float3(1)
    var ambientIntensity: Float = 1.0
    var diffuseIntensity: Float = 1.0
    var direction = float3(0)
}

enum Colors {
    static let wenderlichGreen = MTLClearColor(red: 0.0,
                                               green: 0.4,
                                               blue: 0.21,
                                               alpha: 1.0)
    static let skyBlue = MTLClearColor(red: 0.66, green: 0.9, blue: 0.96, alpha: 1.0)
}
