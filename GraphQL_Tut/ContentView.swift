//
//  ContentView.swift
//  GraphQL_Tut
//
//  Created by Sukumar Anup Sukumaran on 29/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var countryEmoji = ""
    
    var body: some View {
        Text(countryEmoji).onAppear(perform: {
            Network.shared.apollo.fetch(query: SpecificCountryQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        if let emoji = graphQLResult.data?.country?.emoji {
                            countryEmoji = emoji
                        }
                    }
                case .failure(let error):
                    print("Error = \(error.localizedDescription)")
                }
            }
        })
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
