//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 11/12/20.
//

import Foundation
import OAuthSwift

func RequestInbox() -> Inbox {
    
    print("Running InboxRequest()...")
    let oauthswift = OAuth1Swift(
        consumerKey:    "b6801717d71e876773d6faa90eb3b89d05fa427d8",
        consumerSecret: "e0954bdd2da0ad001b2c9dc28d8d299f"
    )
    print("\tSet the keys")
    
    let message = Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0, mid: "0", author_id: 0, message_status: "0", message: "0", links: "0")
    var inbox = Inbox(message: [message], links: "0", unread_count: "0")
    
    //var responceString = ""
    
    // do your HTTP request without authorize
    oauthswift.client.get("https://api.schoology.com/v1/messages/inbox") { result in
        switch result {
        case .success(let response):
            print("\tSuccess!!")
            print(response.dataString()!)
            var result: Inbox?
            do {
                //let convertedString = String(data: response.data, encoding: String.Encoding.utf8)
                //responceString = convertedString!
                result = try JSONDecoder().decode(Inbox.self, from: response.data)
            }
            catch {
                print("\tERROR during JSON conversion: \(error.localizedDescription)")
                return
            }
            inbox = result!
        case .failure( _):
            print("\tERROR")
            return
        }
    }
    return inbox
}
/*
func jsonToString(json: AnyObject) -> String {
    do {
        let data1 =  try JSONSerialization.dataWithJSONObject(json, options: JSONSerialization.WritingOptions.PrettyPrinted) // first of all convert json to the data
        let convertedString = String(data: data1, encoding: NSUTF8StringEncoding) // the data will be converted to the string
        return convertedString

    } catch let myJSONError {
        print(myJSONError)
    }
}
 */
