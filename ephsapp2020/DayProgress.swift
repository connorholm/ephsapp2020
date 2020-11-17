//
//  DayProgress.swift
//  EPHS App
//
//  Created by 90305163 on 11/3/20.
//

import SwiftUI

struct DayProgress: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("First Hour")
                .padding(.horizontal, 10)
            progressView()
            Text("Second Hour")
                .padding(.horizontal, 10)
            progressView()
            Text("Third Hour")
                .padding(.horizontal, 10)
            progressView()
            Text("Fourth Hour")
                .padding(.horizontal, 10)
            progressView()
        }
       
    }
}

struct DayProgress_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayProgress()
        }
    }
}
