//
//  WebService.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Alamofire

class WebService {
    func getStory(completion: @escaping ([Story]) -> ()) {
        let api = Config.baseURL+"/story"
        AF.request(api, method: .get)
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([Story].self, from: data)
                        completion(data)
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
    }
    
    func getPost(completion: @escaping ([Post]) -> ()) {
        let api = Config.baseURL+"/post"
        AF.request(api, method: .get)
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([Post].self, from: data)
                        completion(data)
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
    }
    
    func getLike(completion: @escaping ([LikeModel]) -> ()) {
        let api = Config.baseURL+"/like"
        AF.request(api, method: .get)
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([LikeModel].self, from: data)
                        completion(data)
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
    }
    
    func getSearch(completion: @escaping ([SearchModel]) -> ()) {
        let api = Config.baseURL+"/search"
        AF.request(api, method: .get)
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([SearchModel].self, from: data)
                        completion(data)
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
    }
    
    func getProfile(completion: @escaping (ProfileModel) -> ()) {
        let api = Config.baseURL+"/profile"
        AF.request(api, method: .get)
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(ProfileModel.self, from: data)
                        completion(data)
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
    }
}
