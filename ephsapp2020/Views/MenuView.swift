//
//  MenuView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//


import SwiftUI
import Combine

//
//List of websites, to add more, add more. Buttons and view routing are automatic
//
var websites = [
    Website(name: "Counselor Appointments", url: "https://app.acuityscheduling.com/schedule.php?owner=20439951"),
    Website(name: "Campus Login", url: "https://edenprairiemn.infinitecampus.org/campus/portal/students/eden_prairie.jsp"),
    Website(name: "Eagle Vision News", url: "https://eaglevisionnews.com/"),
    Website(name: "EPHS Contacts", url: "https://www.edenpr.org/eden-prairie-high-school/contact"),
    Website(name: "EPHS Calender", url: "https://www.edenpr.org/eden-prairie-high-school/student-life/news-information/calendar")
]

struct MenuView: View {
    @ObservedObject var menuPage = MenuPage()
    var body: some View {
        if menuPage.menuPage == -1 {
            Menu(menuPage: menuPage)
        } else {
            WebViews(url: websites[menuPage.menuPage].url)
        }
    }
}

struct Menu: View {
    @ObservedObject var menuPage: MenuPage
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    let timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("Web Links")
                .font(.largeTitle)
                //.padding()
            List {
                ForEach(0..<websites.count) { i in
                    Button(action: {menuPage.menuPage = i} ) {
                        BigRedText(text: websites[i].name)
                    }
                }
            }
        }.frame(alignment: .center)
        if defaults.bool(forKey: keys.isGuestVar){
            progressView().onReceive(timer, perform: { _ in
                print("udated guest timer")
            })
        }
    }
}

struct Website {
    var name: String
    var url: String
}

class MenuPage: ObservableObject {
    let objectWillChange = PassthroughSubject<MenuPage,Never>()
    var menuPage: Int = -1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().padding()
    }
}
