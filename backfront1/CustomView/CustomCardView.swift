//
//  CustomCardView.swift
//  backfront1
//
//  Created by Hugo Silva on 21/11/22.
//

import UIKit

enum ViewMode {
   case full, card
}

class CustomCardView: UIView {
   
   // MARK: PROPRIEDADES
   var vmode: ViewMode?
   var containerTopConstraints: NSLayoutConstraint?
   var containerTrailingConstraints: NSLayoutConstraint?
   var containerBottomConstraints: NSLayoutConstraint?
   var containerLeadingConstraints: NSLayoutConstraint?
   var dataModel: CardViewModel?
   
   // MARK: ELEMENTOS
   lazy var cardContainerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      view.layer.cornerRadius = 30
      view.layer.shadowOpacity = 1
      view.layer.shadowOffset = CGSize(width: 0, height: -2)
      view.layer.shadowRadius = 20
      return view
   }()
   lazy var cardImageView: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleAspectFill
      img.backgroundColor = .black
      return img
   }()
   lazy var overlayView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black.withAlphaComponent(0.6)
      return view
   }()
   lazy var profileBorderView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .clear
      view.layer.borderWidth = 1
      view.layer.borderColor = UIColor.white.cgColor
      view.layer.cornerRadius = 25
      return view
   }()
   lazy var cardProfilePicture: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleAspectFill
      img.backgroundColor = .black
      img.clipsToBounds = true
      img.layer.cornerRadius = 20
      return img
   }()
   lazy var addProfileImageButton: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.backgroundColor = .white
      bt.setBackgroundImage(UIImage(named: "plus"), for: .normal)
      bt.layer.cornerRadius = 10
      return bt
   }()
   lazy var cardCategoryTitleLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 12, weight: .bold)
      lb.textColor = .white
      return lb
   }()
   lazy var cardCategoryDateLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 11)
      lb.textColor = .white
      return lb
   }()
   lazy var cardTitle: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 31, weight: .bold)
      lb.textColor = .white
      lb.textAlignment = .center
      return lb
   }()
   lazy var likeAndTimeLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      return lb
   }()
   lazy var descriptionTitleLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 16)
      lb.textColor = .white
      lb.textAlignment = .center
      lb.numberOfLines = 0
      return lb
   }()
   lazy var actionsView: CardActionView = {
      let view = CardActionView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   
   init(mode: ViewMode) {
      let frame = CGRect.zero
      super.init(frame: frame)
      self.addSubviews()
      self.setupConstraints()
      self.updateLayout(for: mode)
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension CustomCardView {
   private func addSubviews () {
      self.addSubview(self.cardContainerView)
      self.cardContainerView.addSubview(self.cardImageView)
      self.cardContainerView.addSubview(self.overlayView)
      self.cardContainerView.addSubview(self.profileBorderView)
      self.cardContainerView.addSubview(self.cardProfilePicture)
      self.cardContainerView.addSubview(self.addProfileImageButton)
      self.cardContainerView.addSubview(self.cardCategoryTitleLabel)
      self.cardContainerView.addSubview(self.cardCategoryDateLabel)
      self.cardContainerView.addSubview(self.cardTitle)
      self.cardContainerView.addSubview(self.likeAndTimeLabel)
      self.cardContainerView.addSubview(self.descriptionTitleLabel)
      self.cardContainerView.addSubview(self.actionsView)
   }
   private func updateLayout (for mode: ViewMode) {
      if mode == .full {
         self.containerTopConstraints?.constant = 0
         self.containerTrailingConstraints?.constant = 0
         self.containerBottomConstraints?.constant = 0
         self.containerLeadingConstraints?.constant = 0
         self.descriptionTitleLabel.isHidden = false
      } else {
         self.containerTopConstraints?.constant = 15
         self.containerTrailingConstraints?.constant = -30
         self.containerBottomConstraints?.constant = -15
         self.containerLeadingConstraints?.constant = 30
         self.descriptionTitleLabel.isHidden = true
      }
      self.actionsView.updateLayout(for: mode)
   }
   private func setupConstraints () {
      self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
      self.containerLeadingConstraints?.isActive = true
      self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
      self.containerTopConstraints?.isActive = true
      self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
      self.containerBottomConstraints?.isActive = true
      self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
      self.containerTrailingConstraints?.isActive = true
      self.overlayView.pin(to: self.cardContainerView)
      self.cardImageView.pin(to: self.cardContainerView)
      
      NSLayoutConstraint.activate([
         self.profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
         self.profileBorderView.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
         self.profileBorderView.widthAnchor.constraint(equalToConstant: 50),
         self.profileBorderView.heightAnchor.constraint(equalToConstant: 50),
         
         self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBorderView.trailingAnchor, constant: 4),
         self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 4),
         self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
         self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
         
         self.cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor),
         self.cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor),
         self.cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
         self.cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
         
         self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
         self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
         
         self.cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
         self.cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
         
         self.cardTitle.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
         self.cardTitle.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
         self.cardTitle.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
         
         self.likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 10),
         self.likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
         
         self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
         self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
         self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40),
         
         self.actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor, constant: -20),
         self.actionsView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
         self.actionsView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
         self.actionsView.heightAnchor.constraint(equalToConstant: 80),
      ])
   }
   public func setupView(data: CardViewModel) {
      self.cardCategoryTitleLabel.text = data.categoryName
      self.cardCategoryDateLabel.text = data.categoryDate
      self.cardTitle.text = data.cardTitle
      self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
      self.descriptionTitleLabel.text = data.cardDescription
      self.cardImageView.image = UIImage(named: data.cardImage ?? "")
      self.cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
   }
}
