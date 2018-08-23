//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    private enum CellIdentifiers {
        static let list = "CharactersCollectionViewCell"
        static let footer = "CollectionViewFooter"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CharactersViewModel!
    var errorView: ErrorView!
    private var shouldShowLoadingCell = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.errorView.frame = self.view.bounds
    }
    
    func setupViews() {
        let footerNib = UINib.init(nibName: CellIdentifiers.footer, bundle: nil)
        self.collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: CellIdentifiers.footer)
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        self.collectionView.isHidden = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: CellIdentifiers.list, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.list)

        self.errorView = ErrorView()
        self.errorView.isHidden = true
        self.errorView.delegate = self
        self.view.addSubview(self.errorView)
    }
    
    func setupViewModel() {
        guard let viewModel = self.viewModel else {
            self.viewModel = CharactersViewModel(delegate: self)
            self.viewModel.fetchCharacters()
            return
        }
        viewModel.fetchCharacters()
    }
}

extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.currentCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.list, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: viewModel.character(at: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.currentCount - 2 && self.viewModel.currentCount != self.viewModel.totalCount {
            self.viewModel.fetchCharacters()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionElementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifiers.footer, for: indexPath)
                return footerView
            
            default: return UICollectionReusableView()
        }
    }
}

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2.0 - 15
        let height = width + 70
        let size = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.selectItemAtIndex(indexPath.row)
    }
}

extension CharactersViewController: CharactersViewModelDelegate {
    func onFetchCompleted() {
        self.activityIndicator.stopAnimating()
        self.collectionView.isHidden = false
        self.collectionView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        self.collectionView.isHidden = true
        self.activityIndicator.stopAnimating()
        self.errorView.isHidden = false
    }
}

extension CharactersViewController: ErrorViewDelegate {
    func onErrorViewRefresh() {
        self.errorView.isHidden = true
        self.activityIndicator.startAnimating()
        self.viewModel.fetchCharacters()
    }
}
