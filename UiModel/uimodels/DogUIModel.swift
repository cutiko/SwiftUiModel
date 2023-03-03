//
//  Dog.swift
//  UiModel
//
//  Created by Erick Navarro on 03-03-23.
//

//class ManyDogUIModel {
//    let isFullScreenLoading: Bool
//    let screenTitle: String
//    let dogs: [DogUIModel]
//    let cats: [CatUIModel]
//    let footer: Footer
//}

class DogUIModel {
    var breedTitle: String //this won't work please take a look at the view model
    let ageDescription: String
    //let listOfOtherUiModels: [OtherUIModels]
    
    init(breedTitle: String = "Undefined", ageDescription: String = "1") {
        self.breedTitle = breedTitle
        self.ageDescription = ageDescription
    }
    
}

extension DogUIModel {
    
    static let initialValue = DogUIModel()
    
    //this is just an example for creating the initial screen state with the server or local date
//    func transmute(serverDog: ServerDog) -> DogUIModel {
//        let ageDescription = "\(serverDog.age)" //this are the transformation between the model and the UI Model
//        return DogUIModel(
//            breedTitle: serverDog.breed,
//            ageDescription: ageDescription
//        )
//    }
//   in the above method you can pass more arguments for concatenating more things
    
    //we need the update extensions because we need to work with inmutables, to update the view always push a new UI Model
    //we have to make a copy
    
    func updateAge(age: Int) -> DogUIModel {
        return DogUIModel(
            breedTitle: self.breedTitle,
            ageDescription: "\(age)"
        )
    }
    
    func updateBreed(breed: String) -> DogUIModel {
        return DogUIModel(
            breedTitle: breed,
            ageDescription: self.ageDescription
        )
    }
    
}
