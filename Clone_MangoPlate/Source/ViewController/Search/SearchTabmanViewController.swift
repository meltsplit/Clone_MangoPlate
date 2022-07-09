//
//  SearchTabMainController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import Foundation
import Tabman
import Pageboy

class SearchTabmanViewController : TabmanViewController{
    
    private var viewControllers : Array<UIViewController> = []
    
    let totalVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchTotalViewController") as! SearchTotalViewController
    let bookVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchBookViewController") as! SearchBookViewController
    let postVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchPostViewController") as! SearchPostViewController
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
        setDelegate()
        setBar()
        setNotification()
    }
    
    //MARK: - Custom Method
    
    private func setViewController(){
        viewControllers.append(totalVC)
        viewControllers.append(bookVC)
        viewControllers.append(postVC)
    }
    
    private func setDelegate(){
        self.dataSource = self
    }
    
    private func setBar(){
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .flat(color: .white)
        
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        
        bar.indicator.weight = .custom(value: 2.8)
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        // 버튼 사이 간격
           
        addBar(bar, dataSource: self, at: .top)
    }
    
    private func setNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NSNotification.Name.searchTitle, object: nil)
    }
    
    @objc func updateData(_ notification : NSNotification){
        
        let title = notification.object as? String ?? ""
        
        SearchBookService.shared.searchBook(title: title) { (response) -> (Void) in
            switch response{
            case .success(let bookData) :
                
                guard let data = bookData as? SearchBookModel else { return }
                
                self.totalVC.searchBookData = data
                self.bookVC.searchBookData = data
                self.postVC.searchBookData = data
                
                NotificationCenter.default.post(name: NSNotification.Name.updateSearchBook, object: nil)
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}

extension SearchTabmanViewController : PageboyViewControllerDataSource, TMBarDataSource{
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "통합")
        case 1:
            return TMBarItem(title: "도서")
        case 2:
            return TMBarItem(title: "포스트")
            
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        print(viewControllers.count)
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
    
    
    
}
