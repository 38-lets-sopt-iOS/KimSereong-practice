//
//  EditProfileRequsetDTO.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/7/26.
//

import Foundation

struct EditProfileRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
