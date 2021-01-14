//
//  FileForTesting.swift
//  Shall-we-eat
//
//  Created by Mariia Zhurina on 14/01/2021.
//

import SwiftUI

struct FileForTesting: View {
    private var columns: [GridItem] = [
        GridItem(.fixed(200), spacing: 16),
        GridItem(.fixed(200), spacing: 16),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 16,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                Section {
                    ForEach(0...2, id: \.self) { index in
                       BookRowView()
                    }
                }
                
            }
        }
    }
}
struct FileForTesting_Previews: PreviewProvider {
    static var previews: some View {
        FileForTesting()
    }
}
