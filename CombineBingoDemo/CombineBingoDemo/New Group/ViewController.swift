//
//  ViewController.swift
//  CombineBingoDemo
//
//  Created by Wang Allen on 2022/11/25.
//

import UIKit
import Combine

let lastPostLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
let lastPosterLabelSubscribers = Subscribers.Assign(object: lastPostLabel, keyPath: \.text)
var cancellable: AnyCancellable!


struct BlogPost {
    let title: String
    let url: URL
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        blogPublisher.subscribe(lastPosterLabelSubscribers)
        NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
        print("Last post is : \(lastPostLabel.text!)")
        self.view.addSubview(lastPostLabel)
    }
}


let blogPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
    .map { aanotification -> String? in
        return (aanotification.object as? BlogPost)? .title ?? ""
    }



let blogPost = BlogPost(title: "Welcome to Combine", url: URL(string: "https://www.avanderlee.com/swift/combine/")!)



extension Notification.Name {
    static let newBlogPost = Notification.Name("New_Blog_Post")
}






