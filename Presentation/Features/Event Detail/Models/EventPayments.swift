//
//  EventPayments.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct Payer: Identifiable {

    let id = UUID()
    let initials: String
    let name: String
    let color: Color
    let isPaid: Bool
}

struct EventPayments {

    let amountPerPlayer: Int
    let currencySymbol: String
    let collected: Int
    let total: Int
    let payers: [Payer]

    var paidCount: Int { payers.filter(\.isPaid).count }
    var totalCount: Int { payers.count }
    var unpaidCount: Int { totalCount - paidCount }

    var progress: Double {
        totalCount > 0 ? Double(paidCount) / Double(totalCount) : 0
    }
}

extension EventPayments {

    static let sample = EventPayments(
        amountPerPlayer: 5,
        currencySymbol: "₼",
        collected: 20,
        total: 35,
        payers: [
            Payer(initials: "EA", name: "Emin Aliyev", color: AppColors.Brand.primary, isPaid: true),
            Payer(initials: "TQ", name: "Tural Quliyev", color: .orange, isPaid: true),
            Payer(initials: "NM", name: "Nihad Məmmədov", color: AppColors.Semantic.going, isPaid: true),
            Payer(initials: "AH", name: "Ayan Həsənli", color: .blue, isPaid: true),
            Payer(initials: "RH", name: "Rəşad Hüseynli", color: .pink, isPaid: false),
            Payer(initials: "KA", name: "Kamran Abbas", color: Color(red: 0.61, green: 0.48, blue: 0.94), isPaid: false),
            Payer(initials: "OM", name: "Orxan Musa", color: Color(red: 0.48, green: 0.77, blue: 0.63), isPaid: false)
        ]
    )
}
