//
//  CreateTalkViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/25.
//

import UIKit
import Firebase

class CreateTalkViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var messageTextView: PlaceHolderTextView!
  
  let sendDBModel = SendDBModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.borderStyle = .none
    nameTextField.becomeFirstResponder()
  }
  
  @IBAction func send(_ sender: Any) {
    
    sendDBModel.sendTalk(name: nameTextField.text!, message: messageTextView.text!, userID: Auth.auth().currentUser!.uid)
  }
  
  
  
}
