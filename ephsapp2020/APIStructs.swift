//
//  APIStrucs.swift
//  EPHS App
//
//  Created by 90305863 on 10/22/20.
//

import Foundation

//
// Inbox information
//
struct Inbox: Codable {
    var message:[Message]
    var links:Links
    var unread_count:String
}

struct Message: Codable {
    var id: Int
    var subject: String
    var recipient_ids: String
    var last_updated: Int
    //var mid: nil
    var author_id: Int
    var message_status: String
    //var message: nil
    var links: Links
}

struct Links: Codable {
    var `self`: String
    var next: String?
}


//
// Classes information
//
struct Classes: Codable {
    var section: [ClassesSection]
    var links: Links
}

struct ClassesSection: Codable {
    var id: String
    var course_title: String
    var active: Int
    var profile_url: String
}


//
// Grades information
//
struct Grades: Codable {
    var section: GradesSection
    var links: Links
}

struct GradesSection: Codable {
    var section_id: String?
    //var period: [Period]
    var final_grade: [FinalGrade]?
    //var grading_category: [GradingCategoryPeriod]
}

// Comming soon!
struct Period: Codable {
    var period_id: String
    var period_title: String
    //var assignment: [GradingAssignment]
}

// Comming soon!
struct GradingAssignment: Codable {
    var enrollment_id: Int
    var assignment_id: Int
    var grade: Int?
    var exception: Int
    var max_points: Int?
    var is_final: Int
    var timestamp: Int
    var comment: String?
    //var comment_status: nil
    var override: Int?
    var calculated_grade: Int?
    //var pending: nil
    var type: String
    var location: String
    var scale_id: Int
    var scale_type: Int
    var assignment_type: String
    var web_url: String
    var category_id: Int
}

struct FinalGrade: Codable {
    var period_id: String
    var grade: Double
    //var weight: Int?
    var comment: String
    var scale_id: Int
    //var grading_category: [GradingCategoryFinalGrade]
}

// Comming soon!
struct GradingCategoryFinalGrade: Codable {
    var category_id: Int
    var grade: Int
}

struct GradingCategoryPeriod: Codable {
    var id: Int
    var title: String
}


//
// Assignment info
//
struct CIDAssignments {
    var course_title: String
    var assingments: [ClassAssignment]
}

struct ClassAssignments: Codable {
    var assignment: [ClassAssignment]
    var total: Int
    var links: Links
}

struct ClassAssignment: Codable, Equatable {
    var id: Int
    var title: String
    var description: String
    var due: String
    var max_points: String
    var is_final: String
    var available: Int
    var completed: Int
    var web_url: String
    var last_updated: String
    var completion_status: String
}
