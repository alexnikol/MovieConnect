// Copyright © 2023 Almost Engineer. All rights reserved.

import SwiftUI

struct MovieMetaDataView: View {
    @Binding var movieData: MovieViewData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movieData.title)
                .fontWeight(.semibold)
            Text("Drama, Historical")
            Text("Title")
        }
    }
}

struct MovieMetaDataView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieMetaDataView(movieData: .constant(.init(id: .init(), title: "Title 1", mode: .noList)))
            .previewLayout(.sizeThatFits)
    }
}
