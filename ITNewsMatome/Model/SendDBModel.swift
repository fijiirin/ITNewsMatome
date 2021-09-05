//
//  SendDBModel.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/25.
//

import Foundation
import Firebase

class SendDBModel {
  
  
  let db = Firestore.firestore()
  
  func sendTalk(name:String, message:String, userID:String) {
    
    
    db.collection("Talks").document().setData(
      ["name":name as Any, "message":message as Any, "userID":userID as Any, "date":Date().timeIntervalSince1970]
    )
  }
  
  
}
