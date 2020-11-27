//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 10/22/20.
//

import Foundation

struct Inbox: Codable {
    var message:[Message]
    var links:MessageLinks
    var unread_count:String
}

struct Message: Codable {
    var id:Int
    var subject:String
    var recipient_ids:String
    var last_updated:Int
    //var mid:String
    var author_id:Int
    var message_status:String
    //var message:String
    var links:MessageLinks
}

struct MessageLinks:Codable {
    var `self`:String
}
