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

let oauthswift = OAuth1Swift(
    consumerKey:    defaults.string(forKey: keys.consumer_key)!,
    consumerSecret: defaults.string(forKey: keys.consumer_secret)!
)
let links = Links(self: "0")

class API {
    var inbox: Inbox = Inbox(message: [Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0, author_id: 0, message_status: "0", links: Links(self: "0"))], links: links, unread_count: "0")
    var classes: Classes = Classes(section: [ClassesSection(id: "0", course_title: "0", active: 0, profile_url: "0")], links: links)
    var grades = [GradesSection]()
    var uid: Int = 0
    var sectionIDs = [Int]()
    
    func getInbox() {
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
                
                self.inbox = result
                self.uid = getUserID(messages: result.message)
                self.refresh()
                
            case .failure(let error):
                printf("ERROR: \(error)")
            }
        }
    }
    
    func getClasses(userID: Int) {
        print("Getting classes...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/users/\(userID)/sections") { result in
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
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
    }
    
    //Gets grades for a spesific course
    func getGrades(userID: Int, sectionID: Int) {
        print("Getting Grades...")
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/users/\(userID)/grades?section_id=\(sectionID)") { result in
            switch result {
            case .success(let response):
                var result: GradesSection
                do {
                    result = try JSONDecoder().decode(GradesSection.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                self.grades.append(result)
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
        getClasses(userID: uid)
        
        for section in classes.section {
            sectionIDs.append(Int(section.id) ?? -1)
        }
        
        for sectionID in sectionIDs {
            getGrades(userID: uid, sectionID: sectionID)
        }
        
        if defaults.string(forKey: keys.user_id) == nil {
            defaults.set(getUserID(messages: inbox.message), forKey: keys.user_id)
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
