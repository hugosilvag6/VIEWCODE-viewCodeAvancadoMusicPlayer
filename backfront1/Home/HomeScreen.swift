//
//  HomeScreen.swift
//  backfront1
//
//  Created by Hugo Silva on 18/11/22.
//

import UIKit

class HomeScreen: UIView {
   
   lazy var tableView: UITableView = {
      let tv = UITableView()
      tv.separatorStyle = .none
      tv.tableFooterView = UIView()
      tv.showsVerticalScrollIndicator = false
      tv.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
      return tv
   }()
   
   public func configTableViewProtocols (delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
      self.tableView.delegate = delegate
      self.tableView.dataSource = dataSource
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.setSubviews()
      self.setConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension HomeScreen {
   private func setSubviews() {
      self.addSubview(tableView)
   }
   private func setConstraints() {
      self.tableView.pin(to: self)
   }
}
