# SafeSubscripts

This package provides safe subscript access for Swift collections, preventing index-out-of-bounds crashes.

Sick and tired of your code crashing when an invalid index is selected? Isn't Swift _supposed_ to be all about safety?

Well, here's where this tool comes in.

## Features

### Universal Collection Support
Works with **any** Swift `Collection` type - not just arrays:

```swift
let array = [1, 2, 3]
let string = "Hello"
let dictionary = ["a": 1, "b": 2, "c": 3]

// All of these work safely
let value = array[safe: 3]        // nil instead of crash
let char = string[safe: string.startIndex] // Safe string indexing
```

### Range Support
Access safe ranges from collections:

```swift
let numbers = [1, 2, 3, 4, 5]

// Safe range access
let slice1 = numbers[safe: 1..<10]  // nil (range extends beyond bounds)
let slice2 = numbers[safe: 1...3]   // [2, 3, 4]
```

### Mutable Collection Support
Safely set values in mutable collections:

```swift
var array = [1, 2, 3]
array[safe: 5] = 10  // No crash, no change (index out of bounds)
array[safe: 1] = 20  // Works! array becomes [1, 20, 3]
```

### Index-Agnostic Design
Uses proper `Collection.Index` types instead of assuming integer indices:

```swift
let text = "Swift"
let midIndex = text.index(text.startIndex, offsetBy: 2)
let char = text[safe: midIndex]  // Safe access with String.Index
```

## Why This Over Simple Array Extensions?

Many projects implement basic array-only safe subscripts like:

```swift
extension Array {
    subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}
```

This package provides significant advantages:

- **Generic**: Works with all collection types, not just arrays
- **Range support**: Safe access to subsequences  
- **Mutability**: Safe assignment operations
- **Proper indexing**: Uses `Collection.Index` for non-integer indexed collections
- **Robust validation**: Distance-based bounds checking for arbitrary collection types

## Usage

```Swift
let array = [1, 2, 3]

guard let value = array[safe: 3] else { // Gracefully handle out-of-bounds
    return
}

// Range access
let slice = array[safe: 1..<2] // Optional subsequence

// Mutable collections
var mutableArray = [1, 2, 3]
mutableArray[safe: 1] = 42  // Safe assignment
```

As for why this isn't the default behavior in Swift, I imagine it's for backwards compatibility reasons. It's not what I prefer, though, hence why I made this.

So go ahead, `guard let` your collections to your Swifty heart's content! 🧡
