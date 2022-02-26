//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by 董恩志 on 2022/2/9.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    // MARK: - Properties
    private var articleListVM: ArticleListViewModel!
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "cell")
        setup()
    }

    // MARK: - Methods
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GoodNews"
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-01-26&sortBy=publishedAt&apiKey=97749a84b2664fee9039e69dbff88418")!
        
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = articleListVM.articleAartIndex(indexPath.row)
        cell.configure(viewModel: articleVM)
        
        return cell
    }

}
