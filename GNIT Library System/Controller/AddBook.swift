//
//  AddBook.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import UIKit

class AddBook: UIViewController {

    @IBOutlet weak var labelAuthorName: UITextField!
    @IBOutlet weak var labelName: UITextField!
    let manger = BookManager()
    let bookTyprManager = BooktypeManager()
    var bookType: BookType?
    var cdBookType: CDBookType?
    var booklist = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAddTapp(_ sender: UIButton) {
        if let bookType = bookTyprManager.fetchBookTypeBy(identifier: bookType!.id){
            manger.createBookType(bookList: Book(_id: UUID(), _name: labelName.text!, _description: "Nice Book", _authorName: labelAuthorName.text!, _isAssigned: true, _publishers: "SN PVt. Ltd "), bookTypeId: bookType)
        }
    }

}
