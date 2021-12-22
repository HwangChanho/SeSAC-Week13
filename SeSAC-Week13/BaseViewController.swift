//
//  BaseViewController.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/22.
//

import UIKit
import SnapKit
import Then

enum NASAAPIError: String, Error {
    case allow = "성공"
    case cancel = "실패"
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraint()
    }
    
    func setDelegate() {
        
    }
    
    func setConstraint() {
        
    }
    
    // View 초기화
    func configure() {
        view.backgroundColor = .white
    }
}

