//
//  Model.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 13.12.2022.
//

import Foundation

struct AstronomyPicture: Decodable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let media_type: String?
    let service_version: String?
    let title: String?
    let url: String?
}
