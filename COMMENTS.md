# Location Finder

## Architecture

### Store Layer

It separates from where the data come from, in this case:
* GoogleNetworkRepository: Means that the data come from a Rest Google API Request
* CoreDataLocalRepository: Menas that the data come from a local storage that uses CoreData

Each Repository has:
* Its own protocol that must be implemented
* A model related
* A mapper that maps object back and forward all architecture layers

### Domain Layer

It is where the business rules of the project are applied. It should be separated in UseCases where each one has its own responsability of performing a specific task, in this case:

* FetchPlacesUseCase: It fetchs places based on a given name from the Google API
* FetchCoreDataPlacesUseCase: It fetch saved places from CoreData
* SavePlaceUseCase: It saves places in CoreData
* DeletePlaceUseCase: It deletes places from CoreData

### Presentation Layer

It is responsible of the application interface and to show all incoming data from domain layer. In this case, an adapted clean-swift approach has been used so, the separation is done by Scenes where each one has:

* ViewController: It must be a inherited class from UIViewController and it is responsible for the final results to the user
* Presenter: It prepares all incoming Domain Data to be shown by the ViewController
* Router: It is responsibles of the navigation and to send data back and forward screens
* Configurator: It does the dependency injection of each scene
* ViewModel: It is a raw Model with attributes that makes easier to the ViewController to show the data
* Mapper: It maps incoming Domain Models to ViewModels

I've chosen the clean architecture because of its code and project organization. I've then used CocoaPods for dependency management. For Network calls I've used RxSwift and the communication between the tree architectural layers is done by a reactive approach via Observables.

### External Libraries

* [Toast-Swift](https://github.com/scalessec/Toast-Swift) - To show Toasts in iOS
* [Moya](https://github.com/Moya/Moya) - API Calls
* [Moya/RxSwift](https://github.com/Moya/Moya/blob/master/docs/RxSwift.md) - Wrapper for Rx API Calls in swift
* [SwinjectStoryboard](https://github.com/Swinject/SwinjectStoryboard) - Dependency Injection via Storyboard
* [R.swift](https://github.com/mac-cain13/R.swift) - Similar to Android native R, assets, strings and constants helper

### Improvements

If I had more time I would:
* Try to improve the mappers to be more generic back and forward
* Try to write more unit tests, UI tests and even integration tests
* Try to improve the MapViewAdapter class
* Try to stress the application to deep tests to see how it behaves
* Try to create a wrapper for CoreData operations
