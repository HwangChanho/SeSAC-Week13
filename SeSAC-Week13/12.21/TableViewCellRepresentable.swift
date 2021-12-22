//
//  TableViewCellRepresentable.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/21.
//

import UIKit

protocol TableViewCellRepresentable {
    var numberOfSection: Int { get }
    var numberOfRowsInSection: Int { get }
    var heightOfRowAt: CGFloat { get }
    
    func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
