//
//  EditProfileResponseDTO.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/7/26.
//

import Foundation

struct UserInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfoData?
    let meta: ErrorResponseDTO?
}

typealias EditProfileResponseDTO = UserInfoResponseDTO

struct UserInfoData: Codable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
