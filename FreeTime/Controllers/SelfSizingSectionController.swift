//
//  SelfSizingSectionController.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import IGListKit

final class SelfSizingSectionController: ListBindingSectionController<Post>,
ListBindingSectionControllerDataSource {
    
    override init() {
        super.init()
        dataSource = self
    }
    
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
         guard let object = object as? Post else { fatalError() }
        let results: [ListDiffable] = [
            PostViewModel(title: object.title, id: object.id),
            ActionViewModel(views: object.numberOfWatches.numberOfWatches)
        ]
        return results
    }
    
    
    func sectionController(
        _ sectionController: ListBindingSectionController<ListDiffable>,
        sizeForViewModel viewModel: Any,
        at index: Int
        ) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        let height: CGFloat
        switch viewModel {
        case is ActionViewModel: height = 35
        default: height = 50
        }
        return CGSize(width: width, height: height)
    }
    
    
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        var cell = UICollectionViewCell()
        switch viewModel {
        case is PostViewModel:
            guard let manualCell = collectionContext?.dequeueReusableCell(of: FullWidthSelfSizingCell.self,
                                                                          for: self,
                                                                          at: index) as? FullWidthSelfSizingCell else {
                                                                            fatalError()
            }
            cell = manualCell
        default: guard let nibCell = collectionContext?.dequeueReusableCell(withNibName: "InteractionCell", bundle: nil, for: self, at: index) as? InteractionCell else {fatalError()}
            cell = nibCell
            
        }
        return cell as! UICollectionViewCell & ListBindable
        
    }
}
