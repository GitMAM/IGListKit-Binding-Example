//
//  IntialViewController.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import IGListKit

final class IntialViewController: UIViewController, ListAdapterDataSource {
    
    let data : [ListDiffable] = [Post(title: "Egypt (/ˈiːdʒɪpt/ (About this soundlisten) EE-jipt; Arabic: مِصر‎ Miṣr, Egyptian Arabic: مَصر‎ Maṣr, Coptic: Ⲭⲏⲙⲓ Khēmi), officially the Arab Republic of Egypt, is a country spanning the northeast corner of Africa and southwest corner of Asia by a land bridge formed by the Sinai Peninsula. Egypt is a Mediterranean country bordered by the Gaza Strip and Israel to the northeast, the Gulf of Aqaba to the east, the Red Sea to the east and south, Sudan to the south, and Libya to the west. Across the Gulf of Aqaba lies Jordan, across the Red Sea lies Saudi Arabia, and across the Mediterranean lie Greece, Turkey and Cyprus, although none share a land border with Egypt.", id: "irrd", numberOfWatches: NumberOfView(numberOfWatches: 23, isPinned: true)), Post(title: "Egypt has one of the longest histories of any country, tracing its heritage back to the 6th–4th millennia BCE. Considered a cradle of civilisation, Ancient Egypt saw some of the earliest developments of writing, agriculture, urbanisation, organised religion and central government.[12] Iconic monuments such as the Giza Necropolis and its Great Sphinx, as well the ruins of Memphis, Thebes, Karnak, and the Valley of the Kings, reflect this legacy and remain a significant focus of scientific and popular interest. Egypt's long and rich cultural heritage is an integral part of its national identity, which has endured, and often assimilated, various foreign influences, including Greek, Persian, Roman, Arab, Ottoman Turkish, and Nubian. Egypt was an early and important centre of Christianity, but was largely Islamised in the seventh century and remains a predominantly Muslim country, albeit with a significant Christian minority.", id: "dfewr", numberOfWatches: NumberOfView(numberOfWatches: 23, isPinned: true)), Post(title: "From the 16th to the beginning of the 20th century, Egypt was ruled by foreign imperial powers: The Ottoman Empire and the British Empire. Modern Egypt dates back to 1922, when it gained nominal independence from the British Empire as a monarchy. However, British military occupation of Egypt continued, and many Egyptians believed that the monarchy was an instrument of British colonialism. Following the 1952 revolution, Egypt expelled British soldiers and bureaucrats and ended British occupation, nationalized the British-held Suez Canal, exiled King Farouk and his family, and declared itself a republic. In 1958 it merged with Syria to form the United Arab Republic, which dissolved in 1961. Throughout the second half of the 20th century, Egypt endured social and religious strife and political instability, fighting several armed conflicts with Israel in 1948, 1956, 1967 and 1973, and occupying the Gaza Strip intermittently until 1967. In 1978, Egypt signed the Camp David Accords, officially withdrawing from the Gaza Strip and recognising Israel. The country continues to face challenges, from political unrest, including the recent 2011 revolution and its aftermath, to terrorism and economic underdevelopment. Egypt's current government is a presidential republic headed by President Abdel Fattah el-Sisi, which has been described by a number of watchdogs as authoritarian.", id: "werwerwer", numberOfWatches: NumberOfView(numberOfWatches: 23, isPinned: true)),Post(title: "Islam is the official religion of Egypt and Arabic is its official language.[13] With over 95 million inhabitants, Egypt is the most populous country in North Africa, the Middle East, and the Arab world, the third-most populous in Africa (after Nigeria and Ethiopia), and the fifteenth-most populous in the world. The great majority of its people live near the banks of the Nile River, an area of about 40,000 square kilometres (15,000 sq mi), where the only arable land is found. The large regions of the Sahara desert, which constitute most of Egypt's territory, are sparsely inhabited. About half of Egypt's residents live in urban areas, with most spread across the densely populated centres of greater Cairo, Alexandria and other major cities in the Nile Delta.", id: "UniqueId", numberOfWatches: NumberOfView(numberOfWatches: 23, isPinned: true))]
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        if object is Post {
            return SelfSizingSectionController()
//        } else {
//            return InteractionSectionController()
//        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
}

final class Post: ListDiffable {
    let title: String
    let id: String
    let numberOfWatches: NumberOfView
    init(title: String, id: String, numberOfWatches: NumberOfView) {
        self.title = title
        self.id = id
        self.numberOfWatches = numberOfWatches
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Post else {
            return false
        }
        return self.id == object.id
    }
}

final class NumberOfView {
    let numberOfWatches: Int
    let isPinned: Bool
    init(numberOfWatches: Int, isPinned: Bool) {
        self.numberOfWatches = numberOfWatches
        self.isPinned = isPinned
    }
}
