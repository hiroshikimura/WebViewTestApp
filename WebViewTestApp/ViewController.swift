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
        btnGo.addTarget(self, action: #selector(ViewController.pressGoBtn(_:)), forControlEvents: .TouchUpInside)

        btnBack.layer.cornerRadius = btn_radius
        btnBack.layer.masksToBounds = true
        btnBack.addTarget(self, action: #selector(ViewController.pressBackBtn(_:)), forControlEvents: .TouchUpInside)

        btnNext.layer.cornerRadius = btn_radius
        btnNext.layer.masksToBounds = true
        btnNext.addTarget(self, action: #selector(ViewController.pressNextBtn(_:)), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doURLRequest(url:NSURL!) {
        wvMain.loadRequest(NSURLRequest(URL: url))
    }

    @IBAction func editEnter(sender: AnyObject) {
        print("editでenterが押されたよ : " + txtURL.text!)
        doURLRequest(NSURL(string: txtURL.text!))
    }

    func pressGoBtn(sender:UIButton){
        print("Goボタンが押されたよ : " + txtURL.text!)
        doURLRequest(NSURL(string: txtURL.text!))
    }
    
    func pressNextBtn(sender:UIButton){
        print("Nextボタンが押されたよ")
        wvMain.goForward()
    }
    
    func pressBackBtn(sender:UIButton){
        print("Backボタンが押されたよ")
        wvMain.goBack()
    }
}
