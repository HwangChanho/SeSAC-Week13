//
//  SignViewController.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/22.
//

import UIKit

class SignViewController: BaseViewController {
    
    var mainView = SignView()
    var viewModel = SignViewModel()
    
    // loadView 다음에 viewdidload 호출, 새로운 뷰를 반환하려할때 사용
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bind { text, color in
            self.mainView.passwordTextField.text = text
            self.mainView.passwordTextField.textColor = color
        }
    }
    
    override func configure() {
        title = viewModel.navigationTitle
        
        mainView.emailTextField.placeholder = "이메일을 작성해주세요"
        mainView.emailTextField.text = viewModel.text
        
        mainView.signButton.addTarget(self, action: #selector(signButtonPressed), for: .touchUpInside)
        
        mainView.signButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    override func setDelegate() {
        
    }
    
    override func setConstraint() {
        
    }
    
    @objc func signButtonPressed(_ sender: UIButton) {
        print(#function)
        
        guard let text = mainView.emailTextField.text else { return }
        viewModel.text = text
    }
}
