//
//  ViewController.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 4.11.21.
//


import UIKit



//protocol ViewControllerDelegate: AnyObject {
//    func insertTextLabel(labelText: String)
//
//}



final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private let dataSourceArray: [CellModel] = [
        CellModel(initImageString: "img_1"),
        CellModel(initImageString: "img_2"),
        CellModel(initImageString: "img_3"),
        CellModel(initImageString: "img_4"),
        CellModel(initImageString: "img_5"),
        CellModel(initImageString: "img_6"),
        CellModel(initImageString: "img_7"),
        CellModel(initImageString: "img_8"),
        CellModel(initImageString: "img_9"),
        CellModel(initImageString: "img_10"),
        CellModel(initImageString: "img_11"),
        CellModel(initImageString: "img_12"),
        CellModel(initImageString: "img_13"),
        CellModel(initImageString: "img_14"),
        CellModel(initImageString: "img_15")
    ]
    
//    private var personNameComment: String = ""
//    private var textComment: String = ""
    
  //  weak var delegate: ViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.setupWith(model: dataSourceArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}


 
extension ViewController: TableViewCellDelegate {
    
    func likeAction(photoName: String) {
        dataSourceArray.first(where: {$0.photoName == photoName })?.isLiked = true
        let object = dataSourceArray.first(where: {$0.photoName == photoName })
        object?.isLiked = true
        tableView.reloadData()
    }
    
    func dislikeAction(photoName: String) {
        dataSourceArray.first(where: {$0.photoName == photoName })?.isLiked = false
        tableView.reloadData()
    }
    
    func commentAction(photoName: String) {
        showAlert()
    }
                                       
    func shareAction() {
    }
    
    func bookmarkAction(photoName: String) {
    }
}

// MARK: - UIAlertController
extension ViewController {
  
    @objc private func showAlert() {
        let alert = UIAlertController(
            title: "hello",
            message: "how are you?",
            preferredStyle: .alert
        )
        
        //        add 2 textfields
        alert.addTextField { field in
            field.placeholder = "add your name"
            field.returnKeyType = .next
            field.keyboardType = .default
        }
        alert.addTextField { field in
            field.placeholder = "add comment"
            field.returnKeyType = .continue
            field.keyboardType = .default
        }
        
            //        add buttons
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            
            //        read textfield values
            guard let fields = alert.textFields, fields.count == 2 else {
                return
            }
            let nameFields = fields[0]
            let commentFields = fields[1]
            guard let name = nameFields.text, !name.isEmpty,
                  let comment = commentFields.text, !comment.isEmpty else {
                      print("fill in the fields")
                      return
                  }
            
            
            //
            print( "\(name): \(comment)")
            
           
           // self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
}


