//
//  FindMainViewController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/06.
//

import UIKit

class FindMainViewController : UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var advertiseScrollView: UIScrollView!
    @IBOutlet weak var advertiseImageView: UIImageView!
    @IBOutlet weak var advertisePageControl: UIPageControl!
    
    private var images = [UIImage(named: "event0"),UIImage(named: "event1"),UIImage(named: "event2")]
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        addContentScrollView()
        setPageControl()
    }
    
    //MARK: - Custom Method
    private func setDelegate(){
        
        advertiseScrollView.delegate = self
        
    }
    
    
    //MARK: - IBOutlet
    @IBAction func currentLocationPressed(_ sender: UIBarButtonItem) {
        print("current Location")
    }
    
    @IBAction func rightBarBtnPressed(_ sender: UIBarButtonItem) {
        print(sender.tag)
        
    }
    
}

extension FindMainViewController : UIScrollViewDelegate {
    
    private func addContentScrollView() {
            
            for i in 0..<images.count {
                let imageView = UIImageView()
                let xPos = self.view.frame.width * CGFloat(i)
                imageView.frame = CGRect(x: xPos, y: 0, width: advertiseScrollView.bounds.width, height: advertiseScrollView.bounds.height)
                imageView.image = images[i]
                advertiseScrollView.addSubview(imageView)
                advertiseScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            }
            
    }
    
    private func setPageControl() {
        advertisePageControl.numberOfPages = images.count
           
    }
       
    private func setPageControlSelectedPage(currentPage:Int) {
       advertisePageControl.currentPage = currentPage
    }
       
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
           
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }

        
}

