//
//  CreateTalkViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/25.
//

import UIKit

class CreateTalkViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var messageTextView: PlaceHolderTextView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.borderStyle = .none
    nameTextField.becomeFirstResponder()
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
