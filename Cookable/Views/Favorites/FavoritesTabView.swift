//
//  FavoritesView.swift
//  Cookable
//
//  Created by Kody Deda on 3/29/21.
//

import SwiftUI
import ComposableArchitecture

struct FavoritesTabView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                if viewStore.favoritedRecipes.isEmpty {
                    EmptyFavoritesView()
                } else {
                    VStack {
                        ScrollView {
                            ForEach(viewStore.favoritedRecipes) { recipe in
                                Button(action: {}) {
                                    RecipeView(recipe: recipe)
                                }
                            }
                        }
                        .alert(store.scope(state: \.alert), dismiss: .dismissResetAlert)
                        .navigationBarTitle("Favorites")
                        .toolbar {
                            ToolbarItem {
                                Button("Clear All") {
                                    viewStore.send(.clearFavoritesButtonTapped)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesTabView(store: Root.defaultStore)
    }
}
