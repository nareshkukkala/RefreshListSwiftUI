//
//  ContentView.swift
//  RefreshListSwiftUI
//
//  Created by naresh kukkala on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var refreshDates: [Date] = []
    
    var body: some View {
        
        NavigationView {
          
            List(refreshDates, id: \.self) { date in
                Text("\(date)")
            }.listStyle(.plain)
                .refreshable {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        let currentDate = Date()
                        refreshDates.append(currentDate)
                    }
                }
 
            
            .navigationTitle("Pull to Refresh")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
