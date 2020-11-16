//
//  Assignments.swift
//  EPHS App
//
//  Created by 90307094 on 10/26/20.
//

import SwiftUI

struct AssignmentsView: View {
    
    @State private var isExpanded = false
    @State private var selectedNum = 1
   
    @State private var isExpanded2 = false
    @State private var selectedNum2 = 1
    
    @State private var isExpanded3 = false
    @State private var selectedNum3 = 1
    
    @State private var isExpanded4 = false
    @State private var selectedNum4 = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Assignments")
                .font(.largeTitle)
           
            DisclosureGroup("Chinese", isExpanded: $isExpanded){
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
                }.frame(height : 150)
                
            }.accentColor(.black)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(Color.red)
            .cornerRadius(8)
            
            
            DisclosureGroup("IOS", isExpanded: $isExpanded2){
                ScrollView{
                VStack{
                    ForEach(1...20, id: \.self){ num in
                    Text("\(num)")
                        .frame( maxWidth: .infinity)
                        .font(.title3)
                        .onTapGesture{
                            self.selectedNum2 = num
                            withAnimation{
                            self.isExpanded2.toggle()
                            }
                        }
                        .padding(.all)
                    
                    }
                }
                }.frame(height : 150)
                
            }.accentColor(.black)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(Color.red)
            .cornerRadius(8)
            
            DisclosureGroup("AP Economics", isExpanded: $isExpanded3){
                ScrollView{
                VStack{
                    ForEach(1...20, id: \.self){ num in
                    Text("\(num)")
                        .frame( maxWidth: .infinity)
                        .font(.title3)
                        .onTapGesture{
                            self.selectedNum3 = num
                            withAnimation{
                            self.isExpanded3.toggle()
                            }
                        }
                        .padding(.all)
                    
                    }
                }
                }.frame(height : 150)
                
            }.accentColor(.black)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(Color.red)
            .cornerRadius(8)
    
            DisclosureGroup("Calc 2", isExpanded: $isExpanded4){
                ScrollView{
                VStack{
                    ForEach(1...20, id: \.self){ num in
                    Text("\(num)")
                        .frame( maxWidth: .infinity)
                        .font(.title3)
                        .onTapGesture{
                            self.selectedNum4 = num
                            withAnimation{
                            self.isExpanded4.toggle()
                            }
                        }
                        .padding(.all)
                    
                    }
                }
                }.frame(height : 150)
                
            }.accentColor(.black)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(Color.red)
            .cornerRadius(8)
            
            Spacer()
        }.padding(.all)
    }
}

struct AssignmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentsView()
    }
}
