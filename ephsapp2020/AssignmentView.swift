//
//  Assignments.swift
//  EPHS App
//
//  Created by 90307094 on 10/26/20.
//


import SwiftUI

struct AssignmentsView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Assignments")
                .font(.largeTitle)
           
            eachClass(className: .constant("Chinese"))
            eachClass(className: .constant("iOS"))
            eachClass(className: .constant("AP Economics"))
            eachClass(className: .constant("AP Calculus BC"))
        }
        .padding(.all)
        progressView()
    }
}

struct AssignmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentsView()
    }
}

struct eachClass: View {
    
    @Binding var className: String
    
    @State private var isExpanded = false
    @State private var selectedNum = 1
    
    var body: some View {
        DisclosureGroup(className, isExpanded: $isExpanded){
            ScrollView{
                VStack{
                    ForEach(1...20, id: \.self){ num in
                        Text("\(num)")
                            .frame( maxWidth: .infinity)
                            .font(.title3)
                            .onTapGesture{
                                self.selectedNum = num
                                withAnimation{
                                    self.isExpanded.toggle()
                                }
                            }
                            .padding(.all)
                    }
                }
            }
            .frame(height : 150)
        }
        .accentColor(.black)
        .font(.title2)
        .foregroundColor(.black)
        .padding(.all)
        .background(Color.red)
        .cornerRadius(8)
    }
}
