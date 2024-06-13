//
//  URLSessionProtocol.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/13/24.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {} 
