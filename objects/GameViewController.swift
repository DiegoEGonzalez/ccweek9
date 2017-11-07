//
//  GameViewController.swift
//  many things
//
//  Created by Diego E Gonzalez on 11/6/17.
//  Copyright © 2017 Diego E Gonzalez. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    var scene: SCNScene!
    
    var materials: [SCNMaterial]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = NSColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the ship node
        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        let mat = SCNMaterial();
        mat.diffuse.contents = NSColor.blue
        mat.isLitPerPixel = false;
        ship.geometry?.materials = [mat]
        // animate the 3d object
        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = NSColor.black
        manythings()
    }
    
    func manythings(){
        for index in 1...9{
            switch index {
            case 1:
                let obj = planet(size: 1.516, nickname: "mercury")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 2:
                let obj = planet(size: 3.760, nickname: "venus")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 3:
                let obj = planet(size: 3.959, nickname: "earth")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 4:
                let obj = planet(size: 2.106, nickname: "mars")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 5:
                let obj = planet(size: 43.441, nickname: "jupiter")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 6:
                let obj = planet(size: 36.184, nickname: "saturn")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 7:
                let obj = planet(size: 15.759, nickname: "uranus")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 8:
                let obj = planet(size: 15.299, nickname: "neptune")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            case 9:
                let obj = planet(size: 0.7376, nickname: "pluto")
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            default:
                let obj = planet()
                obj.position.x = CGFloat(index * 100);
                scene.rootNode.addChildNode(obj)
            }
        }
    }
    
    
}

