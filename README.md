# Project 1 - *TodoNow*

Submitted by: **Joshua Donatien**

**TodoNow** is an app that helps users track and complete daily tasks by attaching photos as proof of completion and automatically recording the location where each task was finished.

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App displays list of hard-coded tasks
- [x] When a task is tapped it navigates the user to a task detail view
- [x] When user adds photo to complete the tasks, it marks the task as complete
- [x] When adding photo of task, the location is added
- [x] User returns to home page (list of tasks) and the status of your task is updated to complete
 
The following **optional** features are implemented:

- [ ] User can launch camera to snap a picture	

The following **additional** features are implemented:

- [x] Visual completion indicator (green checkmark) on both list and detail views
- [x] Interactive map showing exact location where task was completed
- [x] Photo preview after task completion
- [x] Clean, modern UI with rounded corners and color-coded completion status
- [x] Real-time location tracking using Core Location
- [x] Smooth navigation with SwiftUI NavigationStack

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<div style="position: relative; padding-bottom: 56.25%; height: 0;"><iframe src="https://www.loom.com/embed/3b8aac5b32764cf8b5e7cd0a459f98be" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

## Notes

Challenges encountered while building the app:

1. **Task Naming Conflict**: Initially encountered a naming conflict between Swift's built-in `Task` (for concurrency) and our custom `Task` model. Resolved by using `_Concurrency.Task` for async operations.

2. **Location Permissions**: Had to properly configure Info.plist with location usage descriptions to enable location tracking. The app requires "When In Use" authorization.

3. **Photo Library Access**: Implemented PHPicker which required understanding PhotosUI framework and async/await pattern for loading transferable data.

4. **State Management**: Managing task completion state across views using `@Binding` to ensure the list view reflects changes made in the detail view.

5. **MapKit Integration**: Learning to use the new MapKit SwiftUI API with custom markers and coordinate regions for displaying task completion locations.

6. **Simulator Testing**: Location services work differently in the simulator - had to set custom locations through Features → Location menu for testing.

