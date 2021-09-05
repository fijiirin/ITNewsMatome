//
//  BaseViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/24.
//

import UIKit
import Firebase
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {
  
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    Auth.auth().signInAnonymously(completion: nil)
    
    reloadData()
    
    defaultSelectedIndex = 0
  }
  
  
//  override func segementSlideHeaderView() -> UIView {
//
//    let headerView = UIImageView()
//
//    headerView.isUserInteractionEnabled = true
//    headerView.contentMode = .scaleAspectFill
//    headerView.image = UIImage(named: "header")
//    headerView.translatesAutoresizingMaskIntoConstraints = false
//
//    let headerHeight: CGFloat
//
//    if #available(iOS 11.0, *) {
//
//      headerHeight = view.bounds.height/4+view.safeAreaInsets.top
//
//    } else {
//
//      headerHeight = view.bounds.height/4+topLayoutGuide.length
//
//    }
//
//    headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
//
//    return headerView
//  }
  
  override var titlesInSwitcher: [String] {

    return ["トップ","トーク","お気に入り","追加要望","お問い合わせ"]
  }
  
  
  override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
    
    switch index {
    
    case 0:
      return ArticleViewController()
    case 1:
      return TalkViewController()
    case 2:
      return FavoriteViewController()
    case 3:
      return RequestViewController()
    case 4:
      return ContactViewController()
    default:
      return ArticleViewController()
    }
  }
  
  
  
}
