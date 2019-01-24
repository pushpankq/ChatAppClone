//
//  UserTableViewCell.swift
//  WhatsAppClone
//
//  Created by Puspank Kumar on 24/01/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    
 
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    var indexPath: IndexPath!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func generateCellWith(fUser: FUser, indexpath: IndexPath)  {
        
      //  self.indexPath = indexPath
        
        self.fullNameLabel.text = fUser.fullname
        
        if fUser.avatar != "" {
            
            imageFromData(pictureData: fUser.avatar) { (avatarImage) in
                
                if avatarImage != nil {
                    
                    self.avatarImageView.image = avatarImage?.circleMasked
                }
            }
        }
        
    }

}
