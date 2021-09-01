//
//  WebViewController.swift
//  ITNewsMatome
//
//  Created by 藤井凜 on 2021/09/01.
//

import UIKit
import WebKit
import Lottie

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

  var webView = WKWebView()
  
  var articleTitle = String()
  var articleDate = String()
  var articleURL = String()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    webView.uiDelegate = self
    webView.navigationDelegate = self
    webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
    view.addSubview(webView)
    
    
    let urlString = articleURL
    let url = URL(string: urlString as String)
    let request = URLRequest(url: url!)
    webView.load(request)
  }

  
  // 読み込み開始時イベント
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    print("start")
  }
  
  // 読み込み終了時イベント
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("finish")
  }
  
  // 読み込み失敗時イベント
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print("fail")
  }
}
