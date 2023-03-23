//
//  ContentView.swift
//  Swift-Practice
//
//  Created by App Tycoons on 20/03/2023.
//

import SwiftUI
extension Image {
    func imageModefier () -> some View{
        self
        .resizable()
        .scaledToFit()
        .padding(40)
    }
    func placeholderModefier () -> some View {
        self
        .imageModefier()
        .foregroundColor(.accentColor)
        .frame(maxHeight: 240)
    }
}
struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        //        VStack {
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundColor(.accentColor)
        //            Text("Hello Aqib")
        //        }
        //
        
        // MARK : 1. METHOD ONE WITHOUT EXTENSION
        //        AsyncImage(url: URL(string: imageURL) ){ image in
        //            image
        //                .scaledToFit()
        //
        //        } placeholder: {
        //            Image(systemName: "photo.cirle")
        //                .scaledToFit()
        //
        //        }
        
        // MARK : 2. METHOD 2 WITH EXTENSION
        //        AsyncImage(url: URL(string: imageURL)) { image in
        //            image
        //                .imageModefier()
        //                .padding(20)
        //        } placeholder: {
        //            Image(systemName: "photo.circle.fill")
        //                .placeholderModefier()
        //
        //        }
        
        // MARK : 3. METHOD 3 WITH IF ELSE CONDITIONING
        
        //        AsyncImage(url: URL(string: imageURL)) { phase in
        //            if let image = phase.image{
        //                image.imageModefier()
        //            }
        //            else if phase.error != nil {
        //                Image(systemName: "ant.circle.fill")
        //                    .placeholderModefier()
        //            }
        //            else {
        //                Image(systemName: "photo.circle.fill")
        //                    .placeholderModefier()
        //
        //            }
        //        }
        
        
        // MARK : 4. METHOD 4 WITH SWITCH CASE
        //        AsyncImage(url: URL(string: imageURL) , transaction: Transaction(animation:
        //                .spring(  response: 0.5, dampingFraction: 0.5 , blendDuration: 0.6 ))){ phase in
        //            switch phase {
        //            case .success( let image) :
        //                    image.imageModefier()
        //                    .transition(.move(edge: .bottom))
        //            case .failure(_): Image(systemName: "ant.circle.fill").placeholderModefier()
        //            case .empty: Image(systemName: "photo.circle.fill").placeholderModefier()
        //            @unknown default:
        //                ProgressView()
        //            }
        //        }
        
        AsyncImage(url: URL(string: imageURL) , transaction: Transaction(animation:
                .spring( response: 0.5 , dampingFraction: 0.6 , blendDuration: 0.2 ))){ phase in
                    switch phase {
                    case .success(let image):
                        image.imageModefier()
                            //.transition(.move(edge: .bottom))
//                            .transition(.slide)
                            .transition(.scale)
                    case .failure(_): Image(systemName: "ant.circle.fill").placeholderModefier()
                    case .empty: Image(systemName: "photo.circle.fill").placeholderModefier()
                    @unknown default:
                        ProgressView()
                    }
                    
                }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
