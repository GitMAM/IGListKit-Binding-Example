//
//  PostViewModel.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 05/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import Foundation
import IGListKit

final class PostViewModel: ListDiffable {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "action" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? PostViewModel else { return false }
        return title == object.title
    }
}
