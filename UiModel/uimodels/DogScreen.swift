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

//class DogUIModel {
//    var breedTitle: String //this won't work please take a look at the view model
//    let ageDescription: String
//    //let listOfOtherUiModels: [OtherUIModels]
//
//    init(breedTitle: String = "Undefined", ageDescription: String = "1") {
//        self.breedTitle = breedTitle
//        self.ageDescription = ageDescription
//    }
//
//}

struct DogScreen {
    var breedTitle: String //this won't work please take a look at the view model
    var ageDescription: String
    var dogList: [Dog]
    var showList: Bool
}

struct Dog: Identifiable {
    var id: Int
    var name: String
    var age: String
}

extension DogScreen {
        static let initialValue = DogScreen(breedTitle: "Undefined",
                                        ageDescription: "1",
                                        dogList: [],
                                        showList: false)
}
