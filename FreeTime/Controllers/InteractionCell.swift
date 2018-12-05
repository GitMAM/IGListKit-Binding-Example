//
//  InteractionCell.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import IGListKit

class InteractionCell: UICollectionViewCell, ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ActionViewModel else {return}
        self.numberOfViews.text = String(viewModel.views)
    }
    
    @IBOutlet weak var numberOfViews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func more(_ sender: UIButton) {
        
    }
}
