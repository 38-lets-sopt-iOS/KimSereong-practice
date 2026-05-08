//
//  LoginAPIViewController.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/2/26.
//


import UIKit

import Then
import SnapKit

final class SigninAPIViewController: UIViewController {
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var signupButton = UIButton()

    
    private var id: String = ""
    private var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
            view.addSubviews(
                idTextField, passwordTextField,
                signupButton
            )
        }
        
        private func setStyle() {
            view.backgroundColor = .white
            
            let placeholder = ["아이디", "비밀번호"]
            
            [idTextField, passwordTextField]
                .enumerated()
                .forEach { index, textField in
                    textField.do {
                        $0.addLeftPadding()
                        $0.placeholder = placeholder[index]
                        $0.borderStyle = .roundedRect
                        $0.autocapitalizationType = .none
                        $0.autocorrectionType = .no
                        $0.spellCheckingType = .no
                    }
                }
            
            signupButton.do {
                $0.setTitle("로그인", for: .normal)
                $0.backgroundColor = .systemBlue
                $0.layer.cornerRadius = 10
            }
            
        }
        
        private func setLayout() {
            idTextField.snp.makeConstraints {
                $0.top.equalToSuperview().inset(120)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            passwordTextField.snp.makeConstraints {
                $0.top.equalTo(idTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            
            signupButton.snp.makeConstraints {
                $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
        }
        
        private func setAddTarget() {
            [idTextField, passwordTextField].forEach {
                $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
            }
            signupButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
            
        }
    }


extension SigninAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        view.endEditing(true)
        
        Task {
            do {
                let response = try await SigninService.shared.postSignin(
                    loginId: id,
                    password: password
                )
                
                if response.success, let userId = response.data?.userId {
                    let editprofileAPIViewController = EditProfileAPIViewController()
                    editprofileAPIViewController.userId = userId
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.navigationController?.pushViewController(editprofileAPIViewController, animated: true)
                    }
                    
                    print("로그인 성공, userId: \(userId)")
                    
                } else {
                    let alert = UIAlertController(
                        title: "로그인 실패",
                        message: response.message,
                        preferredStyle: .alert
                    )
                    
                    let okAction = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                    
                    print("로그인 실패: \(response.message)")
                }
                
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("로그인 실패", error)
            }
        }
    }
    

}
