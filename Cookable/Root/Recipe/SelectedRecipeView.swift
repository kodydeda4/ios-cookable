//
//  RecipeLargeView.swift
//  Cookable
//
//  Created by Kody Deda on 3/30/21.
//

import SwiftUI

struct GradientOverlay: View {
    var body: some View {
        VStack {
            LinearGradient(
                gradient: Gradient(colors: [.black, .clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.darken)
            .opacity(0.8)
            .frame(height: 150)
            Spacer()
        }
    }
}


struct SelectedRecipeView: View {
    let recipe: Recipe
    var toggleFavoriteAction: () -> Void
    var toggleSelectedAction: () -> Void
    
    var favorited: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading) {
                    // img stuff
                }
                .frame(maxWidth: .infinity, minHeight: 500, maxHeight: 500)
                .background(
                    Image(recipe.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .clipShape(Rectangle())
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(recipe.name)
                        .font(.title)
                        .bold()
                        
                        Spacer()
//                        Button(action: toggleSelectedAction) {
//                            Image(systemName: "arrowshape.turn.up.backward")
//                                .resizable()
//                                .scaledToFit()
//                                //.foregroundColor(favorited ? .pink : .primary)
//                                .frame(width: 30, height: 30)
//                        }
                        
                        Button(action: toggleFavoriteAction) {
                            Image(systemName: favorited ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(favorited ? .pink : .primary)
                                .frame(width: 30, height: 30)
                        }
                    }
                    Divider()
                    Text(recipe.description)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .gesture(
          DragGesture()
            .onEnded {
              if $0.translation.width < -100 {
                toggleSelectedAction()
              } else if $0.translation.width > 100 {
                toggleSelectedAction()
              }
          }
        )
    }
}
struct SelectedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecipeView(recipe: Recipe.allRecipes.first!, toggleFavoriteAction: {}, toggleSelectedAction: {}, favorited: false)
        SelectedRecipeView(recipe: Recipe.allRecipes.first!, toggleFavoriteAction: {}, toggleSelectedAction: {}, favorited: true)
    }
}