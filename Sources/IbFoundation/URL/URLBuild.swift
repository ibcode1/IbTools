//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 22/07/2024.
//

import Foundation

public protocol URLBuilding {

    var build: URLRequest? { get }
    var basePath: String { get }

    init(scheme: String, host: String, path: String)

    func addQueryItem(name: String, value: String?) -> URLBuilding?
    func addHeader(field: String, value: String) -> URLBuilding?
}

public extension URLBuilding {

    var basePath: String { "" }

    init(scheme: String = "https", host: String, path: String) {
        self.init(scheme: scheme, host: host, path: path)
    }

    func addQueryItem(name: String, value: String?) -> URLBuilding? {
        self
    }

    func addHeader(field: String, value: String) -> URLBuilding? {
        self
    }
}
