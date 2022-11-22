//
//  CustomPlayerView.swift
//  backfront1
//
//  Created by Hugo Silva on 22/11/22.
//

import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {
   
   var videoTimer: Timer?
   var time: CFloat = 0
   
   lazy var imageView: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleToFill
      return img
   }()
   lazy var marqueeLabel: MarqueeLabel = {
      let ml = MarqueeLabel()
      ml.translatesAutoresizingMaskIntoConstraints = false
      ml.font = UIFont(name: "Avenir-Heavy", size: 18)
      ml.textColor = .white.withAlphaComponent(0.8)
      ml.type = .continuous
      ml.animationCurve = .linear
      ml.fadeLength = 10
      ml.leadingBuffer = 30
      ml.trailingBuffer = 30
      return ml
   }()
   lazy var pausePlayBtn: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.image = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
      img.tintColor = .white.withAlphaComponent(0.8)
      return img
   }()
   lazy var trackBar: UIProgressView = {
      let pv = UIProgressView()
      pv.translatesAutoresizingMaskIntoConstraints = false
      pv.progressTintColor = .yellow.withAlphaComponent(0.8)
      pv.progress = 0
      return pv
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .black
      self.setupViews()
      self.setupConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension CustomPlayerView {
   @objc func changeTrackBar(){
      self.time += 0.001
      self.trackBar.progress = Float(self.time / 120)
      if self.time >= 120 {
         self.videoTimer?.invalidate()
         self.videoTimer = nil
      }
   }
}

extension CustomPlayerView {
   private func setupViews (){
      self.addSubview(self.imageView)
      self.addSubview(self.marqueeLabel)
      self.addSubview(self.pausePlayBtn)
      self.addSubview(self.trackBar)
      self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
   }
   private func setupConstraints(){
      NSLayoutConstraint.activate([
         self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
         self.imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
         self.imageView.widthAnchor.constraint(equalToConstant: 90),
         
         self.marqueeLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 10),
         self.marqueeLabel.trailingAnchor.constraint(equalTo: self.pausePlayBtn.leadingAnchor, constant: -5),
         self.marqueeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
         
         self.pausePlayBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         self.pausePlayBtn.topAnchor.constraint(equalTo: self.topAnchor,constant: 25),
         self.pausePlayBtn.heightAnchor.constraint(equalToConstant: 40),
         self.pausePlayBtn.widthAnchor.constraint(equalToConstant: 40),
         
         self.trackBar.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
         self.trackBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         self.trackBar.topAnchor.constraint(equalTo: self.topAnchor)
         
      ])
   }
   public func setupView (data: CardListModel) {
      self.imageView.image = UIImage(named: data.listImage ?? "")
      self.marqueeLabel.text = data.listTitle ?? ""
      self.time = 0
      self.trackBar.progress = 0
      self.videoTimer = nil
      self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
   }
}
