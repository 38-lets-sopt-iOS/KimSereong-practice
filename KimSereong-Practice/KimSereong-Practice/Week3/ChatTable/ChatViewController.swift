//
//  ChatViewController.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 4/25/26.
//

import UIKit
import Then
import SnapKit

class ChatViewController : ViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    //AutoLayout으로 frame 잡을 예정
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setupLayout()
        setDelagate()
        register()
    }
    
    private func setUI() {
        self.view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    // MARK: - Delagate
    
    private func setDelagate() {
        tableView.delegate = self
        tableView.dataSource = self
    } //위임 받은 역할을 어떻게 정의할지 몰라서 에러
    
    
}

    // MARK: - Extension


extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
            cell.dataBind(chatList[indexPath.row])
        return cell
    }
}




