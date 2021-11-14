//
//  TableViewCell.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 5.11.21.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func likeAction(photoName: String)
    func dislikeAction(photoName: String)
    func commentAction(photoName: String)
    //func commentAction(photoName: String, labelText: String)
    func shareAction()
    func bookmarkAction(photoName: String)
}


final class CellModel {
    let photoImage: UIImage?
    let photoName: String
    var isLiked: Bool
    var toBookmarks: Bool
    var commentString: String?
    
    init (initImageString: String, commentString: String? = nil) {
        photoName = initImageString
        isLiked = false
        toBookmarks = false
        photoImage = UIImage(named: initImageString)
        self.commentString = commentString
    }
}

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!

    
    static let identifier = "TableViewCell"
    private var bookmark: Bool = false
    private var liked: Bool = false
    private var namePhoto: String = ""
    
    weak var delegate: TableViewCellDelegate?
    
    
    func setupWith(model: CellModel) {
        
        namePhoto = model.photoName
        liked = model.isLiked
        bookmark = model.toBookmarks
        imageViewCell.image = model.photoImage
        commentLabel.text = model.commentString
        
        let likeButtonImage = UIImage(systemName: liked ? "heart.fill" : "heart")
        likeButton.setImage(likeButtonImage, for: .normal)
    
        let bookmarkButtonImage = UIImage(systemName: bookmark ? "bookmark.fill" : "bookmark")
        bookmarkButton.setImage(bookmarkButtonImage, for: .normal)
        
        
    }
    
     
   
 
}


// MARK: - Buttons Actions
extension TableViewCell {
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        if liked == true {
            delegate?.dislikeAction(photoName: namePhoto)
        } else {
            delegate?.likeAction(photoName: namePhoto)
        }
    }
    
    @IBAction func commentButtonAction(_ sender: UIButton) {
        delegate?.commentAction(photoName: namePhoto)
    }
   
    @IBAction func shareButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func bookmarkButtonAction(_ sender: UIButton) {
       // нe забыть прикрутить сюда тогл
        delegate?.bookmarkAction(photoName: namePhoto)
    }
    
}



