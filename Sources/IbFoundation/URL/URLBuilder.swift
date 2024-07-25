//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 22/07/2024.
//

import Foundation

public final class URLBuilder: URLBuilding {

    private var urlComponents: URLComponents
    private var queryItems: [URLQueryItem]?
    private var headers: [String: String]?

    public var build: URLRequest? {

        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        headers?.forEach { request.addValue($0, forHTTPHeaderField: $1) }
        request.url = urlComponents.url

        return request
    }

    public required init(scheme: String = "https", host: String, basePath: String = "", path: String) {

        self.urlComponents = URLComponents()
        self.urlComponents.scheme = scheme
        self.urlComponents.host = host
        self.urlComponents.path = "\(basePath)\(path)"
    }

    @discardableResult
    public func addQueryItem(name: String, value: String?) -> URLBuilding? {

        if queryItems == nil {
            queryItems = []
        }

        queryItems?.append(URLQueryItem(name: name, value: value))
        urlComponents.queryItems = queryItems

        return self
    }

    @discardableResult
    public func addHeader(field: String, value: String) -> URLBuilding? {

        if headers == nil {
            headers = [:]
        }

        headers?[value] = field

        return self
    }
}
