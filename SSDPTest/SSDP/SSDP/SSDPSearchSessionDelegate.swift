//
//  SSDPSearchSessionDelegate.swift
//  SSDPTest
//
//  Created by Michael Kuhardt on 20.10.20.
//

import Foundation


enum SSDPSearchSessionError: Error {
    case searchAborted(Error)
}


protocol SSDPSearchSessionDelegate: class {
    func searchSession(_ searchSession: SSDPSearchSession, didFindService service: SSDPService)
    func searchSession(_ searchSession: SSDPSearchSession, didEncounterError error: SSDPSearchSessionError)
    func searchSessionDidStopSearch(_ searchSession: SSDPSearchSession, foundServices: [SSDPService])
}
