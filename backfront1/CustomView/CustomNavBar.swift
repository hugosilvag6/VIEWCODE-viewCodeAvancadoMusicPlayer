//
//  CustomNavBar.swift
//  backfront1
//
//  Created by Hugo Silva on 22/11/22.
//

import UIKit

class CustomNavBar: UIView {
   
   lazy var categoryTitle: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 12, weight: .bold)
      lb.textColor = .white
      lb.textAlignment = .center
      return lb
   }()
   lazy var cardTitle: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 20, weight: .bold)
      lb.textColor = .white
      lb.textAlignment = .center
      return lb
   }()
   lazy var featureLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.textAlignment = .center
      return lb
   }()
   lazy var cardImage: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleAspectFill
      img.clipsToBounds = true
      return img
   }()
   lazy var overlayView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black.withAlphaComponent(0.7)
      return view
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addSubviews()
      self.addConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension CustomNavBar {
   private func addSubviews () {
      self.addSubview(self.cardImage)
      self.addSubview(self.overlayView)
      self.addSubview(self.categoryTitle)
      self.addSubview(self.cardTitle)
      self.addSubview(self.featureLabel)
   }
   private func addConstraints () {
      
      self.cardImage.pin(to: self)
      self.overlayView.pin(to: self)
      
      NSLayoutConstraint.activate([
         self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
         self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         
         self.cardTitle.leadingAnchor.constraint(equalTo: self.categoryTitle.leadingAnchor),
         self.cardTitle.trailingAnchor.constraint(equalTo: self.categoryTitle.trailingAnchor),
         self.cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor, constant: 5),
         
         self.featureLabel.leadingAnchor.constraint(equalTo: self.categoryTitle.leadingAnchor),
         self.featureLabel.trailingAnchor.constraint(equalTo: self.categoryTitle.trailingAnchor),
         self.featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 5),
      ])
   }
   public func setupView (data: CardViewModel) {
      self.cardTitle.text = data.cardTitle
      self.categoryTitle.text = data.categoryName
      self.cardImage.image = UIImage(named: data.cardImage ?? "")
      self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
   }
}
