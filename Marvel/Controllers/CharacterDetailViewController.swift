//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView
import Kingfisher

class CharacterDetailViewController: UIViewController {
    private enum CellIdentifiers {
        static let detail = "CharacterDetailTableViewCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    var stretchyHeader: CharacterDetailStickyHeader!
    var viewModel: CharacterDetailViewModel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStickyHeader()
        self.setupTableView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarTransparent(transparent: true, animated: false)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarTransparent(transparent: false, animated: false)
    }
    
    func setupStickyHeader() {
        let nibViews = Bundle.main.loadNibNamed("CharacterDetailStickyHeader", owner: self, options: nil)
        
        self.stretchyHeader = nibViews?.first as? CharacterDetailStickyHeader ?? CharacterDetailStickyHeader(frame: CGRect.zero)
        
        let url = URL(string: viewModel.characterImageUrl)
        
        self.tableView.addSubview(self.stretchyHeader)
        
        self.stretchyHeader?.characterImageView?.kf.indicatorType = .activity
        self.stretchyHeader?.characterImageView?.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        self.stretchyHeader?.characterNameLabel?.text = viewModel.characterName
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        self.stretchyHeader.manageScrollViewInsets = false
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: CellIdentifiers.detail, bundle: nil), forCellReuseIdentifier: CellIdentifiers.detail)
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let labelHeight = self.viewModel.characterDescription.heightWithConstrainedWidth(width: self.view.frame.width, font: UIFont.appFont(size: 15))
        
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 190 + labelHeight)
        
        var headerFrame: CGRect!
        
        if self.viewModel.characterDescription.isEmpty {
            headerFrame = self.stretchyHeader.frame
        } else {
            headerFrame = frame
        }
        
        let view = CharacterDetailTableViewHeader(frame: headerFrame)
        view.backgroundColor = .darkGray
        view.contentView.backgroundColor = .darkGray
        view.descriptionLabel.text = self.viewModel.characterDescription
        self.tableView.tableHeaderView = view
        self.tableView.tableFooterView = UIView()
    }
}

extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.detail) as? CharacterDetailTableViewCell else {
            return UITableViewCell()
        }
        let comic = viewModel.characterComic(at: indexPath.row)
        cell.titleLabel?.text = comic.name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comicsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CharacterDetailTableViewSectionHeader()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

