//
//  GradesView.swift
//  ephsapp2020
//
//  Created by 90305863 on 08/12/2020.
//

import SwiftUI

struct GradesView: View {
    var cid: [String : String]
    var grades: [GradesSection]
    
    var body: some View {
        List {
            ForEach(0..<grades.count) { i in
                HStack {
                    Text(cid[grades[i].section_id ?? "0"] ?? grades[i].section_id ?? "ERROR finding name")
                    Spacer()
                    Text("\(Int(grades[i].final_grade[0].grade))%")
                }
            }
        }
    }
}

struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView(cid: [String : String](), grades: [GradesSection]())
    }
}
