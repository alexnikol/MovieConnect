// Copyright © 2023 Almost Engineer. All rights reserved.

import SwiftUI

struct StatusView: View {
    @Binding var mode: MovieViewData.Mode
    let onStatus: () -> Void
    
    var body: some View {
        HStack {
            switch mode {
            case .noList:
                Button(action: onStatus, label: {
                    ZStack {
                        Color.accentColor
                        Text("➕ Add to list ")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                })
                
            case let .inList(listName):
                Button(action: onStatus, label: {
                    ZStack {
                        Color(uiColor: .secondaryLabel)
                        Text("✅ In \"\(listName)\" list")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                })
            case .loading:
                ZStack {
                    Color.accentColor
                    ProgressView()
                }
            }
        }
        .buttonStyle(.plain)
        .cornerRadius(8.0)
        .lineLimit(1)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 16) {
            StatusView(mode: .constant(.noList), onStatus: {
                
            })
            
            StatusView(mode: .constant(.inList("Some default list")), onStatus: {
                
            })
            
            StatusView(mode: .constant(.loading), onStatus: {
                
            })
            
            Spacer()
            
        }.previewLayout(.sizeThatFits)
    }
}
