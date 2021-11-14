//
//  ViewController.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 4.11.21.
//


import UIKit

final class HomeWorkVC: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
    
    let tableView = UITableView()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewSetup()
    }

    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeWorkVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.setupWith(model: dataSourceArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension HomeWorkVC: TableViewCellDelegate {

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
        showAlert(photoName: photoName)
    }

    func shareAction() {
    }

    func bookmarkAction(photoName: String) {
    }
}

// MARK: - UIAlertController
extension HomeWorkVC {

    @objc private func showAlert(photoName: String) {
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
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [weak self] _ in

            //        read textfield values
            guard let fields = alert.textFields, fields.count == 2 else {
                return
            }
            //        insert tag textfield
            let nameFields = fields[0]
            let commentFields = fields[1]
            //
            guard let name = nameFields.text, !name.isEmpty,
                  let comment = commentFields.text, !comment.isEmpty else {
                      print("fill in the fields")
                      return
                  }

            self?.dataSourceArray.first(where: { $0.photoName == photoName})?.commentString = "\(name): \(comment)"
            self?.tableView.reloadData()

        }))
        present(alert, animated: true)
    }

}

/*
func setSumm(first: Int?, second: Int?) -> Int? {
//        if let first = first {
//            if let second = second {
//                return first + second
//            } else {
//                return first
//            }
//        } else {
//            if let second = second {
//                return second
//            }
//        }
    /*
    if first == nil {
        return 0
    }
     */
    
    print()
    guard let first = first, let second = second else {
        return nil
    }
    print()
    return first + second
}
*/
