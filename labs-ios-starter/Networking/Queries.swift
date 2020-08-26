//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries: Request {

    var body: String

    var payloadString: String


//    static let shared = Queries()

    let collection:[String: (String)->String]
    let payloads: [QueryName: ResponseModel] = [QueryName.userById: .user,
                                                QueryName.propertyById: .property,
                                                QueryName.propertiesByUserId: .properties,
                                                QueryName.impactStatsByPropertyId: .impactStats,
                                                QueryName.hubByPropertyId: .hub,
                                                QueryName.pickupsByPropertyId: .pickups,
                                                QueryName.nextPaymentByPropertyId: .payment,
                                                QueryName.paymentsByPropertyId: .payments,
                                                QueryName.monsterFetch: .user]


    init(name: QueryName) {
        
    }
//    private init() {
//        self.body = ""
//        self.payloadString = ""
//        self.collection = [QueryName.userById.rawValue:userById,
//                           QueryName.propertyById.rawValue:propertyById,
//                           QueryName.propertiesByUserId.rawValue:propertiesByUserId,
//                           QueryName.impactStatsByPropertyId.rawValue:impactStatsByPropertyId,
//                           QueryName.hubByPropertyId.rawValue:hubByPropertyId,
//                           QueryName.pickupsByPropertyId.rawValue:pickupsByPropertyId,
//                           QueryName.nextPaymentByPropertyId.rawValue:nextPaymentByPropertyId,
//                           QueryName.paymentsByPropertyId.rawValue:paymentsByPropertyId,
//                           QueryName.monsterFetch.rawValue:monsterFetch]
//    }

//    enum QueryName: String {
//        case userById
//        case propertiesByUserId
//        case propertyById
//        case impactStatsByPropertyId
//        case hubByPropertyId
//        case pickupsByPropertyId
//        case nextPaymentByPropertyId
//        case paymentsByPropertyId
//        case monsterFetch
//    }

    private static func propertiesByUserId(propertyID: String) -> String {
        return """
        {
        propertiesByUserId(input: { userId: "\(propertyID)" }) {
            properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes,
                users {
                    id
                }
                impactStats {
                  soapRecycled
                  linensRecycled
                  bottlesRecycled
                  paperRecycled
                  peopleServed
                  womenEmployed
                }
            }
        }
        }
        """
    }

    private static func userById(userID: String) -> String {
        return """
        {
        userById(input: { userId:  \"\(userID)\" }) {
        user {
        id
        firstName
        middleName
        lastName
        title
        company
        email
        password
        phone
        skype
        signupTime
        properties {
            id
        }
        }
        }
        }
        """
    }

    private static func propertyById(propertyID: String) -> String {
        return """
        {
        propertyById(input: {
        propertyId: "\(propertyID)"
        }) {
        property {
          id,
          name,
          rooms,
          phone,
          billingAddress,
          shippingAddress,
          coordinates,
          shippingNote,
          notes,
          users {
            id
          }
          impactStats {
              soapRecycled
              linensRecycled
              bottlesRecycled
              paperRecycled
              peopleServed
              womenEmployed
            }
        }
        }
        }
        """
    }

    private static func impactStatsByPropertyId(propertyID: String) -> String {
        return """
        query {
        impactStatsByPropertyId(input: {
        propertyId: "\(propertyID)"
        }) {
        impactStats {
        soapRecycled
        linensRecycled
        bottlesRecycled
        paperRecycled
        peopleServed
        womenEmployed
        }
        }
        }
        """
    }

    private static func hubByPropertyId(propertyID: String) -> String {
        """
        query {
          hubByPropertyId(input: {
            propertyId: "\(propertyID)"
          }) {
            hub {
              id
              name
              address {
                address1
                address2
                address3
                city
                state
                postalCode
                country
              }
              email
              phone
              coordinates {
                longitude
                latitude
              }
              properties {
                id
              }
              workflow
              impact {
                soapRecycled
                linensRecycled
                bottlesRecycled
                paperRecycled
                peopleServed
                womenEmployed
              }
            }
          }
        }

        """
    }

    private static func pickupsByPropertyId(propertyID: String) -> String {
        """
        query {
          pickupsByPropertyId(input: {
            propertyId: "\(propertyID)"
          })  {
            pickups {
              id
              confirmationCode
              collectionType
              status
              readyDate
              pickupDate
              property {
                id
              }
              cartons {
                id
                product
                percentFull
              }
              notes
            }
          }
        }

        """
    }

    private static func nextPaymentByPropertyId(propertyID: String) -> String {
        """
        query {
          nextPaymentByPropertyId(input: {
            propertyId: "\(propertyID)"
          }) {
            payment {
              id
              invoiceCode
              invoice
              amountPaid
              amountDue
              date
              invoicePeriodStartDate
              invoicePeriodEndDate
              dueDate
              paymentMethod
              hospitalityContract {
                id
              }
            }
          }
        }
        """
    }

    private static func paymentsByPropertyId(propertyID: String) -> String {
        """
        query {
          paymentsByPropertyId(input: {
            propertyId: "\(propertyID)"
          }) {
          payments {
              id
              invoiceCode
              invoice
              amountPaid
              amountDue
              date
              invoicePeriodStartDate
              invoicePeriodEndDate
              dueDate
              paymentMethod
              hospitalityContract {
                id
              }
            }
            }
        }
        """
    }

    private static func monsterFetch(userID: String) -> String {
        return """
        query {
          userById(input: {
            userId: "\(userID)"
          }) {
            user {
              id
              firstName
              middleName
              lastName
              title
              company
              email
              password
              phone
              skype
              address {
                address1
                address2
                address3
                city
                state
                postalCode
                country
                # formattedAddress
              }
              signupTime
              properties {
                id
                name
                propertyType
                rooms
                services
                collectionType
                logo
                phone
                billingAddress {
                  address1
                  address2
                  address3
                  city
                  state
                  postalCode
                  country
                  # formattedAddress
                }
                shippingAddress {
                  address1
                  address2
                  address3
                  city
                  state
                  postalCode
                  country
                  # formattedAddress
                }
                coordinates {
                    longitude
                    latitude
                }
                shippingNote
                notes
                hub {
                  id
                  name
                  address {
                    address1
                    address2
                    address3
                    city
                    state
                    postalCode
                    country
                    # formattedAddress
                  }
                  email
                  phone
                  coordinates {
                    longitude
                    latitude
                  }
                  properties {
                    id
                  }
                  workflow
                  impact {
                    soapRecycled
                    linensRecycled
                    bottlesRecycled
                    paperRecycled
                    peopleServed
                    womenEmployed
                  }
                }
                impact {
                  soapRecycled
                  linensRecycled
                  bottlesRecycled
                  paperRecycled
                  peopleServed
                  womenEmployed
                }
                users {
                  id
                }
                pickups {
                  id
                  confirmationCode
                  collectionType
                  status
                  readyDate
                  pickupDate
                  property {
                    id
                  }
                  cartons {
                    id
                    product
                    percentFull
                  }
                  notes
                }
                contract {
                  id
                  startDate
                  endDate
                  paymentStartDate
                  paymentEndDate
                  properties {
                    id
                  }
                  paymentFrequency
                  price
                  discount
                  billingMethod
                  automatedBilling
                  payments {
                    id
                    invoice
                    invoice
                    amountPaid
                    amountDue
                    date
                    invoicePeriodStartDate
                    invoicePeriodEndDate
                    dueDate
                    paymentMethod
                    hospitalityContract {
                      id
                    }
                  }
                  amountPaid
                }
              }
            }
          }
        }
        """
    }

}
