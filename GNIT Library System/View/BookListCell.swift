//
//  BookListCell.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 08/09/21.
//

import UIKit

class BookListCell: UITableViewCell {
    @IBOutlet weak var labelBookTitle: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelBookAuthor: UILabel!
    
    var bookInfo: Book?{
        didSet{
            if let bookinformation = bookInfo{
                labelBookTitle.text = bookinformation.name
                labelBookAuthor.text = bookinformation.authorName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    fileprivate func setupUI(){
        //labelBookTypeTitle.textColor = .white
       // labelBookDescription.textColor = .white
        viewBackground.layer.cornerRadius = 8
    }

    
}
