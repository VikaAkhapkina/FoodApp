//
//  RecipesListController.swift
//  FoodApp
//
//  Created by Artem Khalilyaev on 11.01.23.
//

import Foundation

class RecipesListController {

    private let apiService = APIService()
    
    private var currentOffset = 0
    private var limit: Int?
    private var recipes: [RecipePreviewModel] = []
    private var isLoading = false

    // Тут получаем данные из APIService, обрабатываем их как нам надо, сохраняем оффсет и так далее
    // То есть APIService отвечает лишь за загрузку данных и ни за что другое
    // Все другое делаем тут, в контроллере
    // а на view отображаем
    func fetchRecipes(completion: @escaping ([RecipePreviewModel]) -> Void) {
        guard currentOffset < limit ?? 100 && !isLoading else { return }
        isLoading = true
        apiService.fethResipes(offset: currentOffset) { response in
            self.isLoading = false
            switch response {
            case .success(let data):
                self.currentOffset += data.number
                self.limit = data.totalResults
                self.recipes = data.results
                completion(self.recipes)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}
