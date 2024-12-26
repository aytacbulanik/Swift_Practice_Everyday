    //
    //  User.swift
    //  SwiftPractice
    //
    //  Created by Aytaç Bulanık on 26.12.2024.
    //

import Foundation

struct User {
    let id: String
    var nameSurname: String
    let email: String
    let createdDate : Date
    var connetions : [String]
    var pendingRequests : [String]
    var sendRequests : [String]
}
