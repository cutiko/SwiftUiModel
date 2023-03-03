//
//  DogScreenViewModel.swift
//  UiModel
//
//  Created by Erick Navarro on 03-03-23.
//

import Foundation

class DogViewModel : ObservableObject {
    
    @Published var screenState: DogUIModel = DogUIModel.initialValue
    //@Published var screenState: [DogUIModel] = DogUIModel.initialValue
    
    func changeBreed() {
        //You can't do this, it won't change the screen
        //screenState.breedTitle = "Terrier"
        
        //but this does work
        screenState.breedTitle = "Terrier"
        screenState = DogUIModel(
            breedTitle: screenState.breedTitle,
            ageDescription: screenState.ageDescription
        )
        //but we don't want to do this, because this makes the logic of the UI Model to be in the View Model
        //instead is better to move that logic to the UI Model
    }
    
    func changeAge() {
        //You have to copy every time so it will change the screen
        //screenState = DogUIModel(age: "8") this was the initial approach
        let updatedAge = Int.random(in: 0 ..< 800)
        screenState = screenState.updateAge(age: updatedAge)
    }
    
    func functionalChangeBreed() {
        screenState = screenState.updateBreed(breed: "Golden Retriever")
    }
    
}
