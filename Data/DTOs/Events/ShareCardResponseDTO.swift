//
//  ShareCardResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ShareCardResponseDTO: Decodable {

    var title: String?
    var startsAt: String?
    var locationName: String?
    var deepLink: String?
    var shareUrl: String?
    var ogImageUrl: String?

    enum CodingKeys: String, CodingKey {
        case title
        case startsAt = "starts_at"
        case locationName = "location_name"
        case deepLink = "deep_link"
        case shareUrl = "share_url"
        case ogImageUrl = "og_image_url"
    }
}
