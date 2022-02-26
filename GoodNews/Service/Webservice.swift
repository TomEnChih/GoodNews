//
//  Webservice.swift
//  GoodNews
//
//  Created by 董恩志 on 2022/2/9.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completoin: @escaping([Article]?)-> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completoin(nil)
                
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                completoin(articleList?.articles)
                
            }
            
        }.resume()
        
    }
    
}
