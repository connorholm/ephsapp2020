//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 11/12/20.
//

import Foundation
import OAuthSwift
import Combine

class Refresh: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Refresh,Never>()
    
    let oauthswift = OAuth1Swift(
        consumerKey:    "b6801717d71e876773d6faa90eb3b89d05fa427d8",
        consumerSecret: "e0954bdd2da0ad001b2c9dc28d8d299f"
    )
    
    var inbox: Inbox = Inbox(message: [Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0/*, mid: "0"*/, author_id: 0, message_status: "0"/*, message: "0"*/, links: MessageLinks(self: "0"))], links: MessageLinks(self: "0"), unread_count: "0") {
        didSet {
            objectWillChange.send(self)
            print("Inbox refreshed")
        }
    }
    func refresh() -> Void {
        print("Running InboxRequest()...")
        
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
                printf("Retrieved and decoded data, stoed in inbox")
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
        //Code here will run **before** closure
    }
}

let printf:(String) -> () = {
    print("\t\($0)")
}
