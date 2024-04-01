//
//  ViewController.swift
//  TaskTargets
//
//  Created by Руслан Абрамов on 01.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let networkService = NetworkService()

    private var posts: [Post] = []


    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self

        fetchPosts()
    }

    private func fetchPosts() {
        networkService.fetchPosts { [weak self] resut in
            switch resut {
            case .success(let posts):
                Task {
                    self?.posts = posts.map { $0 }
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Ошибка при загрузке постов: \(error.localizedDescription)")
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
}


