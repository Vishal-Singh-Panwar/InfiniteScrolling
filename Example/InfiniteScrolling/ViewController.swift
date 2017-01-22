//
//  ViewController.swift
//  InfiniteScrolling
//
//  Created by Vishal Singh on 1/21/17.
//  Copyright © 2017 Vishal Singh. All rights reserved.
//

import UIKit
import InfiniteScrolling

extension Card: InfiniteScollingData {}

class ViewController: UIViewController {
    @IBOutlet weak var collectionWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var infiniteScrollingBehaviour: InfiniteScrollingBehaviour!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let _ = infiniteScrollingBehaviour {}
        else {
            infiniteScrollingBehaviour = InfiniteScrollingBehaviour(withCollectionView: collectionView, andData: Card.dummyCards, delegate: self)
        }
    }
    
    private func registerCell() {
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellID")
    }
    
    @IBAction func update(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? infiniteScrollingBehaviour.reload(withData: Card.fewCards) : infiniteScrollingBehaviour.reload(withData: Card.dummyCards)
    }
    
    @IBAction func paginated(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        collectionView.isPagingEnabled = sender.isSelected
        let scrollingDirection = infiniteScrollingBehaviour.collectionConfiguration.scrollingDirection
        let configuration = sender.isSelected ? CollectionViewConfiguration(maxNumberOfCellsOnScreen: 1, scrollingDirection: scrollingDirection) :  CollectionViewConfiguration(maxNumberOfCellsOnScreen: 5, scrollingDirection: scrollingDirection)
        infiniteScrollingBehaviour.updateConfiguration(configuration: configuration)
    }
    
    @IBAction func verticalScrolling(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let maxNumberOfElements = infiniteScrollingBehaviour.collectionConfiguration.maxNumberOfCellsOnScreen
        collectionWidthConstraint.constant = sender.isSelected ? 60 : 300
        collectionHeightConstraint.constant = sender.isSelected ? 300 : 60
        view.layoutIfNeeded()
        let configuration = sender.isSelected ? CollectionViewConfiguration(maxNumberOfCellsOnScreen: maxNumberOfElements, scrollingDirection: .vertical) : CollectionViewConfiguration(maxNumberOfCellsOnScreen: maxNumberOfElements, scrollingDirection: .horizontal)
        infiniteScrollingBehaviour.updateConfiguration(configuration: configuration)
    }
}


extension ViewController: InfiniteScrollingBehaviourDelegate {
    func configuredCell(forItemAtIndexPath indexPath: IndexPath, originalIndex: Int, andData data: InfiniteScollingData, forInfiniteScrollingBehaviour behaviour: InfiniteScrollingBehaviour) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath)
        if let collectionCell = cell as? CollectionViewCell,
            let card = data as? Card {
            collectionCell.titleLabel.text = card.name
        }
        return cell
    }
}
