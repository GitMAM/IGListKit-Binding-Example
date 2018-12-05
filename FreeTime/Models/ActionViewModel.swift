//
//  ActionViewModel.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 05/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import IGListKit

final class ActionViewModel: ListDiffable {
    
    let views: Int
    
    init(views: Int) {
        self.views = views
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "action" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ActionViewModel else { return false }
        return views == object.views
    }
}


