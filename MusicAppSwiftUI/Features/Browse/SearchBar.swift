//
//  SearchBar.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    @Binding var searchText: String
    
    var placeHolder: String = "Search in store"
    
    func makeUIView(context: Context) -> UISearchBar {
        let uiSearchBar = UISearchBar()
        uiSearchBar.delegate = context.coordinator
        uiSearchBar.searchBarStyle = .minimal
        uiSearchBar.placeholder = self.placeHolder
        return uiSearchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = self.searchText
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(self)
        return coordinator
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBar?
        
        init(_ parent: SearchBar) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent?.searchText = searchText
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
