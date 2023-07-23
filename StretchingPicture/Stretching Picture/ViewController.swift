//
//  ViewController.swift
//  Stretching Picture
//
//  Created by Альберт Хайдаров on 19.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .white
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1800)
        scrollView.verticalScrollIndicatorInsets.top = imageHeight - view.safeAreaInsets.top
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
        return contentView
    }()
    private let imageHeight: CGFloat = 270
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "displayImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.origin = .zero
        imageView.frame.size = CGSize(width:view.frame.width, height: imageHeight)
        return imageView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        scrollView.delegate = self
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            imageView.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
            imageView.frame.size = CGSize(width: view.frame.width, height: imageHeight - scrollView.contentOffset.y)
            scrollView.verticalScrollIndicatorInsets.top = imageHeight - scrollView.contentOffset.y - view.safeAreaInsets.top
        }
    }
}
