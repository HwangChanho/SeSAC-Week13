//
//  UITableViewCell+Extension.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/21.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
