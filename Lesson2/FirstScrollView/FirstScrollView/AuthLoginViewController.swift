//
//  AuthLoginViewController.swift
//  FirstScrollView
//
//  Created by Yernur on 28.03.2023.
//

import UIKit
class AuthLoginViewController: UIPageViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.decelerationRate = .fast
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        var pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = backgroundView.count
        pageControl.currentPage = 0
        pageControl.tintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    var backgroundView = [UIView(), UIView(), UIView()]
    var colors: [Colors] = [.lightOrange, .mediumOrange, .darkOrange]
    
    enum Colors {
        case lightOrange
        case mediumOrange
        case darkOrange
        
        var color: UIColor {
            switch self {
            case .lightOrange:
                return UIColor(red: 1.0, green: 160/255, blue: 122/255, alpha: 1.0)
            case .mediumOrange:
                return UIColor(red: 1.0, green: 127/255, blue: 80/255, alpha: 1.0)
            case .darkOrange:
                return UIColor(red: 1.0, green: 87/255, blue: 51/255, alpha: 1.0)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupPageControl()
        addViewToScroll()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addViewToScroll() {
        for i in 0..<backgroundView.count {
            let secondView = backgroundView[i]
            secondView.translatesAutoresizingMaskIntoConstraints = false
            secondView.backgroundColor = colors[i].color
            scrollView.addSubview(secondView)
            
            NSLayoutConstraint.activate([
                secondView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.bounds.width * CGFloat(i)),
                secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -view.bounds.width * CGFloat(backgroundView.count - 1 - i)),
                secondView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                secondView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
        }
    }
}

extension AuthLoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.x != 0, scrollView.frame.size.width != 0 else {
            print("erro de tamanho, igual a 0")
            return
        }
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
