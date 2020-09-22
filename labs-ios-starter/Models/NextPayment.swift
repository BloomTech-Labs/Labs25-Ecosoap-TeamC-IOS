//
//  NextPayment.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 9/22/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class NextPayment {

    public let invoiceCode: String
    public let invoice: URL
    public let amountDue: Int
    public let invoicePeriodStartDate: Date
    public let invoicePeriodEndDate: Date
    public let dueDate: Date

    init?(dictionary: [String: Any]) {
        guard let invoiceCode = dictionary["invoiceCode"] as? String,
        let invoiceString = dictionary["invoice"] as? String,
        let invoice = URL(string: invoiceString),
        let amountDue = dictionary["amountDue"] as? Int,
        let startString = dictionary["invoicePeriodStartDate"] as? String,
        let endString = dictionary["invoicePeriodEndDate"] as? String,
        let dueString = dictionary["dueDate"] as? String else {
            return nil
        }

        guard let invoicePeriodStartDate = Date(shortDate: startString),
        let invoicePeriodEndDate = Date(shortDate: endString),
            let dueDate = Date(shortDate: dueString) else {
                return nil
        }

        self.invoiceCode = invoiceCode
        self.invoice = invoice
        self.amountDue = amountDue
        self.invoicePeriodStartDate = invoicePeriodStartDate
        self.invoicePeriodEndDate = invoicePeriodEndDate
        self.dueDate = dueDate
    }

}
