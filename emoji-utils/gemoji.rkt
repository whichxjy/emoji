#lang racket

(require "url.rkt")

(provide get-gemoji-code-map)

;; url of emoji json file
(define emoji-json-url "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json")

;; base10 number -> base16 char
(define (num->hex-char num)
  (string-ref "0123456789ABCDEF" num))

;; base10 number -> base16 string
(define (num->hex-str num)
  (list->string
    (reverse
     (let loop ([num num])
       (define-values (q r) (quotient/remainder num 16))
       (if (zero? q)
           (list (num->hex-char r))
           (cons (num->hex-char r) (loop q)))))))

;; add unicode prefix to a string
(define (add-unicode-prefix str)
  (string-append "\\U" (make-string (- 8 (string-length str)) #\0) str))

;; emoji string -> unicode
(define (emoji->unicode emoji-str)
  (let* ([emoji-chars (string->list emoji-str)]
         [emoji-sub-codes (map char->integer emoji-chars)]
         [emoji-hex-sub-codes (map num->hex-str emoji-sub-codes)]
         [emoji-hex-sub-codes-with-prefix (map add-unicode-prefix emoji-hex-sub-codes)])
    (apply string-append emoji-hex-sub-codes-with-prefix)))

;; emoji json -> emoji code map [alias => emoji code point]
(define (json->code-map emoji-json)
  (for*/hash ([emoji-info emoji-json]
              [alias (hash-ref emoji-info 'aliases)])
    (values alias (emoji->unicode (hash-ref emoji-info 'emoji)))))

;; get code map from given url
(define url->code-map (compose1 json->code-map url->json))

;; get gemoji code map directly
(define (get-gemoji-code-map)
  (url->code-map emoji-json-url))