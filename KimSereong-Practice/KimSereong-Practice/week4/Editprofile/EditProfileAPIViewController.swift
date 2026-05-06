//
//  EditProfileAPIViewController.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/7/26.
//


import UIKit

import Then
import SnapKit

final class EditProfileAPIViewController: UIViewController {
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()

    
    private var id: String = ""
    private var password: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
            view.addSubviews(
                idTextField, passwordTextField, nameTextField, emailTextField, ageTextField, partTextField,
                editButton
            )
        }
        
        private func setStyle() {
            view.backgroundColor = .white
            
            let placeholder = ["아이디", "비밀번호", "이름", "이메일", "나이", "iOS, 안드로이드, 웹 중 하나를 입력해주세요."]
            
            [idTextField, passwordTextField, nameTextField, emailTextField, ageTextField, partTextField]
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
            
        }
        
        private func setLayout() {
            idTextField.snp.makeConstraints {
                $0.top.equalToSuperview().inset(70)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            passwordTextField.snp.makeConstraints {
                $0.top.equalTo(idTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            nameTextField.snp.makeConstraints {
                $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            emailTextField.snp.makeConstraints {
                $0.top.equalTo(nameTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            ageTextField.snp.makeConstraints {
                $0.top.equalTo(emailTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
            partTextField.snp.makeConstraints {
                $0.top.equalTo(ageTextField.snp.bottom).offset(10)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            
        }
        
        private func setAddTarget() {
            [idTextField,passwordTextField, nameTextField, emailTextField, ageTextField, partTextField].forEach {
                $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
            }
            signupButton.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
            loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
            getUsersButton.addTarget(self, action: #selector(getUsersButtonDidTap), for: .touchUpInside)
        }
    }


extension SignupViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        case partTextField:
            part = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            return
        }
    }
    
    @objc
    private func signupButtonDidTap() {
        Task {
            do {
                let _ = try await SignupService.shared.postSignup(
                    loginId: id,
                    password: password,
                    name: name,
                    email: email,
                    age: age,
                    part: part
                )
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.navigationController?.pushViewController(LoginAPIViewController(), animated: true)
                            }
                
                self.navigationController?.pushViewController(LoginAPIViewController(), animated: true)
                print("회원가입 성공")
            } catch {
                let alert = UIAlertController(title: "회원가입 실패", message: nil, preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
                
                print("회원가입 실패", error)
            }
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        navigationController?.pushViewController(LoginAPIViewController(), animated: true)
    }
    
    @objc
    private func getUsersButtonDidTap() {
        navigationController?.pushViewController(GetUsersListViewController_Custom(), animated: true)
    }
}
