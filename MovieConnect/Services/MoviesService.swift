// Copyright © 2023 Almost Engineer. All rights reserved.

import Foundation
import Combine

struct MovieViewData: Identifiable, Hashable {
    
    enum Mode: Hashable, Equatable {
        case noList
        case inList(String)
        case loading
    }
    
    let id: UUID
    var title: String
    var mode: Mode
}

protocol MoviesServiceProtocol {
    func fetchList() -> AnyPublisher<[MovieViewData], Error>
}
