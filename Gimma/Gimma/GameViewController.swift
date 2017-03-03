//
//  GameViewController.swift
//  Gimma
//
//  Created by Jaap Wijnen on 03/03/2017.
//  Copyright (c) 2017 Workmoose. All rights reserved.
//

import Cocoa
import MetalKit

class GameViewController: NSViewController {
    
    @IBOutlet weak var gameView: GameView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let scene = Scene()
        
        self.gameView!.scene = scene
    }
}
