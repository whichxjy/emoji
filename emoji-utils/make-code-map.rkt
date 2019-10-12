#lang at-exp racket

(require "gemoji.rkt")

;; code map -> list expression of code map
(define (code-map->list-string code-map)
  (let ([code-map-list (hash->list code-map)])
    (string-append
     (for/fold ([list-string "(list\n"])
               ([i (in-naturals 1)]
                [k-v code-map-list])
       (string-append list-string
                      (format "   (cons ~s \"~a\")"
                              (car k-v)
                              (cdr k-v))
                      (if (= i (length code-map-list)) "" "\n")))
     ")")))

;; code map -> content of code map file
(define (code-map->file-string code-map)
  @~a{
 #lang racket

 ;; NOTE:
 ;; THIS FILE WAS PRODUCED BY THE EMOJI CODE MAP GENERATION TOOL
 ;; (github.com/whichxjy/emoji/emoji-utils/make-code-map.rkt)
 ;; DO NOT EDIT
 
 (provide emoji-code-map)

 (define emoji-code-map
  (make-hash
   @(code-map->list-string code-map)))})

;; create code map file and write code map to it
(call-with-output-file "code-map.rkt" #:exists 'replace
  (lambda (out)
    (display (code-map->file-string (get-gemoji-code-map)) out)))