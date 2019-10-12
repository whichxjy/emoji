#lang racket

(require "code-map.rkt")

(provide (all-defined-out))

;; emojize the input string and return the result
(define (emojize str #:delimiter [delimiter #\:])
  (unless (string? str)
    (raise-argument-error 'emojize "string?" str))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'emojize "(or/c char? string?)" delimiter))
  (let* ([delimiter (if (char? delimiter) (string delimiter) delimiter)]
         [pattern (regexp
                   (string-append
                    delimiter
                    "[a-zA-Z0-9\\+\\-_&.ô’Åéãíç()!#*]+"
                    delimiter))])
    (regexp-replace* pattern str
                     (lambda (match)
                       (hash-ref emoji-code-map
                                 (string-trim match delimiter))))))

;; write string with emoji characters to output port
(define (write/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'write/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'write/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'write/emoji "(or/c char? string?)" delimiter))
  (write (emojize str #:delimiter delimiter) out))

;; write string with emoji characters to output port with a new line
(define(writeln/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'writeln/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'writeln/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'writeln/emoji "(or/c char? string?)" delimiter))
  (write/emoji str out #:delimiter delimiter)
  (newline out))

;; display string with emoji characters to output port
(define (display/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'display/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'display/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'display/emoji "(or/c char? string?)" delimiter))
  (display (emojize str #:delimiter delimiter) out))

;; display string with emoji characters to output port with a new line
(define(displayln/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'displayln/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'displayln/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'displayln/emoji "(or/c char? string?)" delimiter))
  (display/emoji str out #:delimiter delimiter)
  (newline out))

;; print string with emoji characters to output port
(define (print/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'print/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'print/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'print/emoji "(or/c char? string?)" delimiter))
  (print (emojize str #:delimiter delimiter) out))

;; print string with emoji characters to output port with a new line
(define(println/emoji str [out (current-output-port)] #:delimiter [delimiter ":"])
  (unless (string? str)
    (raise-argument-error 'println/emoji "string?" str))
  (unless (output-port? out)
    (raise-argument-error 'println/emoji "output-port?" out))
  (unless (or (char? delimiter) (string? delimiter))
    (raise-argument-error 'println/emoji "(or/c char? string?)" delimiter))
  (print/emoji str out #:delimiter delimiter)
  (newline out))