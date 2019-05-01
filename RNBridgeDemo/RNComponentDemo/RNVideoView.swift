//
//  RNVideoView.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

import Foundation
import AVFoundation

@objc(RNVideoView) class RNVideoView: UIView {
    
    var url: String = "http://chiaoni3145951.com/DemoVideo.mp4"
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
        layer.masksToBounds = true
    }
    
    private func setup() {
        do {
            if #available(iOS 10.0, *) {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .moviePlayback)
            } else {
                // Fallback on earlier versions
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(onVideoPlayDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onVideoPlayDidEnd), name: .AVPlayerItemFailedToPlayToEndTime, object: nil)
        
        if let videoURL = URL(string: url) {
            playVideoChat(videoURL: videoURL)
        } else {
            return
        }
    }
    
    private func playVideoChat(videoURL: URL ) {
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = bounds//UIScreen.main.bounds
        layer.addSublayer(playerLayer)
        player.play()
    }
    
    //MARK: - Notify
    @objc private func onVideoPlayDidEnd() {
        
    }
}
