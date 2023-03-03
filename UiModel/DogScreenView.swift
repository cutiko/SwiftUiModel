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
    
    var dogUiModel: DogUIModel
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogScreenView()
    }
}
