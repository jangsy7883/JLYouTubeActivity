//
//  ViewController.swift
//  JLYoutubeActivityDemo
//
//  Created by Woody on 2017. 5. 25..
//  Copyright © 2017년 Woody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView : UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://youtu.be/_NMQl74qrR8") {
            webView.loadRequest(URLRequest(url: url))
        }
    }

    @IBAction func pressedShareButton(_ sender: Any) {        
        if let url : URL = webView.request?.url! {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: [JLYoutubeActivity()])
            present(activityViewController, animated: true, completion: nil)
        }
    }
}
