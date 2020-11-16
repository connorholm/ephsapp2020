//
//  MenuView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//

import SwiftUI
import Combine

struct MenuView: View {
    @ObservedObject var menuPage = MenuPage()
    var body: some View {
        switch menuPage.menuPage {
        case "counselor":
            WebViews(url: "https://app.acuityscheduling.com/schedule.php?owner=20439951")
        case "campus":
            WebViews(url: "https://edenprairiemn.infinitecampus.org/campus/portal/eden_prairie.jsp")
        default:
            Menu(menuPage: menuPage)
        }
    }
}
struct Menu: View {
    @ObservedObject var menuPage: MenuPage
    var body: some View {
        VStack {
            Text("Additional Options").font(.title)
            Button(action: {menuPage.menuPage = "counselor"} ) {
                Text("Schedule Couselor Appointment")
            }
            Button(action: {menuPage.menuPage = "campus"}, label: {
                Text("Campus Login")
            })
            Spacer()
        }
    }
}

class MenuPage: ObservableObject {
    let objectWillChange = PassthroughSubject<MenuPage,Never>()
    var menuPage: String = "menu" {
        didSet {
            objectWillChange.send(self)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .padding()
    }
}
