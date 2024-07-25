//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 22/07/2024.
//

import Foundation

public final class ApiService: ApiServiceProtcol {

  private let urlSession: URLSession
  private let decoder: JSONDecoder

  public init(urlSession: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
    self.urlSession = urlSession
    self.decoder = decoder
  }

  public func fetchData<T: Decodable>(for endpoint: URLBuilding) async throws -> T {

    guard let urlRequest = endpoint.build else {
      throw URLError(.badURL)
    }

    let (data, response) = try await urlSession.data(for: urlRequest)

    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
      throw URLError(.badServerResponse)
    }

    do {
      let dataResponse: T = try decoder.decode(T.self, from: data)
      return dataResponse
    } catch {
      throw error
    }
  }
}
