//
//  SupportArticleResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct SupportArticleResponseDTO: Decodable {

    var id: String?
    var title: String?
    var summary: String?
    var tags: [String]?
    var url: String?
}
