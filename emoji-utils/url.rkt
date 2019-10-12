#lang racket

(require json net/url)

(provide url->json)

;; get json from given url
(define (url->json url)
  (call/input-url (string->url url)
                  get-pure-port
                  read-json))