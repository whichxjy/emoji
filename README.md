# Emoji

Emoji terminal output for Racket.

## Example

You can use [emoji aliases](https://www.webfx.com/tools/emoji-cheat-sheet/) to produce emoji characters:

``` racket
> (require emoji)
> (emojize "Hello :cat2:!")
"Hello 🐈!"
> (emojize "Lost in :tv:")
"Lost in 📺"
> (emojize "This __cyclone__ bring strange loyalties and skies"
            #:delimiter "__")
"This 🌀 bring strange loyalties and skies"
> (displayln/emoji "Am I just a cat:question:")
Am I just a cat❓
```

## Installation

```
raco pkg install emoji
```

## Update

```
raco pkg update --update-deps emoji
```

## Documentation

[docs.racket-lang.org/emoji](https://docs.racket-lang.org/emoji)

## Inspiration

[emoji](https://github.com/kyokomi/emoji) - kyokomi