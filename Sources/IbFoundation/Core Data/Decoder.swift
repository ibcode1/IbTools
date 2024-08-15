//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 12/08/2024.
//

import CoreData

public extension JSONDecoder {

    static func jsonDecoder(
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        nsManagedObjectContext: NSManagedObjectContext? = nil
    ) -> JSONDecoder {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        if let context = nsManagedObjectContext {
            decoder.userInfo[CodingUserInfoKey.managedObjectContext] = context
        }

        return decoder
    }
}

public extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

