//
//  TableViewCell.swift
//  Bundle
//
//  Created by İbrahim Ay on 20.08.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public var item: Articles! {
        didSet {
            self.titleLabel.text = item.description
            self.descriptionLabel.text = item.description
            
            guard let url = item.urlToImage else { return }
            self.newImageView.load(url: URL(string: url)!)
        }
    }
}
