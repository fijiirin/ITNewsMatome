//
//  ArticleCell.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/25.
//

import UIKit

class ArticleCell: UITableViewCell {
  
  @IBOutlet weak var articleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  
  static let identifier = "ArticleCell"
  
  static func nib() -> UINib {
    return UINib(nibName: "ArticleCell", bundle: nil)
  }
  
  func configure(articleItem: ArticleItem) {
    articleLabel.text = articleItem.title
    dateLabel.text = articleItem.date
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
    
}
