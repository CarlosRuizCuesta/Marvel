//
//  MarvelApi.swift
//  Marvel
//
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class MarvelApi {
    static var PARAM_KEY = "apikey"
    static var PARAM_HASH = "hash"
    static var PARAM_TS = "ts"
    static var PUBLICKEY = "1090e55c47795bc084d567c4836470af"
    static var PRIVATEKEY = "4258912c1a09fef3bc3e4c95039964c820727f63"
    static var TS = NSDate()
    static var HASH = MarvelApi.TS.timestamp + MarvelApi.PRIVATEKEY + MarvelApi.PUBLICKEY
    
    var url : URLComponents!
    var delegate : MarvelApiResponse!
    
    init(delegate : MarvelApiResponse, url : String) {
        
        self.delegate = delegate
        self.url = URLComponents(string: url)
        self.url?.queryItems = [
            URLQueryItem(name: MarvelApi.PARAM_KEY, value: MarvelApi.PUBLICKEY),
            URLQueryItem(name: MarvelApi.PARAM_TS, value: MarvelApi.TS.timestamp),
            URLQueryItem(name: MarvelApi.PARAM_HASH, value: MarvelApi.HASH.md5),
        ]
    }
    
    func start() {
        // Preparing the request
        var request = URLRequest(url: self.url!.url!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // Prepare and execute the task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                    self.delegate.error(error : "Error 2")
                    return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                self.delegate.error(error : "Error 2")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(CodableApiRequest.self, from: data)
                let hero = response.data.results[0].toModel()
                self.delegate.response(hero: hero)
            } catch let error as NSError {
                self.delegate.error(error : error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
    
}
