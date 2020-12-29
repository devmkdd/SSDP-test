//
//  SSDPService.swift
//  SSDPTest
//
//  Created by Michael Kuhardt on 01.10.20.
//

import Foundation


struct SSDPService {
    let cacheControl: Date
    let location: URL
    let server: String
    let searchTarget: String
    let uniqueServiceName: String
    let otherHeaders: [String: String]
}

extension SSDPService: Equatable {
    
    static func == (lhs: SSDPService, rhs: SSDPService) -> Bool {
        return lhs.location == rhs.location &&
            lhs.server == rhs.server &&
            lhs.searchTarget == rhs.searchTarget &&
            lhs.uniqueServiceName == rhs.uniqueServiceName
    }
    
}

extension SSDPService: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\nSSDPService:\n cacheControl=\(cacheControl),\n location=\(location),\n  server=\(server), searchTarger=\(searchTarget),\n uniqueServiceName=\(uniqueServiceName),\n otherHeaders=\(otherHeaders)\n\n"
    }
    
    
}
