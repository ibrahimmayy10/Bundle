//
//  NewsModel.swift
//  Bundle
//
//  Created by İbrahim Ay on 20.08.2023.
//

import Foundation

struct NewsModel: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let id: String?
    let name: String
}
