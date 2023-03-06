//
//  ContentView.swift
//  UiModel
//
//  Created by Erick Navarro on 03-03-23.
//

import SwiftUI

//Things to check (3)
//1. Is this poor for performance
//2. Is there any better way to copy?
//3. How this work with lists?
struct DogScreenView: View {
    
    @StateObject var viewModel: DogViewModel = DogViewModel()
    
    var body: some View {

        VStack {
            DogTopSectionView(
                dogUiModel: viewModel.screenState,
                onClickTitle: {
                    viewModel.changeBreed()
                },
                onClickDescription: {
                    viewModel.changeAge()
                },
                onBreedButtonClicked: {
                    viewModel.functionalChangeBreed()
                }
            )
            DogsListView(dogUiScreen: $viewModel.screenState)
        }
    }
}

//struct DogContentView {
//    var dogUiModel: DogUIModel
//
//    var body : some View {
//        if (dogUiModel.isFullScreenLoading) {
//            LoadingView
//        } else {
//            DogTopSectionView(...)
//        }
//    }
//}

struct DogTopSectionView : View {
    
    var dogUiModel: DogScreen
    let onClickTitle: () -> Void
    let onClickDescription: () -> Void
    let onBreedButtonClicked: () -> Void
    
    var body: some View {
        VStack {
            BreedTitleView(breedTitle: dogUiModel.breedTitle) {
                onClickTitle()
            }
            AgeDescriptionView(ageDescription: dogUiModel.ageDescription) {
                onClickDescription()
            }
            BreedButton {
                onBreedButtonClicked()
            }
        }
    }
}

struct BreedTitleView : View {
    
    var breedTitle: String
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(breedTitle)
        }
    }
}

struct AgeDescriptionView : View {
    var ageDescription: String
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(ageDescription)
        }
    }
}

struct BreedButton : View {
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text("Click to change Breed")
        }
    }
}

struct DogsListView : View {
    @Binding var dogUiScreen: DogScreen

    var body: some View {
        VStack {
            Toggle(isOn: $dogUiScreen.showList) {
                Text("Show List")
            }
            if dogUiScreen.showList {
                List(dogUiScreen.dogList) { dog in
                    DogRowView(title: dog.name, age: dog.age)
                }
            } else {
                Text("Empty State")
            }
        }
    }
}

struct DogRowView: View {
    var title: String
    var age: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(age)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogScreenView()
    }
}
