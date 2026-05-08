//
//  EditProfileAPIService.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/7/26.
//

import UIKit

final class EditProfileService {
    
    static let shared = EditProfileService()
    private init() {}
    
    
    private func makeRequest(
        userId: Int,
        method: String,
        body: Data?
    ) throws -> URLRequest {
        
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let path = "api/v1/users/\(userId)"
        let urlString = baseURL + path
        print("최종 URL:", urlString)
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        
        request.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        request.httpBody = body
        
        return request
    }
    
    
    func editProfile(userId: Int) async throws -> UserInfoData {
        
        let request = try makeRequest(
            userId: userId,
            method: "GET",
            body: nil
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let responseString = String(data: data, encoding: .utf8) {
            print("Response Body:", responseString)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(
                UserInfoResponseDTO.self,
                from: data
            )
            
            guard let userData = decoded.data else {
                throw NetworkError.dataError
            }
            
            return userData
        } catch {
            throw error
        }
    }
    
    func patchProfile(
        userId: Int,
        name: String,
        email: String,
        age: Int
    ) async throws -> UserInfoData {
        
        let requestBody = EditProfileRequestDTO(
            name: name,
            email: email,
            age: age
        )
        
        let body = try JSONEncoder().encode(requestBody)
        
        let request = try makeRequest(
            userId: userId,
            method: "PATCH",
            body: body
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            
            print("statusCode:", httpResponse.statusCode)
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response Body:", responseString)
            }
            
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(
                UserInfoResponseDTO.self,
                from: data
            )
            
            guard let userData = decoded.data else {
                throw NetworkError.dataError
            }
            
            return userData
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
