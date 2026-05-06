//
//  SignupResponseDTO.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/2/26.
//  

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}

struct ErrorResponseDTO: Decodable {
    let path: String
    let timestamp: String
}
