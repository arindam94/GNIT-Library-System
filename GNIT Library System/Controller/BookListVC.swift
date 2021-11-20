//
//  BookListVC.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import UIKit

class BookListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableBookList: UITableView!
    var bookList = [Book]()
    var bookType: BookType?
    var cdBookType: CDBookType?
    let manger = BookManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableBookList.dataSource = self
        tableBookList.delegate = self
        tableBookList.register(UINib(nibName: "BookListCell", bundle: nil), forCellReuseIdentifier: "BookListCell")
        fetchBook()
    }
    
    fileprivate func fetchBook(){
//        self.bookList = manger.fetchBookType(type: bookType!)!
        tableBookList.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell") as! BookListCell
        cell.selectionStyle = .none
        cell.bookInfo = bookList[indexPath.row]
        return cell
    }
    
    
    
    
    @IBAction func buttonAddnewBookTapp(_ sender: UIBarButtonItem) {
        let addNewBook = storyboard?.instantiateViewController(identifier: "AddBook") as! AddBook
        addNewBook.bookType = bookType
        addNewBook.booklist = bookList
        addNewBook.cdBookType = cdBookType
        navigationController?.present(addNewBook, animated: true, completion: {
            
        })
    }
    
}
