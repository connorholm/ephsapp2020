//
//  Elements.swift
//  ephsapp2020
//
//  Created by 90305863 on 03/12/2020.
//

import SwiftUI

struct Elements: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BigRedText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(height: 60)
            .background(Color.red)
            .cornerRadius(35)
    }
}

struct Elements_Previews: PreviewProvider {
    static var previews: some View {
        Elements()
    }
}
