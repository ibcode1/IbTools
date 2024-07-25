//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 22/07/2024.
//

import Foundation

public protocol ApiServiceProtcol {

  func fetchData<T: Decodable>(for endpoint: URLBuilding) async throws -> T
}
