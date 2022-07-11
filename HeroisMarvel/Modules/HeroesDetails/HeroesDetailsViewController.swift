//
//  HeroesDetailsViewController.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit
import WebKit

class HeroesDetailsViewController: UIViewController,
                                   WKUIDelegate,
                                   WKNavigationDelegate,
                                   UINavigationControllerDelegate,
                                   HeroesDetailsPresenterDelegate {
    
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var actLoading: UIActivityIndicatorView!
    
    var presenter: HeroesDetailsPresenter!
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configWebview()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Webview Configuration
    //-----------------------------------------------------------------------
    
    func configWebview() {
        
        if let url = URL(string: presenter.hero?.urls.first!.url ?? "") {
            
            title = presenter.hero?.name
            
            webview.load(URLRequest(url: url))
        }
        
        webview.allowsBackForwardNavigationGestures = true
        webview.uiDelegate = self
        webview.navigationDelegate = self
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
               let host = url.host, !host.hasPrefix("www.youtube.com") {
                webView.allowsBackForwardNavigationGestures = true
                webView.load(URLRequest(url: url))
                print(url)
                print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        actLoading.stopAnimating()
    }
}
