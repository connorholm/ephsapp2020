//
//  APIRequests.swift
//  ephsapp2020
//
//  Created by 90305863 on 04/12/2020.
//

import Foundation
import OAuthSwift

let printf:(String) -> () = { print("\t\($0)") }
let defaults = UserDefaults.standard
let keys = Keys()
let date = Date().timeIntervalSince1970

let oauthswift = OAuth1Swift(
    consumerKey:    defaults.string(forKey: keys.consumer_key)!,
    consumerSecret: defaults.string(forKey: keys.consumer_secret)!
)
let links = Links(self: "0")

class API {
    var inbox = Inbox(message: [Message](), links: links, unread_count: "0")
    var classes = Classes(section: [ClassesSection](), links: links)
    var cidAssignments = [CIDAssignments]()
    var grades = [GradesSection]()
    var uid = 0
    var cid = [String : String]()
    var firstRun = true
    
    func clear() {
        self.inbox = Inbox(message: [Message](), links: links, unread_count: "0")
        self.classes = Classes(section: [ClassesSection](), links: links)
        self.cidAssignments = [CIDAssignments]()
        self.grades = [GradesSection]()
    }
    
    func getInbox() {
        print("Clearing structs...")
        clear()
        
        print("Getting Inbox...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/messages/inbox") { result in
            switch result {
            case .success(let response):
                var result: Inbox
                do {
                    result = try JSONDecoder().decode(Inbox.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                if self.firstRun {
                    var uid = defaults.integer(forKey: keys.uid)
                    if uid <= 1 {
                        uid = getUserID(messages: result.message)
                        defaults.set(uid, forKey: keys.uid)
                    }
                    self.uid = uid
                    self.firstRun = false
                }
                self.inbox = result
                self.refresh()
                
            case .failure(let error):
                printf("ERROR: \(error)")
            }
        }
    }
    
    func getClasses(uid: Int) {
        print("Getting classes...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/users/\(uid)/sections") { result in
            switch result {
            case .success(let response):
                var result: Classes
                do {
                    result = try JSONDecoder().decode(Classes.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                self.classes = result
                for section in result.section {
                    self.cid[section.id] = section.course_title
                }
                self.afterClass()
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
    }
    
    //Gets assignments for spesified course
    func getAssignmnets(class: ClassesSection) {
        print("Getting Assignemts...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/sections/\(`class`.id)/assignments?limit=80") { result in
            switch result {
            case .success(let response):
                var result: ClassAssignments
                do {
                    result = try JSONDecoder().decode(ClassAssignments.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                for assignment in result.assignment {
                    if (convertDate(from: assignment.due) + 2629800) <= date {
                        let i = result.assignment.firstIndex(of: assignment)
                        result.assignment.remove(at: i ?? -1)
                    }
                }
                /* Removes completed assignments
                for assignment in result.assignment {
                    if assignment.completed == 1 {
                        let i = result.assignment.firstIndex(of: assignment)
                        result.assignment.remove(at: i ?? -1)
                    }
                }
                 */
                self.cidAssignments.append(CIDAssignments(course_title: `class`.course_title, assingments: result.assignment))
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
    }
    
    
    //Gets grades for a spesific course
    func getGrades(class: ClassesSection, uid: Int) {
        print("Getting Grades...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/users/\(uid)/grades?section_id=\(`class`.id)") { result in
            switch result {
            case .success(let response):
                var result: Grades
                do {
                    //print(response.string)
                    result = try JSONDecoder().decode(Grades.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                //print(result)
                if result.section.count >= 1 {
                    self.grades.append(result.section[0])
                    self.cid[result.section[0].section_id ?? "0"] = `class`.course_title
                }
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
    }
    
    private func refresh() {
        if uid <= 0 {
            printf("ERROR: uid = \(uid)")
            return
        }
        print("Getting classes")
        getClasses(uid: uid)
    }
    private func afterClass() {

        print("Getting assignments and grades")
        for `class` in classes.section {
            getAssignmnets(class: `class`)
            getGrades(class: `class`, uid: uid)
        }
    }
}

func getUserID(messages: [Message]) -> Int {
    printf("Finding User ID...")
    
    var userIDs = [Int]()
    for message in messages {
        userIDs.append(Int(message.recipient_ids) ?? -1)
    }
    print(userIDs)
    
    var frequency: [Int:Int] = [:]
    for x in userIDs {
        frequency[x] = (frequency[x] ?? -1) + 1
    }
    let sorted = frequency.sorted { $0.1 > $1.1 }
    print(sorted)
    
    print(sorted[0].key)
    return sorted[0].key
}

//let df = DateFormatter()
func convertDate(from: String) -> Double {
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let updated = df.date(from: from) ?? NSDate(timeIntervalSince1970: date) as Date
    
    return updated.timeIntervalSince1970
}
