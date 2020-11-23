//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//

import SwiftUI

struct AnnouncementsView: View {
    var body: some View {
        VStack {
            Text("Announcemts").font(.title)
            Text(InboxRequest())
            Spacer()
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
            .padding()
        
    }
}

