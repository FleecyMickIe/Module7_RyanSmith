//
//  BuildingData.swift
//  Module7_RyanSmith
//
//  Created by Ryan Smith on 2/16/26.
//

import Foundation

struct BuildingData {
    static var buildings: [Building] = [
        Building(name: "Samford Hall", type: "Landmark", area: "Central Campus",
                 funFact: "Iconic clock tower.", details: "Historic symbol of Auburn."),
        Building(name: "RBD Library", type: "Library", area: "Central Campus",
                 funFact: "Main research library.", details: "Study spaces and resources."),
        Building(name: "Jordan-Hare Stadium", type: "Athletics", area: "West Campus",
                 funFact: "Home of Auburn football.", details: "Major events and games."),
        Building(name: "Auburn Arena", type: "Athletics / Events", area: "West Campus",
                 funFact: "Basketball home court.", details: "Concerts and campus events."),
        Building(name: "Student Center", type: "Student Life", area: "Central Campus",
                 funFact: "Food + meeting spaces.", details: "Popular hangout between classes."),
        Building(name: "Haley Center", type: "Academic", area: "Central Campus",
                 funFact: "Large classroom building.", details: "Classes and student services."),
        Building(name: "Lowder Hall", type: "Business", area: "Business Area",
                 funFact: "Business programs.", details: "Faculty offices and classrooms."),
        Building(name: "Brown-Kopel Engineering", type: "Engineering", area: "Engineering Area",
                 funFact: "Engineering support hub.", details: "Collaboration and advising."),
        Building(name: "Telfair B. Peet Theatre", type: "Arts", area: "Performing Arts",
                 funFact: "Theatre performances.", details: "Student productions and events."),
        Building(name: "Jule Collins Smith Museum", type: "Museum", area: "South Campus",
                 funFact: "Rotating art exhibits.", details: "Exhibitions and education.")
    ]
}
