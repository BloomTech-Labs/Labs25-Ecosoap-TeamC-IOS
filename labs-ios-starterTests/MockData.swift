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

let pickupJSON: Data = """
{
  "id": "11",
  "confirmationCode": "This is a placeholder confirmation.",
  "collectionType": "LOCAL",
  "status": "SUBMITTED",
  "readyDate": "2020-20-20",
  "pickupDate": "2020-21-21",
  "property": {
    "id": "11",
    "billingAddress": "420 Meta Dr.",
    "name": "Trannsylvania"
  },
  "notes": "Lord do I hope this works."
}
""".data(using: .utf8)!

let impactStatsJSON: Data = """
{
  "soapRecycled": 1245,
  "linensRecycled": null,
  "bottlesRecycled": null,
  "paperRecycled": null,
  "peopleServed": 200,
  "womenEmployed": 45
}
""".data(using: .utf8)!

let userJSON: Data = """
{
"id": "11",
"firstName": "Test",
"middleName": null,
"lastName": "User",
"title": "Place",
"company": "Procastinadores Inc.",
"email": "placeholder@email.com",
"phone": "098-765-4321",
"skype": "WhoUsesThis",
"address": "123 Avenue",
"signupTime": "12:30 PM",
}
""".data(using: .utf8)!
