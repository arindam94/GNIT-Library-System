//
//  AddBook.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import UIKit

class AddBook: UIViewController {

    @IBOutlet weak var buttonRentStatusNo: UIButton!
    @IBOutlet weak var buttonRentStatusYes: UIButton!
    @IBOutlet weak var labelAuthorName: UITextField!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var textViewBookDescription: UITextView!
    
    @IBOutlet weak var labelPublisherName: UITextField!
    var isRented: Bool = false
    let manger = BookManager()
    let bookTyprManager = BooktypeManager()
    var bookType: BookType?
    var cdBookType: CDBookType?
    var booklist = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI(){
        textViewBookDescription.layer.cornerRadius = 8
        textViewBookDescription.layer.borderWidth = 1
        textViewBookDescription.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func buttonAddTapp(_ sender: UIButton) {
        if let bookType = bookTyprManager.fetchBookTypeBy(identifier: bookType!.id){
            if let name = labelName.text, let description = textViewBookDescription.text, let authorname = labelAuthorName.text, let publisherName = labelPublisherName.text{
                manger.createBookType(bookList: Book(_id: UUID(), _name: name, _description: description, _authorName: authorname, _isAssigned: isRented, _publishers: publisherName), bookTypeId: bookType)
            }
            else{
            }
        }
    }
    
    @IBAction func buttonRentStatusYesTapped(_ sender: UIButton) {
        isRented = true
        sender.setImage(UIImage(named: "checked"), for: .normal)
        buttonRentStatusNo.setImage(UIImage(named: "unchecked"), for: .normal)
    }
    
    @IBAction func buttonRentStatusNoTapped(_ sender: UIButton) {
        isRented = false
        sender.setImage(UIImage(named: "checked"), for: .normal)
        buttonRentStatusYes.setImage(UIImage(named: "unchecked"), for: .normal)
    }
}
