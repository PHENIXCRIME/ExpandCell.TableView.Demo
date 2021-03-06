//
//  CardDetailSettingCell.swift
//  ExpandCell.EbueroApp
//
//  Created by PHENIXCRIME on 29/4/2564 BE.
//

import UIKit

protocol cardDetailSettingCellDelegate {
    func btnMoreDetailDidTapped(index:Int)
}

class CardDetailSettingCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgHeadDetail: UIImageView!
    @IBOutlet weak var txDetail: UILabel!
    @IBOutlet weak var btnMoreDetail: UIButton!
    @IBOutlet weak var tableViewDetail: SettingTableView!
    
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    
    public var subSettingData: SettingData?
    
    var index: Int = 0

    var delegate: cardDetailSettingCellDelegate?
    
    static let identifier = "cardDetailSettingCell"

    static func nib() ->UINib {
        return UINib(nibName: "cardDetailSettingCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        registerCell()
        tableViewDetail.estimatedRowHeight = 300
        tableViewDetail.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func btnMore(_ sender: Any) {
        delegate?.btnMoreDetailDidTapped(index: index)
    }
    
    func setupView() {
        tableViewDetail.delegate = self
        tableViewDetail.dataSource = self
        tableViewDetail.separatorStyle = .none
        tableViewDetail.rowHeight = UITableView.automaticDimension
    }
    
    func registerCell() {
        let bottomDetailCell = UINib(nibName: "BottomDetailCell", bundle: Bundle.main)
        tableViewDetail.register(bottomDetailCell, forCellReuseIdentifier: "bottomDetailCell")
    }

    
    func prepareCell(subSetting:SettingData) {
        subSettingData = subSetting
        adjustTableView()
    }
    
    func adjustTableView() {
        let totalCell:Int = subSettingData?.subSettingMenu?.count ?? 0
        let heightSubSetting:Int = 60
        let heightTableViewSubSetting = totalCell * heightSubSetting
        DispatchQueue.main.async {
            self.tableViewDetail.reloadData()
            self.heightTableView.constant = CGFloat(heightTableViewSubSetting)
            self.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subSettingData?.subSettingMenu?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subSettingCell = subSettingData?.subSettingMenu?[indexPath.row]
        let cell = tableViewDetail.dequeueReusableCell(withIdentifier: BottomDetailCell.identifier, for: indexPath) as! BottomDetailCell
        cell.txSubSetting.text = subSettingCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
