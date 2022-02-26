//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by 董恩志 on 2022/2/23.
//

import Foundation

//MARK: - ArticleListViewModel
struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAartIndex(_ index: Int) -> ArticleViewModel {
        let artice = articles[index]
        return ArticleViewModel(artice)
    }
}

//MARK: - ArticleViewModel
struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return article.title
    }
    
    var description: String {
        return article.description
    }
}
