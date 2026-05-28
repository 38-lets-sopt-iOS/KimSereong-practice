//
//  GetUsersListViewController.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/2/26.
//

import UIKit

import SnapKit
import Then

class GetUsersListViewController_Custom: UIViewController {
    
    private var userList: [UserData] = []
    
    private let usersListTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        
        getUsersList()
    }
    
    private func setUI() {
        view.addSubview(usersListTextView)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        usersListTextView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.isEditable = false
        }
    }
    
    private func setLayout() {
        usersListTextView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    private func getUsersList() {
        Task {
            do {
                let response = try await GetUserListService.shared.getUsersList()
                userList = response
                print("유저 리스트: \(response)")
                updateUI(userList: userList)
                
            } catch {
                let alert = UIAlertController(title: "유저 조회 실패", message: "다시 시도해 주세요", preferredStyle: .alert)
                
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
                
                print("유저 조회 실패", error)
            }
            
        }
    }
    
    func updateUI(userList: [UserData]){
        usersListTextView.text = userList
            .map{ "id: \($0.id), 이름: \($0.name), 파트: \($0.part)"}
            .joined(separator: "\n")
    }
}
