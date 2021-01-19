//
//  Accounts.swift
//  test2
//
//  Created by Halyna on 14/01/2021.
//

import SwiftUI

struct Author: Identifiable {
    let id = UUID()
    var AccountFoto: String
    var AccountName: String
   
    
    static var AllAcount = [
        Author(AccountFoto: "onion", AccountName:"Halyna"),
        Author(AccountFoto: "onion", AccountName:"Thomas"),
        Author(AccountFoto: "onion", AccountName:"Vitalii"),
        Author(AccountFoto: "onion", AccountName:"Maria"),
    ]
}

