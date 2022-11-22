//
//  DetailTableViewCell.swift
//  backfront1
//
//  Created by Hugo Silva on 22/11/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
   
   static let identifier = "DetailTableViewCell"
   
   var screen = DetailTableViewCellScreen()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.selectionStyle = .none
      self.setupViews()
      self.setupConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
}

extension DetailTableViewCell {
   private func setupViews () {
      self.contentView.addSubview(self.screen)
   }
   private func setupConstraints () {
      self.screen.pin(to: self.contentView)
   }
   public func setupCell (data: CardListModel) {
      self.screen.setupCell(data: data)
   }
}
