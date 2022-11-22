//
//  ViewController.swift
//  backfront1
//
//  Created by Hugo Silva on 18/11/22.
//

import UIKit

class HomeViewController: UIViewController {
   
   
   
   var screen: HomeScreen?
   
   override func loadView() {
      self.screen = HomeScreen()
      self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
      self.view = self.screen
   }

   override func viewDidLoad() {
      super.viewDidLoad()
   }


}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return CardData.count
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
      cell?.setupCell(data: CardData[indexPath.row])
      return cell ?? UITableViewCell()
   }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc = DetailViewController()
      vc.cardModel = CardData[indexPath.row]
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true, completion: nil)
   }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 500
   }
}

