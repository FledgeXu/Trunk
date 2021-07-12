//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

public enum OAuthScopes: String, Codable {
    case follow
    case push
    case read
    case write
    case readAccounts = "read:accounts"
    case writeAccounts = "write:accounts"
    case readBlocks = "read:blocks"
    case writeBlocks = "write:blocks"
    case readBookmarks = "read:bookmarks"
    case writeBookmarks = "write:bookmarks"
    case writeConversations = "write:conversations"
    case readFavourites = "read:favourites"
    case writeFavourites = "write:favourites"
    case readFilters = "read:filters"
    case writeFilters = "write:filters"
    case readFollows = "read:follows"
    case writeFollows = "write:follows"
    case readLists = "read:lists"
    case writeLists = "write:lists"
    case writeMedia = "write:media"
    case readMutes = "read:mutes"
    case writeMutes = "write:mutes"
    case readNotifications = "read:notifications"
    case writeNotifications = "write:notifications"
    case writeReports = "write:reports"
    case readSearch = "read:search"
    case readStatuses = "read:statuses"
    case writeStatuses = "write:statuses"
    case adminRead = "admin:read"
    case adminWrite = "admin:write"
    case adminReadAccounts = "admin:read:accounts"
    case adminWriteAccounts = "admin:write:accounts"
    case adminReadReports = "admin:read:reports"
    case adminWriteReports = "admin:write:reports"
}
