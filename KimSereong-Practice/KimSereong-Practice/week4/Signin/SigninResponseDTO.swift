//
//  SigninResponseDTO.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/7/26.
//

import Foundation

struct SigninResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: SigninData?
    let meta: ErrorResponseDTO?
}

struct SigninData: Decodable {
    let userId: Int
}
