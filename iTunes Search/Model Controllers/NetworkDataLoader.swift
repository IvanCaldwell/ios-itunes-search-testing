//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Ivan Caldwell on 2/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    //need back: Data and Error
    // provide: URLRequest    
    func loadData(with request: URLRequest, completion: @escaping(Data?, Error?) -> Void)
}


extension URLSession: NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        let task = self.dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }
        task.resume()
    }
}
