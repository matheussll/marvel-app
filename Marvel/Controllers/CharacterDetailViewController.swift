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

    @IBOutlet weak var tableView: UITableView!
    var stretchyHeader: CharacterDetailStickyHeader!
    var viewModel: CharacterDetailViewModel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStickyHeader()
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
        self.stretchyHeader?.characterDescriptionLabel?.text = viewModel.characterDescription
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        self.stretchyHeader.manageScrollViewInsets = false
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
         let labelHeight = viewModel.characterDescription.heightWithConstrainedWidth(width: self.view.frame.width, font: UIFont.appFont(size: 15))
        
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 200 + labelHeight + (labelHeight > 0 ? 55 : 15))

        let view = CharacterDetailTableViewHeader(frame: frame)
        view.descriptionLabel.text = viewModel.characterDescription
        self.tableView.tableHeaderView = view
    }
}

extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let comic = viewModel.characterComic(at: indexPath.row)
        cell.textLabel?.text = comic.name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comicsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CharacterDetailTableViewSectionHeader()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

