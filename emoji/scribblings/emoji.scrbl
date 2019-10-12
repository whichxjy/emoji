#lang scribble/manual

@(require scribble/example (for-label racket))

@title{Emoji: emoji terminal output for Racket}

@defmodule[emoji]

@author[(author+email "whichxjy" "whichxjy@gmail.com")]

This is a simple package for emoji terminal output.

@section{Getting Started}

@(define emoji-link "https://www.webfx.com/tools/emoji-cheat-sheet/")

You can use @hyperlink[emoji-link]{emoji aliases} to produce emoji characters.

@examples[
 #:label "Example:"
 (require emoji)
 (displayln (emojize "Hello :cat2:!"))
 ]
             
@section{Emojizing String}

@defproc[(emojize [str string?]
                  [#:delimiter delimiter (or/c char? string?) #\:])
         string?]{
 Returns an emojized string.

 @examples[
 #:label "Examples:"
 (require emoji)
 (emojize "Lost in :tv:")
 (emojize "This __cyclone__ bring strange loyalties and skies"
          #:delimiter "__")
 ]
}

@section{Writing}

@defproc[(write/emoji [str string?]
                      [out output-port? (current-output-port)]
                      [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[write], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (write/emoji "Am I just a cat:question:")
 ]
}

@defproc[(writeln/emoji [str string?]
                        [out output-port? (current-output-port)]
                        [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[writeln], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (writeln/emoji "Am I just a cat:question:")
 ]
}

@defproc[(display/emoji [str string?]
                        [out output-port? (current-output-port)]
                        [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[display], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (display/emoji "Am I just a cat:question:")
 ]
}

@defproc[(displayln/emoji [str string?]
                          [out output-port? (current-output-port)]
                          [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[displayln], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (displayln/emoji "Am I just a cat:question:")
 ]
}

@defproc[(print/emoji [str string?]
                      [out output-port? (current-output-port)]
                      [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[print], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (print/emoji "Am I just a cat:question:")
 ]
}

@defproc[(println/emoji [str string?]
                        [out output-port? (current-output-port)]
                        [#:delimiter delimiter (or/c char? string?) #\:])
         void?]{
 Similar to @racket[println], but supports emoji aliases.
 @examples[
 #:label "Example:"
 (require emoji)
 (println/emoji "Am I just a cat:question:")
 ]
}