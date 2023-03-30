//
//  ImageScrollView.swift
//  ScrollViewProject
//
//  Created by Yernur on 28.03.2023.
//

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.decelerationRate = .fast
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure scrollView to display new image
    func display(_ image: UIImage) {
        
        //1. clear the previous image
        imageView?.removeFromSuperview()
        imageView = nil
        
        //2. make a new UIImageView for the new image
        imageView = UIImageView(image: image)
        
        self.addSubview(imageView)
        
        self.configureFor(image.size)
    }
    
    func configureFor(_ imageSize: CGSize) {
        self.contentSize = imageSize
        self.maximumZoomScale = 5
        self.minimumZoomScale = 0.01
        self.zoomScale = self.minimumZoomScale
    }
    
    //MARK: - UIScrollView Delegate Methods
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerImage()
    }
    
    func centerImage() {
        // center the zoom view as it becomes smaller than the size of the screen
        let boundsSize = self.bounds.size
        var frameToCenter = imageView?.frame ?? CGRect.zero
        
        // center horizontally
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width)/2
        }
        else {
            frameToCenter.origin.x = 0
        }
        
        // center vertically
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height)/2
        }
        else {
            frameToCenter.origin.y = 0
        }
        
        imageView?.frame = frameToCenter
    }
    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.centerImage()
    }
}
