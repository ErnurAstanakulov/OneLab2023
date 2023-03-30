

import UIKit

class ViewController: UIViewController {
    
    lazy var imageScrollView: ImageScrollView = {
        let scrollView = ImageScrollView(frame: view.bounds)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Initialize imageScrollView and adding it to viewControllers view
        self.view.addSubview(self.imageScrollView)
        self.layoutImageScrollView()
        
        //2. Making an image from our photo path
        let imagePath = Bundle.main.path(forResource: "225H", ofType: "jpg")!
        let image = UIImage(contentsOfFile: imagePath)!
        
        //3. Ask imageScrollView to show image
        self.imageScrollView.display(image)
        
    }
    
    func layoutImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: imageScrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        let left = NSLayoutConstraint(item: imageScrollView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        
        let bottom = NSLayoutConstraint(item: imageScrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let right = NSLayoutConstraint(item: imageScrollView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([top, left, bottom, right])
    }
}
