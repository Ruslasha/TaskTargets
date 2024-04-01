//
//  NetworkManager.swift
//  TaskTargets
//
//  Created by Руслан Абрамов on 01.04.2024.
//

import Foundation

class NetworkService {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let serverURLString = "https://jsonplaceholder.typicode.com/posts"

        guard let url = URL.makeURL(serverURLString, mockFileName: .posts) else {
            completion(.failure("Отсутствует моковый файл" as! Error))
            return
        }


            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "NetworkService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Данные не получены"])))
                    return
                }

                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(error))
                }
            }
            .resume()
        }
    }
