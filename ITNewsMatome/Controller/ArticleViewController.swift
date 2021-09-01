//
//  NewsViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/08/24.
//

import UIKit
import SegementSlide

class ArticleViewController: UITableViewController, SegementSlideContentScrollViewDelegate, XMLParserDelegate {
  
  
  var parser = XMLParser()
  
  var currentElementName:String!
  var checkTitle = [String]()
  
  var articleItemArray = [ArticleItem]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .clear
    tableView.register(ArticleCell.nib(), forCellReuseIdentifier: ArticleCell.identifier)
    
    //startParser(url: URL(string: "https://feed.infoq.com/jp")!)
    startParser(url: URL(string: "https://www.gizmodo.jp/index.xml")!)
  }
  
  
  func startParser(url: URL) {
    
    parser = XMLParser(contentsOf: url)!
    parser.delegate = self
    parser.parse()
  }
  
  @objc var scrollView: UIScrollView {
    return tableView
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return articleItemArray.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
    cell.backgroundColor = .clear
    cell.configure(articleItem: articleItemArray[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let webViewController = WebViewController()
    webViewController.modalTransitionStyle = .crossDissolve
    webViewController.articleTitle = articleItemArray[indexPath.row].title!
    webViewController.articleDate = articleItemArray[indexPath.row].date!
    webViewController.articleURL = articleItemArray[indexPath.row].url!
    present(webViewController, animated: true, completion: nil)
  }
  
  func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    
    currentElementName = nil
    
    if elementName == "item" {
      
      self.articleItemArray.append(ArticleItem())
    } else {
      currentElementName = elementName
    }
  }
  
  func parser(_ parser: XMLParser, foundCharacters string: String) {
    
    if self.articleItemArray.count > 0 {
      
      var lastItem = self.articleItemArray[self.articleItemArray.count - 1]
      var articleTitle = String()
      
      switch self.currentElementName {
      case "title":
        checkTitle.append(string)
        articleTitle = checkTitle.joined(separator: "")
        lastItem.title = articleTitle
      case "link":
        lastItem.url = string
      case "pubDate":
        lastItem.date = string
      default:
        break
      }
    }
  }
  
  func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    checkTitle = [String]()
    self.currentElementName = nil
  }
  
  func parserDidEndDocument(_ parser: XMLParser) {
    tableView.reloadData()
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
