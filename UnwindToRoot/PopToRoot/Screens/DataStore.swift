//
//  DataStore.swift
//  UnwindToRoot
//
//  Created by Shantanu Dutta on 1/23/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import Foundation

protocol PassInfoDelegate {
    var savedValue: String {get}
    func info(_ value: String)
}

struct DataFactory {
    static let instance = DataFactory()
    private var store = DataStore()
    func dataStore() -> PassInfoDelegate {
        return store
    }
}

class DataStore: PassInfoDelegate {
    private var savedData: String = "Lets start"
    var savedValue: String {
        return savedData
    }

    func info(_ value: String) {
        self.savedData = value
    }
}
