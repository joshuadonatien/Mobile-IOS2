//
//  Task.swift
//  TaskTracker
//
//  Created by Joshua  Donatien on 1/29/26.
//
import Foundation
import SwiftUI
import CoreLocation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var isCompleted: Bool = false
    var photoData: Data? = nil
    var location: CLLocationCoordinate2D? = nil
}

// Hard-coded sample tasks
extension Task {
    static var sampleTasks: [Task] = [
        Task(title: "Morning Workout", description: "Complete a 30-minute exercise routine"),
        Task(title: "Grocery Shopping", description: "Buy vegetables, fruits, and milk"),
        Task(title: "Read a Book", description: "Read at least 20 pages of your current book"),
        Task(title: "Clean Kitchen", description: "Wash dishes and wipe counters"),
        Task(title: "Water Plants", description: "Water all indoor plants")
    ]
}

