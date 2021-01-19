//
//  Accounts.swift
//  test2
//
//  Created by Halyna on 14/01/2021.
//

import SwiftUI

struct Author: Identifiable {
    let id = UUID()
    var AccountPhoto: String
    var AccountName: String
   
    
    static var AllAcount = [
        Author(AccountPhoto: "onion", AccountName:"Halyna"),
        Author(AccountPhoto: "onion", AccountName:"Thomas"),
        Author(AccountPhoto: "onion", AccountName:"Vitalii"),
        Author(AccountPhoto: "onion", AccountName:"Maria"),
    ]
}

