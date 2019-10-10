//
//  UserDetailModel.swift
//  genericModelMVVM
//
//  Created by STUser ramneet0001@yahoo.com on 26/06/19.
//  Copyright © 2019 abc. All rights reserved.


    import Foundation
    
    // MARK: - UserDetailModel
    struct UserDetailModel: Codable {
        let firstName, lastName: String?
        let detail: Detail?
    }
    
    // MARK: - Detail
    struct Detail: Codable {
        let degignation, companyName: String?
        let address: Address?
    }
    
    // MARK: - Address
    struct Address: Codable {
        let lat, lag: Double?
    }


