//
//  JLYoutubeActivity.swift
//  JLYoutubeActivityDemo
//
//  Created by Woody on 2018. 4. 24..
//  Copyright © 2018년 Woody. All rights reserved.
//

import UIKit

class JLYoutubeActivity: UIActivity {
    var YoutubeURLSchema: String = "youtube://"
    var YoutubeBaseURL: String = "youtube://watch?v="
    
    var url:URL?
    // override activity
    
    override var activityType: UIActivityType? {
        return  UIActivityType(String(describing: self.self))
    }
    
    override var activityTitle: String?{
        return "Youtube"
    }
    
    override var activityImage: UIImage? {
        return UIImage(named: "JLYoutubeActivity.bundle/youtube", in: Bundle(for: JLYoutubeActivity.self), compatibleWith: nil)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        guard let opneURL = URL(string: YoutubeURLSchema) else { return false }
        
        if UIApplication.shared.canOpenURL(opneURL) {
            return activityItems.contains { (item) -> Bool in
                guard let url = item as? URL else { return false }
                return url.isYoutube
            }
        }
        return false
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {        
        for item in activityItems {
            if let url = item as? URL, let identifier = url.videoIdentifier {
                self.url = URL(string: YoutubeBaseURL+identifier)
            }
        }
    }
    
    override func perform() {
        guard let url = url else { return }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [String:Any]()) { (success) in
                self.activityDidFinish(success)
            }
        }
        else {
            UIApplication.shared.openURL(url)
        }
    }
    
}

extension URL {    
    fileprivate var videoIdentifier: String? {
        guard isYoutube != false else { return nil}
        
        if let identifier = parameters?["v"] {
            return identifier
        }
        return nil
    }
    
    fileprivate var isYoutube: Bool {
        if let feature = parameters?["feature"], feature == "youtu.be" {
            return true
        }
        return false
    }
    
    fileprivate var parameters: [String:String]? {
        guard let components = NSURLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }
        guard let items = components.queryItems, items.isEmpty == false else { return nil }
        
        var parameters = [String:String]()
        for item in items  {
            if let value = item.value {
                parameters[item.name] = value
            }
        }
        return parameters;
    }
    
}
