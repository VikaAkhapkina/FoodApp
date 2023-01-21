//
//  RecipeDetailisViewController.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import Foundation
import UIKit


class RecipeDetailisViewController: UIViewController {
    
    var controller: RecipeDetailsController!
    
    var rootView: RecipeDetailisView {
        view as! RecipeDetailisView
    }
    
    override func loadView() {
        super.loadView()
        view = RecipeDetailisView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.fetchRecipeInfo { responce in
            switch responce {
            case .success(let recipe):
                self.rootView.set(model: recipe)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
