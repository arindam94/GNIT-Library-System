//
//  BookTypeListVC.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 08/09/21.
//

import UIKit

class BookTypeListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var typeOfBookList: UITableView!
    var bookTypeList = [BookType]()
    var cdBookTypeList = [CDBookType]()
    
    private let manager: BooktypeManager = BooktypeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployee()
        setupUI()
    }
    
    func setupUI(){
        typeOfBookList.dataSource = self
        typeOfBookList.delegate = self
        typeOfBookList.register(UINib(nibName: "BookTypeListCell", bundle: nil), forCellReuseIdentifier: "BookTypeListCell")
        typeOfBookList.tableFooterView = UIView()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "Book Type"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTypeListCell") as! BookTypeListCell
        cell.bookType = bookTypeList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "BookListVC") as! BookListVC
        destinationVC.bookType = bookTypeList[indexPath.row]
        if let books = bookTypeList[indexPath.row].books , !books.isEmpty{
            destinationVC.bookList = books
        }
        destinationVC.cdBookType = cdBookTypeList[indexPath.row]

        navigationController?.pushViewController(destinationVC, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if manager.deleteBookType(type: bookTypeList[indexPath.row]){
                fetchEmployee()
            }
        }
    }
    
    
    func fetchEmployee(){
        self.bookTypeList = manager.fetchBookType() ?? []
        guard let result = PersistantStorage.shared.fetchRequest(mangeObject: CDBookType.self) else {
            return
        }
        
        self.cdBookTypeList = result
        typeOfBookList.reloadData()
    }
    
    

    @IBAction func addTypeOfBook(_ sender: UIBarButtonItem) {
        let addNewBookTypeVC = storyboard?.instantiateViewController(identifier: "AddBookType") as! AddBookType
        addNewBookTypeVC.onDismissAddBookTYpe = { [self] in fetchEmployee()}
        present(addNewBookTypeVC, animated: true) {
            
            
        }
        
    }
        

}
