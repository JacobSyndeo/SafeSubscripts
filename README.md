# SafeSubscripts

This package lets you use use Swift subscripts safely.

Sick and tired of your code crashing when an invalid index is selected? Isn't Swift _supposed_ to be all about safety?

Well, here's where this tool comes in.

Now, when using the `safe: ` prefix on your subscripts when accessing indices in an array, you're now returned an optional, and nonexistent results return nil. This effectively matches the behavior of Swift Dictionaries, for example.

As for why this isn't the default behavior in Swift, I imagine it's for backwards compatibility reasons. It's not what I prefer, though, hence why I made this.

Go ahead, `guard let` your arrays to your Swifty heart's content! 🧡
