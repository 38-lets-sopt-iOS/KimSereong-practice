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
    
    var userId: Int = 1
    
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("전달받은 userId:", userId)
        
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
        
        editProfile()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField,
            editButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .boldSystemFont(ofSize: 20)
        }
        
        
        
        [nameTextField, emailTextField, ageTextField]
            .forEach {
                $0.addLeftPadding()
                $0.borderStyle = .roundedRect
                $0.backgroundColor = .white
                $0.isEnabled = true
                
            }
        
        [idTextField, partTextField]
            .forEach {
                $0.addLeftPadding()
                $0.borderStyle = .roundedRect
                $0.backgroundColor = .lightGray
                $0.isEnabled = false
                
            }
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
        
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
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
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
    }
    
    private func setAddTarget() {
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField, editButton].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        
        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
    
    
    private func editProfile() {
        Task {
            do {
                let userInfoData = try await EditProfileService.shared.editProfile(userId: userId)
                
                idTextField.text = "\(userInfoData.loginId)"
                nameTextField.text = userInfoData.name
                emailTextField.text = userInfoData.email
                ageTextField.text = "\(userInfoData.age)"
                partTextField.text = userInfoData.part
                
                self.name = userInfoData.name
                self.email = userInfoData.email
                self.age = userInfoData.age
                
                
                print(userInfoData)
                
            } catch {
                print("에러:", error)
            }
            
            
        }
    }
}

extension EditProfileAPIViewController{
    
    @objc
    private func editButtonDidTap() {
        Task {
            do {
                let _ = try await EditProfileService.shared.patchProfile(
                    
                    userId: self.userId,
                    name: self.name,
                    email: self.email,
                    age: self.age
                )
                
                let alert = UIAlertController(title: "유저 정보를 수정했습니다", message: "수정 완료", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
                
            } catch {
                print("수정 실패")
            }
        }
    }
    
    @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case nameTextField: name = textField.text ?? ""
        case emailTextField: email = textField.text ?? ""
        case ageTextField: age = Int(textField.text ?? "") ?? 0
        default: break
        }
        
    }
}
