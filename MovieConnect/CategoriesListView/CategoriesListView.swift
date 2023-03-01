// Copyright © 2023 Almost Engineer. All rights reserved.

import SwiftUI

struct CategoryViewData: Identifiable, Hashable {
    let id: UUID
    var title: String
}

class CategoriesListViewModel: ObservableObject {
    @Published var list: [CategoryViewData] = []
    @Published var isLoading: Bool = false
    
    func onLoad() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            self.list = [
                .init(id: .init(), title: "Default"),
                .init(id: .init(), title: "Custom")
            ]
            self.isLoading = false
        })
    }
}

struct CategoriesListView: View {
    enum Action {
        case onSelect(CategoryViewData)
        case onDelete
    }
    
    @StateObject var viewModel: CategoriesListViewModel
    var onAction: (Action) -> Void
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            }
            List {
                ForEach(viewModel.list) { category in
                    Text(category.title)
                        .onTapGesture {
                            onAction(.onSelect(category))
                        }
                }
                Text("Remove from")
                    .onTapGesture {
                        onAction(.onDelete)
                    }
            }
        }
        .onAppear(perform: viewModel.onLoad)
    }
}

//struct CategoriesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesListView(
//            viewModel:
//                CategoriesListViewModel(
//                    selectedMovie: .constant(.init(id: .init(), title: "Title", mode: .noList))
//                )
//        )
//    }
//}
