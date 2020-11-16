//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 10/22/20.
//

import Foundation

struct InboxResponce:Decodable {
    var responce:Messages
    var unread_count:String
}

struct Messages:Decodable {
    var messages:[MessageInfo]
}

struct MessageInfo:Decodable {
    var id:Int
    var subject:String
    var recipient_ids:String
    var last_updated:Int
    var mid:String
    var author_id:String
    var message_status:String
    var message:String
    //var links:MessageLinks
}

struct MessageLinks:Decodable {
    //name should be self, need workaround
    var sel:String
    
}
