//
//  ChatTableViewCell.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 4/25/26.
//

import UIKit
import Then
import SnapKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setStyle()
        setLayout()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    
    private let profileImage = UIImageView()
    private let profileName = UILabel()
    private let placeLabel = UILabel()
    private let messageLabel = UILabel()
    private let contentImage = UIImageView()
    
    // MARK: - UI

    
    func setStyle(){
        profileName.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
            $0.textColor = .black
        }
        
        profileImage.do {
            $0.contentMode = .scaleAspectFit
        }
        
        placeLabel.do {
            $0.font = .systemFont(ofSize: 13, weight: .regular)
            $0.textColor = .gray
        }
        
        messageLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.textColor = .black
        }
    }
    
    // MARK: - Setup

    
    func setUI(){
        [profileImage, profileName, placeLabel, messageLabel, contentImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout(){
        profileImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        profileName.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(profileName.snp.trailing).offset(4)
            $0.top.equalTo(profileName).offset(2)
        }
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileName)
        }
        contentImage.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }


}

    // MARK: - Extension


extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImage.image = chatData.profileImg
        profileName.text = chatData.name
        placeLabel.text = chatData.place
        messageLabel.text = chatData.message
        contentImage.image = chatData.itemImg
    }
}
