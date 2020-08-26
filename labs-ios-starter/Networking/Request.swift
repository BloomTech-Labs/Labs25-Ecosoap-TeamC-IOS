//
//  Request.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/26/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

protocol Request {
    var body: String { get }
    var payloadString: String { get }
    var name: String { get }
}
