//
//  CardActionView.swift
//  backfront1
//
//  Created by Hugo Silva on 21/11/22.
//

import UIKit

class CardActionView: UIView {
   
   lazy var stackView: UIStackView = {
      let st = UIStackView()
      st.translatesAutoresizingMaskIntoConstraints = false
      st.axis = .horizontal
      st.distribution = .fillEqually
      return st
   }()
   lazy var downloadView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   lazy var notInterestedView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   lazy var playView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   lazy var likeView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   lazy var moreView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   lazy var downloadBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white.withAlphaComponent(0.3)
      bt.layer.cornerRadius = 22.5
      bt.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal) // rendering mode permite personalizar a imagem "passando a segurança nativa", mudando cores, etc
      bt.tintColor = .white
      bt.clipsToBounds = true
      return bt
   }()
   lazy var notInterestedBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white.withAlphaComponent(0.3)
      bt.layer.cornerRadius = 22.5
      bt.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal) // rendering mode permite personalizar a imagem "passando a segurança nativa", mudando cores, etc
      bt.tintColor = .white
      bt.clipsToBounds = true
      return bt
   }()
   lazy var playBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white
      bt.layer.cornerRadius = 35
      bt.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal) // rendering mode permite personalizar a imagem "passando a segurança nativa", mudando cores, etc
      bt.tintColor = .black
      bt.clipsToBounds = true
      return bt
   }()
   lazy var likeBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white.withAlphaComponent(0.3)
      bt.layer.cornerRadius = 22.5
      bt.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal) // rendering mode permite personalizar a imagem "passando a segurança nativa", mudando cores, etc
      bt.tintColor = .white
      bt.clipsToBounds = true
      return bt
   }()
   lazy var moreBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white.withAlphaComponent(0.3)
      bt.layer.cornerRadius = 22.5
      bt.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal) // rendering mode permite personalizar a imagem "passando a segurança nativa", mudando cores, etc
      bt.tintColor = .white
      bt.clipsToBounds = true
      return bt
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.setupViews()
      self.setupConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension CardActionView {
   private func setupViews () {
      self.addSubview(self.stackView)
      self.stackView.addArrangedSubview(self.notInterestedView)
      self.stackView.addArrangedSubview(self.playView)
      self.stackView.addArrangedSubview(self.likeView)
      self.downloadView.addSubview(self.downloadBtn)
      self.notInterestedView.addSubview(self.notInterestedBtn)
      self.playView.addSubview(self.playBtn)
      self.likeView.addSubview(self.likeBtn)
      self.moreView.addSubview(self.moreBtn)
   }
   private func setupConstraints () {
      
      self.stackView.pin(to: self)
      
      NSLayoutConstraint.activate([
         self.downloadBtn.centerXAnchor.constraint(equalTo: self.downloadView.centerXAnchor),
         self.downloadBtn.centerYAnchor.constraint(equalTo: self.downloadView.centerYAnchor),
         self.downloadBtn.widthAnchor.constraint(equalToConstant: 45),
         self.downloadBtn.heightAnchor.constraint(equalToConstant: 45),
         
         self.notInterestedBtn.centerXAnchor.constraint(equalTo: self.notInterestedView.centerXAnchor),
         self.notInterestedBtn.centerYAnchor.constraint(equalTo: self.notInterestedView.centerYAnchor),
         self.notInterestedBtn.widthAnchor.constraint(equalToConstant: 45),
         self.notInterestedBtn.heightAnchor.constraint(equalToConstant: 45),
         
         self.playBtn.centerXAnchor.constraint(equalTo: self.playView.centerXAnchor),
         self.playBtn.centerYAnchor.constraint(equalTo: self.playView.centerYAnchor),
         self.playBtn.widthAnchor.constraint(equalToConstant: 70),
         self.playBtn.heightAnchor.constraint(equalToConstant: 70),
         
         self.likeBtn.centerXAnchor.constraint(equalTo: self.likeView.centerXAnchor),
         self.likeBtn.centerYAnchor.constraint(equalTo: self.likeView.centerYAnchor),
         self.likeBtn.widthAnchor.constraint(equalToConstant: 45),
         self.likeBtn.heightAnchor.constraint(equalToConstant: 45),
         
         self.moreBtn.centerXAnchor.constraint(equalTo: self.moreView.centerXAnchor),
         self.moreBtn.centerYAnchor.constraint(equalTo: self.moreView.centerYAnchor),
         self.moreBtn.widthAnchor.constraint(equalToConstant: 45),
         self.moreBtn.heightAnchor.constraint(equalToConstant: 45),
      ])
   }
   public func updateLayout (for mode: ViewMode) {
      if mode == .full {
         self.downloadView.isHidden = false
         self.moreView.isHidden = false
         self.stackView.addArrangedSubview(self.downloadView)
         self.stackView.addArrangedSubview(self.notInterestedView)
         self.stackView.addArrangedSubview(self.playView)
         self.stackView.addArrangedSubview(self.likeView)
         self.stackView.addArrangedSubview(self.moreView)
      } else {
         self.downloadView.isHidden = true
         self.moreView.isHidden = true
         self.stackView.removeArrangedSubview(self.downloadView)
         self.stackView.removeArrangedSubview(self.moreView)
      }
   }
}
