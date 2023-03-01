// Copyright © 2023 Almost Engineer. All rights reserved.

import SwiftUI

final class MovieListViewModel: ObservableObject  {
    @Published var moviesList: [MovieViewData] = [
        .init(id: .init(), title: "Title 1", mode: .noList),
        .init(id: .init(), title: "Title 2", mode: .noList),
        .init(id: .init(), title: "Title 3", mode: .noList)
    ]
    @Published var showingCategoriesList = false
    @Published var selectedItem: MovieViewData?
    
    private func select(movie: MovieViewData, category: CategoryViewData) {
        guard let index = self.moviesList.firstIndex(where: { $0.id == movie.id }) else { return }
        
        self.moviesList[index].mode = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            self.moviesList[index].mode = .inList(category.title)
        })
    }
    
    private func deleteFromList(movie: MovieViewData) {
        guard let index = self.moviesList.firstIndex(where: { $0.id == movie.id }) else { return }
        self.moviesList[index].mode = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            self.moviesList[index].mode = .noList
        })
    }
    
    func onActionChange(_ action: CategoriesListView.Action) {
        switch action {
        case .onSelect(let selectedCategory):
            select(movie: selectedItem!, category: selectedCategory)
            showingCategoriesList = false
            
        case .onDelete:
            deleteFromList(movie: selectedItem!)
            showingCategoriesList = false
        }
    }
    
    func onActionTap(item: MovieViewData) {
        selectedItem = item
        showingCategoriesList = true
    }
}

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach($viewModel.moviesList) { item in
                    MovieItemView(
                        movieData: item,
                        onPrimaryAction: {
                            viewModel.onActionTap(item: item.wrappedValue)
                        })
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }.sheet(isPresented: $viewModel.showingCategoriesList) {
            NavigationStack {
                CategoriesListView(
                    viewModel: .init(),
                    onAction: { action in
                        viewModel.onActionChange(action)
                    }
                ).navigationTitle("Select list")
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: .init())
    }
}
