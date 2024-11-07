# Learning IOS

This is my code, notes and blogs for learning IOS development. The tutorial is the official [tutorial](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger).

## 2024/11/07

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

## 2024/11/02

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
