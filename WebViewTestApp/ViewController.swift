//
//  ViewController.swift
//  WebViewTestApp
//
//  Created by 木村洋 on 2016/06/06.
//  Copyright © 2016年 木村洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var wvMain: UIWebView!
    @IBOutlet weak var txtURL: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn_radius:CGFloat = 10
        
        // Do any additional setup after loading the view, typically from a nib.
        btnGo.layer.cornerRadius = btn_radius
        btnGo.layer.masksToBounds = true
        btnGo.addTarget(self, action: #selector(ViewController.pressGoBtn(_:)), for: .touchUpInside)

        btnBack.layer.cornerRadius = btn_radius
        btnBack.layer.masksToBounds = true
        btnBack.addTarget(self, action: #selector(ViewController.pressBackBtn(_:)), for: .touchUpInside)

        btnNext.layer.cornerRadius = btn_radius
        btnNext.layer.masksToBounds = true
        btnNext.addTarget(self, action: #selector(ViewController.pressNextBtn(_:)), for: .touchUpInside)

        // webviewなイベントの受信はこちら
        wvMain.delegate = self
    }
    //ページが読み終わったときに呼ばれる関数
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("ページ読み込み完了しました！")
        print(webView.request?.url?.absoluteString)
        txtURL.text = webView.request?.url?.absoluteString
    }
    //ページを読み始めた時に呼ばれる関数
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("ページ読み込み開始しました！")
        print(webView.request?.url?.absoluteString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doURLRequest(_ url:URL!) {
        wvMain.loadRequest(URLRequest(url: url))
    }

    @IBAction func editEnter(_ sender: AnyObject) {
        print("editでenterが押されたよ : " + txtURL.text!)
        doURLRequest(URL(string: txtURL.text!))
    }

    func pressGoBtn(_ sender:UIButton){
        print("Goボタンが押されたよ : " + txtURL.text!)
        doURLRequest(URL(string: txtURL.text!))
    }
    
    func pressNextBtn(_ sender:UIButton){
        print("Nextボタンが押されたよ")
        wvMain.goForward()
    }
    
    func pressBackBtn(_ sender:UIButton){
        print("Backボタンが押されたよ")
        wvMain.goBack()
    }
    
    func appendHistory(_ url:URL) {
        // 履歴に追加する。next/backも対象（めんどくさいので）
        /*
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
        
        if managedObjectContext  {
        }
 */
    }
}
