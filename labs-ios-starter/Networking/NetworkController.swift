//
//  NetworkController.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class BackendController {
    private let apiURL: URL = URL(string: "https://ecosoap-placeholder.herokuapp.com/graphql")!

    var loggedInUser: User

    var users: [String: User] = [:]
    var properties: [String: Property] = [:]
    var pickups: [String: Pickup] = [:]

    var parsers: [String: (Any?)->()] = [:]

    var propertyParser: (Any?) -> Void = {_ in }
    var propertiesParser: (Any?) -> Void = {_ in }
    var userParser: (Any?) -> Void = {_ in }

    init(user: User) {
        self.loggedInUser = user

        self.propertyParser = {
            guard let propertyContainer = $0 as? [String: Any] else {
                NSLog("Couldn't PROPERTY cast data as dictionary for initialization")
                return
            }

            guard let property = Property(dictionary: propertyContainer) else {
                return
            }
            self.properties[property.id] = property
        }

        self.propertiesParser = {
            guard let propertiesContainer = $0 as? [[String: Any]] else {
                NSLog("Couldn't PROPERTIES cast data as dictionary for initialization")
                return
            }

            for prop in propertiesContainer {
                self.propertyParser(prop)
            }
        }

        self.userParser = {
            guard let userContainer = $0 as? [String: Any] else {
                NSLog("Couldn't USER cast data as dictionary for initialization")
                return
            }

            guard let user = User(dictionary: userContainer) else {
                return
            }
            self.users[user.id] = user
        }


    }

    func queryAPI(query: Queries.Key, id: String, completion: @escaping (Any?, Error?) -> Void) {
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["query":Queries.shared.collection[query.rawValue]!(id)], options: [])
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let dataContainer = dict?["data"]  as? [String: Any]
                let queryContainer = dataContainer?[query.rawValue] as? [String: Any]


                if query == .propertiesByUserId {
                    let payloadContainer = queryContainer?[Queries.shared.payloads[query.rawValue]!] as? [[String: Any]]
                    completion(payloadContainer, nil)
                } else {
                    let payloadContainer = queryContainer?[Queries.shared.payloads[query.rawValue]!] as? [String: Any]
                    completion(payloadContainer, nil)
                }

            } catch let error {
                completion(nil, error)
            }
        }.resume()
        
    }
}
