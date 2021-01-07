//
//  Assignments.swift
//  EPHS App
//
//  Created by 90307094 on 10/26/20.
//


import SwiftUI

struct AssignmentsView: View {
    var api : API
    var cidAssignments: [CIDAssignments]
    @State var addItem: Bool = false
    @State var userItem = ""
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    let timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Text("Completed Schoology Assignments")
                                .font(.largeTitle)
                Button(action: {
                    addItem = true
                }) {
                    Text("+")
                        .foregroundColor(.black)
                        .bold()
                        .padding(10)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.red, lineWidth: 5)
                                )
                }
            }
            if addItem == true{
                //usersItemMenu()
                Text("Add Assignment")
                TextField("Type Assignment", text: $userItem)
                VStack {
                         Picker(selection: $selectedColor, label: Text("Please choose a color")) {
                            ForEach(0 ..< colors.count) {
                               Text(self.colors[$0])
                            }
                         }
                         Text("You selected: \(colors[selectedColor])")
                      }
                Button(action: {
                    print(userItem)
                   addItem = false
                }) {
                    Text("Add Item")
                }
            }
            
            List{
                ForEach(0..<cidAssignments.count) { i in
                    EachClass(className: cidAssignments[i].course_title, assignments: cidAssignments[i].assingments)
                }
            }
        }
        .padding(.all)
        progressView().onReceive(timer, perform: { _ in
            print("updated timer")
            api.refresh()
        })
        

    }
}
struct usersItemMenu: View {
    var body: some View{
        Text("Add Assignment")
        Button(action: {
           
        }) {
            Text("Add Item")
        }
    }
}
struct AssignmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentsView(api: API(), cidAssignments: [CIDAssignments]())
    }
}

struct EachClass: View {
    var className: String
    var assignments: [ClassAssignment]
    
    @State private var isExpanded = false
    @State private var selectedNum = 1
    
    var body: some View {
        
        DisclosureGroup("\(className):  \(assignments.count)", isExpanded: $isExpanded){
            VStack{
                ForEach(0..<assignments.count, id: \.self){ i in
                    HStack {
                        Text(assignments[i].title)
                        Spacer()
                        Text("Due \(formatDate(from: assignments[i].due))")
                    }.frame( maxWidth: .infinity)
                    .font(.title3)
                    .padding(.all)
                    /*
                    .onTapGesture{
                        self.selectedNum = num
                        withAnimation{
                            self.isExpanded.toggle()
                        }
                    }
                 */
                }
            }
        }
        .accentColor(.black)
        .font(.title2)
        .foregroundColor(.black)
        .padding(.all)
        .background(Color.red)
        .cornerRadius(8)
    }
}

let df = DateFormatter()
func formatDate(from: String) -> String {
    if from == "" {
        return "never"
    }
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let updated = df.date(from: from)!
    
    df.dateFormat = "h:mm M/d/yy"
    return df.string(from: updated)
}
