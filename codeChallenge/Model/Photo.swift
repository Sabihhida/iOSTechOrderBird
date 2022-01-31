//
//  Photo.swift
//  codeChallenge
//
//  Created by Sabih Hida Tahir on 31/01/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import Foundation

struct FlickrResponse: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let photoDescription: String
    let datetaken: String
    let datetakengranularity: Int
    let datetakenunknown, tags: String

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case photoDescription = "description"
        case datetaken, datetakengranularity, datetakenunknown, tags
    }
}

// MARK: - \u00e9sDescription
struct Description: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
