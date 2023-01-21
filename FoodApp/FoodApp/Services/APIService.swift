//
//  APIService.swift
//  FoodApp
//
//  Created by Viktoriya on 11.01.23.
//

import Foundation
import Alamofire

class APIService {
    
    let host = "https://api.spoonacular.com/"
    let apiKey = "175eeca688034a9db271f20e8b532132"
    
    
    //comletion: @escaping () -> Void замыкание которое выполняется синхронно
    //validate откидывает лишние
    func fethResipes(offset: Int = 0, comletion: @escaping (Result<RecipesSearchResult, Error>) -> Void) {
        let url = host + String(format: URLPathes.getResipes, apiKey, offset, 30)
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let recipes = try JSONDecoder().decode(RecipesSearchResult.self, from: data)
                        comletion(.success(recipes))
                    } catch {
                        comletion(.failure(error))
                    }
                } else {
                    comletion(.failure(APIError.noData))
                }

            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
    
    func fetchRecipe(id: Int, comletion: @escaping (Result<RecipeDetailsModal, Error>) -> Void) {
        let url = host + String(format: URLPathes.getResipe, id, apiKey)
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let recipes = try JSONDecoder().decode(RecipeDetailsModal.self, from: data)
                        comletion(.success(recipes))
                    } catch {
                        comletion(.failure(error))
                    }
                } else {
                    comletion(.failure(APIError.noData))
                }

            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
}

enum APIError: Error {
    case noData
}

//static let относится к классу
//%@ плейсхолдер типа String
//%d&number=%d плейсхолдер типа Int
struct URLPathes {
    static let getResipes = "recipes/complexSearch?apiKey=%@&offset=%d&number=%d"
    static let getResipe = "recipes/%d/information?apiKey=%@"
}
