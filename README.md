# Learning IOS

This is my code, notes and blogs for learning IOS development. The tutorial is the official [tutorial](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger).

## Bindings (2024/11/23)

- If the child view can both read and modify the property that you defined as the source of truth, you should define it as @Bindings.

- If the child view has a read-only relationship with the source of truth defined in the parent, you can simply pass the value to the child view.

```swift

import SwiftUI


struct EditView: View {
  // the source of truth
  @State private var scrum: DailyScrum

  // a read-only relationship
  let name: String = "Theme"

  var body: some View {
    ThemePicker(selection: $scrum.theme, name: name)
  }
}

struct ThemePicker: View {
  @Binding var selection: Theme
  let name: String

  var body: some View {
    Picker(name, selection: $selection) {
      ForEach(Theme.allCases) { theme in
        ThemeView(theme: theme)
          .tag(theme)
      }
    }
    .pickerStyle(.navigationLink)
  }
}
```

- For React, parent component should pass both the value and setter to the child component for two-way connection.
- For Vue, parent component should listen to the update event emitted by the child component.

## States (2024/11/17)

- Adding a sheet modifier on _List_ will present the specified view using a modal sheet that partially covers the underlying content. This is useful for short, self-contained tasks.

```swift
List {}
  .sheet(isPresented: $isPresented) {
    TextView("hello World")
  }
```

- _@State_ to define a state in the view:

```swift
struct TextView: View {
  @State private var name = ""
  var body: some View {
     TextField("Your Name", text: $name)
  }
}
```

## Navigation (2024/11/07)

- _NavigationStack_, _NavigationLink_ are for navigation between views.
- $0 referred to index for mapping array: _attendees.map { Attendee(name: $0) }_
- A strut can be extended multiple time, which is similar to Rust:

```swift
struct A {

}

extension A {
  // ...
}

extension A {
 // ...
}
```

- Within a _List view_, use _ForEach view_:

```swift
List {
  ForEach(scrum.attendees) { attendee in
    Label(attendee.name, systemImage: "person")
  }
}
```

- Declare a constant with _let_, while declare a variable with _var_

## Views (2024/11/02)

- Views are the basic building blocks of Swift UI, just like components in React.js.
- A View contains two structures: the first one is for defining the UI, and the second one is for previewing with mock data.
- Props are defined by `let a` and passed by `View(a: 1)`
- Views are sort of like functions when describing the UI:

Using curly brackets for hierarchy:

```swift
View {
  HStack {

  }
}
```

There seems to be two different places for pass props. What's the difference?

```swift
View {
  Text(scrum.title) // Props
    .font(.headline) // Props
    .accessibilityAddTraits(.isHeader)
}
```

- `\(datum)` is for interpolate data:

```swift
Label("\(scrum.attendees.count)", systemImage: "person.3")
```

- `List` view is for list rendering:

```swift
List(data, \.id) { datum in
  View(datum: datum)
}
```

If datum is `Identifiable`, there is no need to specify id parameter.
