//
//  ViewController.swift
//  Example_24By7Event
//
//  Created by 24By7Event on 25/12/21.
//

import UIKit
import AVFoundation
import AVKit
import Event24By7

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Event24By7.shared.setup("#productID") { response in
            print("\(response?["message"])")
            if let dataDO = response?["data"] as? [String: Any] , let url = dataDO["streamUrl"] as? String{
                let videoUrl = URL(string: url)
                self.playVideo(videoUrl!)
            }
        }
    }


    func playVideo(_ videoURL : URL){
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
}

