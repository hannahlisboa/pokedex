//
//  NetworkConnectionMonitor.swift
//  pokedex-challenge
//
//  Created by Hannah  on 28/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

import Network

class NetworkConnectionMonitor {
    
    private let pathMonitor: NWPathMonitor
    private(set) var isConnected: Bool = true
    
    init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = { [weak self] (path) in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        pathMonitor.start(queue: DispatchQueue(label: "Monitor"))
    }
}
