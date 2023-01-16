#lang racket/base
;;; SPDX-License-Identifier: ISC
;;; SPDX-FileCopyrightText: Copyright © 2012-2023 Tony Garnock-Jones <tonyg@leastfixedpoint.com>

(require ffi/unsafe)
(require "ffi-lib.rkt")

(provide crypto_hash_BYTES
         crypto_hash_PRIMITIVE

         crypto-hash
         )

(define-libsodium crypto_hash_bytes (_fun -> _size))
(define crypto_hash_BYTES (crypto_hash_bytes))

(define-libsodium crypto_hash_primitive (_fun -> _string))
(define crypto_hash_PRIMITIVE (crypto_hash_primitive))

(define-libsodium crypto_hash (_fun _bytes _bytes _ullong -> _int))

(define (crypto-hash in)
  (define out (make-bytes crypto_hash_BYTES))
  (check-result (crypto_hash out in (bytes-length in)))
  out)
