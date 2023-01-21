//
//  RecipeDetailsBuilder.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import Foundation


struct RecipeDetailsBuilder {
    
    func build(id: Int) -> RecipeDetailisViewController{
        let controller = RecipeDetailsController(id: id)
        let viewController = RecipeDetailisViewController()
        viewController.controller = controller
        return viewController
    }
}
