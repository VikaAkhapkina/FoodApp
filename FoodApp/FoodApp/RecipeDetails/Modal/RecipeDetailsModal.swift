//
//  RecipeDetailisModal.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import Foundation

struct RecipeDetailsModal: Codable {
    let id: Int
    let title: String
    let readyInMinutes: Int // время приготовления
    let servings: Int // порции
    let sourceUrl: String // источник URL
    let image: String
    let summary: String // резюме
    let cuisines: [String] // кухня
    let dishTypes: [String] // типы блюд
    let diets: [String]
    

    let vegetarian: Bool
    let glutenFree: Bool
    let veryHealthy: Bool
    let cheap: Bool
    let veryPopular: Bool
    let sustainable: Bool
    let lowFodmap: Bool
    let cookingMinutes: Int // время готовки
    let preparationMinutes: Int
    let aggregateLikes: Int // лайки
    let healthScore: Int
    let sourceName: String
    let pricePerServing: Double //цена
    let extendedIngredients: [Ingredient]?
    let analyzedInstructions: [Instraction]
    
}

struct Ingredient: Codable {
    let id: Int
    let image: String?
    let name: String
    let original: String
    let amount: Double
    let unit: String
    
}

struct Instraction: Codable {
    let steps: [InstractionStep]
    
}

struct InstractionStep: Codable {
    let number: Int
    let step: String
}
