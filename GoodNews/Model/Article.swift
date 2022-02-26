//
//  Article.swift
//  GoodNews
//
//  Created by 董恩志 on 2022/2/16.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
