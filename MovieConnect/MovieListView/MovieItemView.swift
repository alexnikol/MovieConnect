// Copyright © 2023 Almost Engineer. All rights reserved.

import SwiftUI

struct MovieItemView: View {
    @Binding var movieData: MovieViewData
    var onPrimaryAction: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 8.0) {
            Rectangle()
                .frame(width: 150.0, height: 200.0)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading, spacing: 16.0) {
                StatusView(
                    mode: $movieData.mode,
                    onStatus: onPrimaryAction
                )
                .frame(maxWidth: .infinity, maxHeight: 30.0)
                
                MovieMetaDataView(movieData: $movieData)
                
                Text(movieData.title)
            }
        }
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(movieData: .constant(.init(id: .init(), title: "Title 1", mode: .noList)), onPrimaryAction: {})
            .previewLayout(.sizeThatFits)
    }
}
