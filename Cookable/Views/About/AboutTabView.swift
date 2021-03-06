//
//  AboutView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct AboutTabView: View {
  let store: Store<Root.State, Root.Action>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        Form {
          Section(header: Text("UNCW Fall 2021")) {
            Text("CSC 450 - Software Engineering")
            Text("Dr Ralph Bradley")
          }
          Section(header: Text("Team Members")) {
            ForEach([
              "Kody Deda",
              "Zane Bernard",
              "Zachary Mitzke",
              "Robin Wood",
              "Paolo Imperio"
            ], id: \.self) {
              Text($0)
            }
          }
        }
        .navigationBarTitle("About")
        .toolbar {
          ToolbarItem {
            Button("Reset") {
              viewStore.send(.resetButtonTapped)
            }
          }
        }
      }
    }
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutTabView(store: Root.defaultStore)
  }
}
