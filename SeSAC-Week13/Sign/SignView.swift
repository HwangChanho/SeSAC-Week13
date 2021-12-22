//
//  SignView.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/22.
//

import UIKit

class SignView: UIView {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
        setupConstraints()
    }
    
    func configure() {
        emailTextField.backgroundColor = .yellow
        passwordTextField.backgroundColor = .yellow
        signButton.backgroundColor = .blue
    }
    
    func setupConstraints() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(signButton)
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        signButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField)
            $0.height.equalTo(passwordTextField)
        }
        
        
    }
}
