//
//  AddBookType.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 09/09/21.
//

import UIKit

class AddBookType: UIViewController {
    @IBOutlet weak var textfeildBookDescription: UITextField!
    @IBOutlet weak var textfeildBookType: UITextField!
    
    private let manager: BooktypeManager = BooktypeManager()
    
    var onDismissAddBookTYpe:(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAddTapp(_ sender: UIButton) {
        manager.createBookType(type: BookType(_id: UUID(), _about: textfeildBookDescription.text!, _name: textfeildBookType.text!, _books: nil))
        self.dismiss(animated: true) { [self] in
            onDismissAddBookTYpe!()
        }
        }
    


}
