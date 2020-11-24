//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 10/22/20.
//

import Foundation

struct Inbox: Codable {
    let message:[Message]
    let links:String
    let unread_count:String
}

struct Message: Codable {
    let id:Int
    let subject:String
    let recipient_ids:String
    let last_updated:Int
    let mid:String
    let author_id:Int
    let message_status:String
    let message:String
    let links:String
}
/*
struct MessageLinks:Decodable {
    //name should be self, need workaround
    let self:String
}
 */
