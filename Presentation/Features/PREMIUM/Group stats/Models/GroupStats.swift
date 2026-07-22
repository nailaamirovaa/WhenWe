//
//  GroupStats.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct AttendanceEntry: Identifiable {

    let id = UUID()
    let initials: String
    let name: String
    let color: Color
    let attended: Int
    let total: Int

    var progress: Double {
        total > 0 ? Double(attended) / Double(total) : 0
    }

    var fractionLabel: String {
        "\(attended)/\(total)"
    }
}

struct GroupStats {

    let title: String
    let headline: String
    let subheadline: String
    let attendance: [AttendanceEntry]
    let mostReliable: String
    let mostFlaky: String
}

extension GroupStats {

    static let sample = GroupStats(
        title: "July stats",
        headline: "4 games in July ⚡",
        subheadline: "32 RSVPs · 89% show-up rate",
        attendance: [
            AttendanceEntry(
                initials: "AY",
                name: "Aysel",
                color: Color(red: 0xE8 / 255, green: 0x5D / 255, blue: 0x9E / 255),
                attended: 11,
                total: 12
            ),
            AttendanceEntry(
                initials: "EA",
                name: "Emin",
                color: AppColors.Brand.primary,
                attended: 10,
                total: 12
            ),
            AttendanceEntry(
                initials: "NM",
                name: "Nihad",
                color: AppColors.Semantic.going,
                attended: 8,
                total: 12
            ),
            AttendanceEntry(
                initials: "TQ",
                name: "Tural",
                color: .orange,
                attended: 4,
                total: 12
            )
        ],
        mostReliable: "Aysel",
        mostFlaky: "Tural"
    )
}
