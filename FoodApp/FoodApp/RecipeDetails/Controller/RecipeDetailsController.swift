//
//  RecipeDetailsController.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import Foundation


class RecipeDetailsController {
    
    let id: Int
    let apiService = APIService()
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchRecipeInfo(completion: @escaping(Result<RecipeDetailsModal, Error>) -> Void) {
        apiService.fetchRecipe(id: id, comletion: completion)
    }
}
