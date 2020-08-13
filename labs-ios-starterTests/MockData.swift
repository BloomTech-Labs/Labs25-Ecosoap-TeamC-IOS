//
//  MockData.swift
//  labs-ios-starterTests
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

let propertyJSON: Data = """
 {
   "id": "11",
   "name": "Trannsylvania",
   "rooms": 12,
   "phone": "123-456-7890",
   "billingAddress": "420 Meta Dr.",
   "shippingAddress": "420 Meta Dr.",
   "coordinates": "100,100",
   "shippingNote": "don't shake this bad boy",
   "notes": "Very very fragile packages come from here.",
   "users": [
     {
       "id": "11",
       "firstName": "Test",
       "lastName": "User"
     }
   ]
 }
""".data(using: .utf8)!
