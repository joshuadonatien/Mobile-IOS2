//
//  TaskDetailView.swift
//  TaskTracker
//
//  Created by Joshua  Donatien on 1/29/26.
//

import SwiftUI
import PhotosUI
import MapKit
import CoreLocation

struct TaskDetailView: View {
    @Binding var task: Task
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var locationManager = LocationManager()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Task Info Section
                VStack(alignment: .leading, spacing: 8) {
                    Text(task.title)
                        .font(.title)
                        .bold()
                    
                    Text(task.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Completion Status
                if task.isCompleted {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Completed!")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Photo Section
                if let photoData = task.photoData,
                   let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .cornerRadius(12)
                } else {
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        HStack {
                            Image(systemName: "camera.fill")
                            Text("Add Photo to Complete Task")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                
                // Map Section
                if let location = task.location {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Completion Location")
                            .font(.headline)
                        
                        Map(initialPosition: .region(MKCoordinateRegion(
                            center: location,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        ))) {
                            Marker("Task Completed Here", coordinate: location)
                                .tint(.green)
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: selectedPhoto) { oldValue, newValue in
            // Use Task from Swift Concurrency with explicit namespace
            _Concurrency.Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    await MainActor.run {
                        task.photoData = data
                        task.isCompleted = true
                        
                        // Get current location
                        if let currentLocation = locationManager.location {
                            task.location = currentLocation.coordinate
                        }
                    }
                }
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
    }
}
