//
//  FullWidthSelfSizingCell.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

final class FullWidthSelfSizingCell: UICollectionViewCell, ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? PostViewModel else {return}
        print(viewModel.title)
        text = viewModel.title
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
