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
                    Text(cid[grades[i].section_id ?? "0"] ?? "ERROR Finding section_id class_title")
                    Spacer()
                    Text("\(Int((grades[i].final_grade[0].grade) ?? 0*100))%")
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
