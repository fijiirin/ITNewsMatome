//
//  PlaceHolderTextView.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/09/06.
//

import Foundation
import UIKit

@IBDesignable class PlaceHolderTextView: UITextView {
  
  // MARK: Stored Instance Properties
  
  @IBInspectable private var placeHolder: String = "" {
    willSet {
      self.placeHolderLabel.text = newValue
      self.placeHolderLabel.sizeToFit()
    }
  }
  
  private lazy var placeHolderLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 6.0, y: 6.0, width: 0.0, height: 0.0))
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.font = self.font
    label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
    label.backgroundColor = .clear
    self.addSubview(label)
    return label
  }()
  
  // MARK: Initializers
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  // MARK: View Life-Cycle Methods
  
  override func awakeFromNib() {
    super.awakeFromNib()
    changeVisiblePlaceHolder()
    NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: nil)
    self.textContainerInset = UIEdgeInsets(top: 6, left: 3, bottom: 6, right: 6)
  }
  
  // MARK: Other Private Methods
  
  private func changeVisiblePlaceHolder() {
    self.placeHolderLabel.alpha = (self.placeHolder.isEmpty || !self.text.isEmpty) ? 0.0 : 1.0
  }
  
  @objc private func textChanged(notification: NSNotification?) {
    changeVisiblePlaceHolder()
  }
  
}

