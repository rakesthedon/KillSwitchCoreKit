//
//  File.swift
//  
//
//  Created by Yannick Jacques on 2022-05-10.
//

import Foundation

public enum KillswitchType: String, Codable {
    case blocking
    case fullscreen
    case modal
    case banner
    
    public static var `default`: KillswitchType { KillSwitchKitConfiguration.shared.defaultKillSwitch ?? .fullscreen }
}

public struct KillswitchPayload {
    
    public let title: String
    public let body: String
    public let url: URL?
    public let thumbnailUrl: URL?
    public let type: KillswitchType
    
    public init(title: String, body: String, url: URL? = nil, thumbnailUrl: URL? = nil, type: KillswitchType = .default) {
        self.title = title
        self.body = body
        self.url = url
        self.thumbnailUrl = thumbnailUrl
        self.type = type
    }
}

extension KillswitchPayload: Codable {

    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case url
        case type
        case thumbnailUrl
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
        self.thumbnailUrl = try container.decodeIfPresent(URL.self, forKey: .thumbnailUrl)
        self.type = try container.decodeIfPresent(KillswitchType.self, forKey: .type) ?? .default
    }
}
