//
//  APIRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

import Foundation

protocol APIRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var headers : [String : String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

