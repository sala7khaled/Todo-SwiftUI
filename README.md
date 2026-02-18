# Todo App

A SwiftUI Todo app with dynamic lists, an About section, and external links. Designed to demonstrate modern SwiftUI patterns, including List (Swipe / Drag & Drop / Edit), Form, Inputs, sheets, navigation stacks, dynamic tabs, and custom button styles.

<br>
<br>

## Features

- **Todo List**  
  - [x] Dynamic list of tasks using `@StateObject` and `Binding`.  
  - [x] Supports **deleting** (swipe-to-delete), **reordering** (drag & drop), and **editing** tasks using `TextField`.  

- **About Tab**  
  - [x] Large title navigation using `NavigationStack` and `.navigationBarTitleDisplayMode(.large)`.  
  - [x] Centered content with a bottom-aligned action button.  
  - [x] Modern capsule-styled button with right icon.  

- **More Info Sheet**  
  - [x] Opens as a sheet from the About button.  
  - [x] Navigation bar with inline title and top-right dismiss button.  
  - [x] Dynamically loads links (LinkedIn, GitHub, Linktree) from a `@StateObject` view model.  
  - [x] Buttons open external URLs.  
  - [x] Supports modern SwiftUI styling (bordered-prominent buttons, capsule shapes, and tint colors).  

- **Dynamic TabView**  
  - [x] Tabs defined by an `AppTab` enum.  
  - [x] Easy to add new tabs.  
  - [x] Supports icons, titles, and views dynamically.  

- **Responsive UI Tips**  
  - [x] `GeometryReader` used for relative sizing.  
  - [x] `Spacer()` used for centering content and pinning buttons.  
  - [x] Fixed vertical/horizontal spacing via `Spacer().frame()` or VStack/HStack spacing.  
  - [x] SF Symbols or custom asset images for icons.  

<br>
<br>

## Screenshots

| Todo List | Edit | Detail | About | Links |
| --- | --- | --- | --- | --- |
| <img src="/screenshots/1.png" height="400"> | <img src="/screenshots/2.png" height="400"> | <img src="/screenshots/3.png" height="400"> | <img src="/screenshots/4.png" height="400"> | <img src="/screenshots/5.png" height="400"> |

<br>
<br>

## SwiftUI Patterns Used

1. **Binding Extensions**  
`.onChange` and `.onEmpty` to react to changes in a `Binding`.
  
  ```swift
func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
    Binding(
        get: { wrappedValue },
        set: {
            wrappedValue = $0
            handler()
        }
    )
}
```

```swift
func onEmpty<Wrapped>(_ defaultValue: Wrapped) -> Binding<Wrapped> where Value == Wrapped? {
    Binding<Wrapped>(
        get: { wrappedValue ?? defaultValue },
        set: { wrappedValue = $0 }
    )
}
```

<br>
<br>

2. **Dynamic Tabs with Enum**  

```swift
enum AppTab: Hashable, CaseIterable {
    case todoList
    case about

    var icon: String { ... }
    var title: String { ... }
    @ViewBuilder var view: some View { ... }
}
```

