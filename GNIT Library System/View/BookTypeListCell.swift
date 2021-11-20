//
//  BookTypeListCell.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 26/09/21.
//

import UIKit

class BookTypeListCell: UITableViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelBookTypeTitle: UILabel!
    @IBOutlet weak var labelBookDescription: UILabel!
    
    var bookType: BookType?{
        didSet{
            labelBookTypeTitle.text = bookType!.name
            labelBookDescription.text = bookType!.about

        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI(){
        labelBookTypeTitle.textColor = .white
        labelBookDescription.textColor = .white
        viewBackground.layer.cornerRadius = 8
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
