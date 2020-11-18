//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 11/12/20.
//

import Foundation
import OAuthSwift

func InboxRequest() -> String {
    let oauthswift = OAuth1Swift(
        consumerKey:    "b6801717d71e876773d6faa90eb3b89d05fa427d8",
        consumerSecret: "e0954bdd2da0ad001b2c9dc28d8d299f"
    )
    /*
    let messageInfo = MessageInfo(id: 0, subject: "0", recipient_ids: "0", last_updated: 0, mid: "0", author_id: "0", message_status: "0", message: "0")
    var messages: Messages = Messages(messages: [messageInfo])
     */
    var responceString = ""
    
    // do your HTTP request without authorize
    oauthswift.client.get("https://api.schoology.com/v1/messages/inbox") { result in
        switch result {
        case .success(let response):
            do {
                let convertedString = String(data: response.data, encoding: String.Encoding.utf8)
                /*
                let decoder = JSONDecoder()
                let dataResponce = try decoder.decode(InboxResponce.self, from: response.data)
                messages = dataResponce.responce
                 */
                responceString = convertedString ?? ""
            } catch {
                return
            }
        case .failure(let error):
            return
        }
    }
    return responceString
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
