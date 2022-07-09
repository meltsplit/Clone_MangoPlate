//
//  SearchBookViewController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import UIKit

class SearchBookViewController : UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var searchBookData : SearchBookModel?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NSNotification.Name.updateSearchBook, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
    }
    
    @objc private func updateData(){

        guard let data = searchBookData else { return }

        self.titleLabel.text = data.documents[0].title
        self.authorLabel.text = data.documents[0].authors[0]

        let imageData = try? Data(contentsOf: URL(string: data.documents[0].thumbnail)!)
        self.bookImageView.image = UIImage(data: imageData!)
    }

    
    
    //MARK: - IBOutlet
    
}

extension SearchBookViewController {
    
}

