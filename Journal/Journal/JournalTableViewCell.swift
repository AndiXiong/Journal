//
//  JournalTableViewCell.swift
//  Journal
//
//  Created by Andi Xiong on 2019-01-09.
//  Copyright © 2019 Andi Xiong. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var TaskToDo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func completeTask(_ sender: Any) {
        
        
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
