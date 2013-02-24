;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ray Racine's Palm Major Emacs Mode For Typed Racket
;; Copyright (C) 2013  Raymond Paul Racine
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst palm-syntax--keywords
  '(("\\(\\s-\\|(\\)\\(->\\)\\s-" (2 'font-lock-keyword-face))
    ("(:\\s-\\b\\(\\sw*[^[:space:]]*\\)" (1 'font-lock-function-name-face))
    ("\\<\\([[:upper:]]\\w*\\)"   (1 'font-lock-type-face))
    ("(\\(require\\)" (1 'font-lock-keyword-face))
    ("(\\(only-in\\)" (1 'font-lock-keyword-face))
    ("(\\(provide\\)" (1 'font-lock-keyword-face))
    ("(\\(parameterize\\)" (1 'font-lock-keyword-face))
    ("\\(#lang\\) +\\(typed/racket\\)\\(/base\\)?"
     (1 'font-lock-keyword-face)
     (2 'font-lock-constant-face)
     (3 'font-lock-constant-face))))

(defun palm-syntax-font-lock-insensitive-case (font-lock-defaults)
  "Reset inherited scheme mode to case insensitive font locking."
  (let ((tail-config (cdddr font-lock-defaults))
	(kw (car font-lock-defaults)))
    (cons kw (cons nil (cons nil tail-config)))))

;; The initial seeding, and hence probably enduringly most of this file, 
;; was shamelessly inspired by the literal character from 
;; Jose Antonio Ortega Ruiz's (JAO) excellent Geiser.
;; Geiser is licensed Modified BSD.
    
;; (defmacro palm-syntax--scheme-indent (&rest pairs)
;;   `(progn ,@(mapcar (lambda (p)
;;                       `(put ',(car p) 'scheme-indent-function ',(cadr p)))
;;                     pairs)))

;; (palm-syntax--scheme-indent
;;  (case-lambda 0)
;;  (catch defun)
;;  (class defun)
;;  (dynamic-wind 0)
;;  (let*-values 1)
;;  (letrec* 1)
;;  (letrec-values 1)
;;  (let-values 1)
;;  (let/ec 1)
;;  (match defun)
;;  (match-let defun)
;;  (opt-lambda 1)
;;  (parameterize 1)
;;  (parameterize* 1)
;;  (receive 2)
;;  (syntax-case 2)
;;  (unless 1)
;;  (when 1)
;;  (while 1)
;;  (with-error-to-port 1)
;;  (with-syntax 1))

;; ;;; Extra syntax keywords
;; (defconst palm-syntax--keywords
;;   '(("\\[\\(else\\)\\>" . 1)
;;     ("(\\(parameterize\\)\\>" . 1)))

(provide 'palm-syntax)

