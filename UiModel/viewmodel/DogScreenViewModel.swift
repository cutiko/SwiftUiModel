//
//  DogScreenViewModel.swift
//  UiModel
//
//  Created by Erick Navarro on 03-03-23.
//

import Foundation

class DogViewModel : ObservableObject {
    @Published var screenState: DogScreen = DogScreen.initialValue

    func changeBreed() {
        screenState.breedTitle = "Terrier"
        updateDogs()
    }
    
    func changeAge() {
        let updatedAge = Int.random(in: 0 ..< 800)
        screenState.ageDescription = String(updatedAge)
        updateDogs()
    }
    
    func functionalChangeBreed() {
        screenState.breedTitle = "Golden Retriever"
        updateDogs()
    }

    private func updateDogs() {
        let aDog = Dog(id: screenState.dogList.count, name: screenState.breedTitle, age: screenState.ageDescription)
        screenState.dogList.append(aDog)
    }
}
