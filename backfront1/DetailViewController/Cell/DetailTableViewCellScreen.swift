//
//  DetailTableViewCellScreen.swift
//  backfront1
//
//  Created by Hugo Silva on 22/11/22.
//

import UIKit

class DetailTableViewCellScreen: UIView {
   
   lazy var thumbImage: UIImageView = {
      var img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.image = UIImage(named: "demo")
      img.layer.cornerRadius = 5
      img.clipsToBounds = true
      return img
   }()
   lazy var title: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "Teste nome"
      lb.font = .systemFont(ofSize: 17, weight: .bold)
      lb.textColor = .black
      return lb
   }()
   lazy var subtitle: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "Subtitle"
      lb.font = .systemFont(ofSize: 16, weight: .semibold)
      lb.textColor = .lightGray
      return lb
   }()
   lazy var likeBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
      bt.tintColor = .lightGray
      return bt
   }()
   lazy var moreBtn: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
      bt.tintColor = .lightGray
      return bt
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

extension DetailTableViewCellScreen {
   private func addSubviews () {
      self.addSubview(self.thumbImage)
      self.addSubview(self.title)
      self.addSubview(self.subtitle)
      self.addSubview(self.likeBtn)
      self.addSubview(self.moreBtn)
   }
   private func addConstraints () {
      NSLayoutConstraint.activate([
         self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.thumbImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         self.thumbImage.widthAnchor.constraint(equalToConstant: 60),
         self.thumbImage.heightAnchor.constraint(equalToConstant: 60),
         
         self.title.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
         self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
         
         self.subtitle.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
         self.subtitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 4),
         
         self.moreBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
         self.moreBtn.widthAnchor.constraint(equalToConstant: 35),
         self.moreBtn.heightAnchor.constraint(equalToConstant: 35),
         self.moreBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         
         self.likeBtn.trailingAnchor.constraint(equalTo: self.moreBtn.leadingAnchor, constant: -15),
         self.likeBtn.widthAnchor.constraint(equalToConstant: 35),
         self.likeBtn.heightAnchor.constraint(equalToConstant: 35),
         self.likeBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      ])
   }
   public func setupCell (data: CardListModel) {
      self.title.text = data.listTitle
      self.subtitle.text = data.listSubtitle
      self.thumbImage.image = UIImage(named: data.listImage ?? "")
   }
}
