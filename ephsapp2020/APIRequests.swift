//
//  APIRequests.swift
//  ephsapp2020
//
//  Created by 90305863 on 04/12/2020.
//

import Foundation
import OAuthSwift

let defaults = UserDefaults.standard
let keys = Keys()


//           _____ _____   _____        _          _____      _        _                 _
//     /\   |  __ \_   _| |  __ \      | |        |  __ \    | |      (_)               | |
//    /  \  | |__) || |   | |  | | __ _| |_ __ _  | |__) |___| |_ _ __ _  _____   ____ _| |
//   / /\ \ |  ___/ | |   | |  | |/ _` | __/ _` | |  _  // _ \ __| '__| |/ _ \ \ / / _` | |
//  / ____ \| |    _| |_  | |__| | (_| | || (_| | | | \ \  __/ |_| |  | |  __/\ V / (_| | |
// /_/    \_\_|   |_____| |_____/ \__,_|\__\__,_| |_|  \_\___|\__|_|  |_|\___| \_/ \__,_|_|

var uid = 0
var cid = [String : String]()
let date = Date().timeIntervalSince1970

var oauthswift = OAuth1Swift(
    consumerKey:    defaults.string(forKey: keys.consumer_key) ?? "",
    consumerSecret: defaults.string(forKey: keys.consumer_secret) ?? ""
)
let links = Links(self: "0")


class GetInbox: AsyncOperation {
    var inbox = Inbox(message: [Message](), links: links, unread_count: "0")
    
    override func main() {
        self.inbox = Inbox(message: [Message](), links: links, unread_count: "0")
        
        print("Getting Inbox...")
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
                var iuid = defaults.integer(forKey: keys.uid)
                if iuid <= 1 {
                    iuid = getUserID(messages: result.message)
                    defaults.set(iuid, forKey: keys.uid)
                }
                uid = iuid
                self.inbox = result
                self.finish()
                
            case .failure(let error):
                printf("ERROR: \(error)")
                oauthswift = OAuth1Swift(
                    consumerKey:    defaults.string(forKey: keys.consumer_key) ?? "",
                    consumerSecret: defaults.string(forKey: keys.consumer_secret) ?? ""
                )
                self.main()
            }
        }
        //self.finish()
    }
    
    override func cancel() {
        oauthswift.cancel()
        super.cancel()
    }
    
    

}

class GetClasses: AsyncOperation {
    var classes = Classes(section: [ClassesSection](), links: links)

    override func main() {
        self.classes = Classes(section: [ClassesSection](), links: links)
        if uid <= 0 {
            GetInbox().start()
        }
        self.getClasses(uid: uid)
    }
    
    override func cancel() {
        oauthswift.cancel()
        super.cancel()
    }
    
    // Gets all the active classes the user is in
    private func getClasses(uid: Int) {
        print("Getting classes...")
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
                    cid[section.id] = section.course_title
                }
                self.finish()
            case .failure(let error):
                printf("ERROR: \(error)")
                self.finish()
            }
        }
    }
}
/*
class GetAssignments: AsyncOperation {
    var cidAssignments = [CIDAssignments]()
    
    override func main() {
        self.cidAssignments = [CIDAssignments]()
        self.getAssignmnets(class: <#T##ClassesSection#>)
    }
    
    override func cancel() {
        oauthswift.cancel()
        super.cancel()
    }

    // Gets assignments for spesified course
    private func getAssignmnets(class: ClassesSection) {
        print("Getting Assignemts...")
        
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
                
                // Removes assignments older than one month, should probably be rewritten
                for assignment in result.assignment {
                    if (convertDate(from: assignment.due) + 2629800) <= date {
                        let i = result.assignment.firstIndex(of: assignment)
                        result.assignment.remove(at: i ?? -1)
                    }
                }
                self.cidAssignments.append(CIDAssignments(course_title: `class`.course_title, assingments: result.assignment))
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
    }
}

class GetGrades: AsyncOperation {
    //           _____ _____   _____        _
    //     /\   |  __ \_   _| |  __ \      | |
    //    /  \  | |__) || |   | |  | | __ _| |_ __ _
    //   / /\ \ |  ___/ | |   | |  | |/ _` | __/ _` |
    //  / ____ \| |    _| |_  | |__| | (_| | || (_| |
    // /_/    \_\_|   |_____| |_____/ \__,_|\__\__,_|
    var grades = [GradesSection]()
    var firstRun = true
    
    
    // Resets all vars to avoid doubling
    private func clear() {
    }
    
    override func main() {
        self.grades = [GradesSection]()
        self.getGrades(class: <#T##ClassesSection#>)
    }
    
    override func cancel() {
        oauthswift.cancel()
        super.cancel()
    }
    
    //Gets grades for a spesific course
    private func getGrades(class: ClassesSection) {
        print("Getting Grades...")
        
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
                if result.section.count >= 1 {
                    self.grades.append(result.section[0])
                    cid[result.section[0].section_id ?? "0"] = `class`.course_title
                }
            case .failure(let error):
                printf("ERROR: \(error)")
                if defaults.string(forKey: keys.consumer_key) ?? "" != "" {
                    oauthswift = OAuth1Swift(
                        consumerKey:    defaults.string(forKey: keys.consumer_key) ?? "",
                        consumerSecret: defaults.string(forKey: keys.consumer_secret) ?? ""
                    )
                    self.getGrades(class: `class`)
                }
            }
        }
    }
}
*/
// Prints with tab indent to signify parent
let printf:(String) -> () = { print("\t\($0)") }

// Takes all the messages from getInbox and finds the most common uid to use as the user's id
// This is the only way I've figured out to get the user's id
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

// Converts the date to Unix time for easy comparrison
func convertDate(from: String) -> Double {
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let updated = df.date(from: from) ?? NSDate(timeIntervalSince1970: date) as Date
    
    return updated.timeIntervalSince1970
}

//                                      _          __  __
//     /\                              | |        / _|/ _|
//    /  \   ___ _   _ _ __   ___   ___| |_ _   _| |_| |_
//   / /\ \ / __| | | | '_ \ / __| / __| __| | | |  _|  _|
//  / ____ \\__ \ |_| | | | | (__  \__ \ |_| |_| | | | |
// /_/    \_\___/\__, |_| |_|\___| |___/\__|\__,_|_| |_|
//                __/ |
//               |___/
class AsyncOperation: Operation {
    private let lockQueue = DispatchQueue(label: "edu.ephsapp2020.api", attributes: .concurrent)
    
    override var isAsynchronous: Bool {
        return true
    }
    
    private var _isExecuting: Bool = false
    override private(set) var isExecuting: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isExecuting
            }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            lockQueue.sync(flags: [.barrier]) {
                _isExecuting = newValue
            }
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    private var _isFinished: Bool = false
    override private(set) var isFinished: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isFinished
            }
        }
        set {
            willChangeValue(forKey: "isFinished")
            lockQueue.sync(flags: [.barrier]) {
                _isFinished = newValue
            }
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override func start() {
        print("API Async Starting...")
        guard !isCancelled else {
            finish()
            return
        }
        isFinished = false
        isExecuting = true
        main()
    }
    
    override func main() {
        fatalError("Subclass must implement `main` without overriding super.")
    }
    
    func finish() {
        isExecuting = false
        isFinished = true
    }
}
