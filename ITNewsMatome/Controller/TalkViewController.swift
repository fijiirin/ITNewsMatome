//
//  TalkViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/24.
//

import UIKit
import Firebase
import SegementSlide

class TalkViewController: UIViewController, SegementSlideContentScrollViewDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    createTalkButton()
  }
  
  
  func createTalkButton() {
    
    let button = UIButton()
    button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    button.backgroundColor = .black
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goCreateTalkView), for: .touchUpInside)
    view.addSubview(button)
    
    //AutoLayoutでの実装(数値は後で変更する)
    button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
    button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
  }
  
  @objc func goCreateTalkView(sender: UIButton) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let createTalkVC = storyboard.instantiateViewController(withIdentifier: "createTalkVC") as! CreateTalkViewController
    createTalkVC.modalPresentationStyle = .fullScreen
    self.present(createTalkVC, animated: true, completion: nil)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
