;;; palm-tr-by.el --- Generated parser support file

;; Copyright (C) 2013 Ray

;; Author: Ray <ray@rpr>
;; Created: 2013-02-16 18:03:54-0500
;; Keywords: syntax
;; X-RCS: $Id$

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; PLEASE DO NOT MANUALLY EDIT THIS FILE!  It is automatically
;; generated from the grammar file palm-tr.by.

;;; History:
;;

;;; Code:

(require 'semantic/lex)
(eval-when-compile (require 'semantic/bovine))

;;; Prologue
;;

;;; Declarations
;;
(defconst semantic-tr-by--keyword-table
  (semantic-lex-make-keyword-table
   '(("lang" . LANG)
     ("only-in" . ONLY-IN)
     ("require" . REQUIRE)
     ("define" . DEFINE))
   '(("define" summary "Function: (define symbol expression)")))
  "Table of language keywords.")

(defconst semantic-tr-by--token-table
  (semantic-lex-make-type-table
   '(("close-paren"
      (CLOSEPAREN . ")"))
     ("open-paren"
      (OPENPAREN . "("))
     ("punctuation"
      (LEFT-ARROW . "->")
      (COLON . "\\`[:]\\'")
      (HASH . "\\`[#]\\'")))
   'nil)
  "Table of lexical tokens.")

(defconst semantic-tr-by--parse-table
  `(
    (bovine-toplevel 
     (typed-racket)
     ) ;; end bovine-toplevel

    (typed-racket
     (semantic-list
      ,(lambda (vals start end)
	 (semantic-bovinate-from-nonterminal
	  (car
	   (nth 0 vals))
	  (cdr
	   (nth 0 vals))
	  'racket-list))
      )
     (punctuation
      "\\`[#]\\'"
      LANG
      symbol
      ,(semantic-lambda
	(list nil))
      )
     ) ;; end typed-racket

    (racket-list
     (open-paren
      "("
      racket-in-list
      close-paren
      ")"
      ,(semantic-lambda
	(progn
	  (nth 1 vals)))
      )
     ) ;; end racket-list

    (racket-in-list
     (DEFINE
       symbol
       semantic-list
       ,(semantic-lambda
	 (semantic-tag-new-variable
	  (nth 1 vals) nil nil))
       )
     (DEFINE
       symbol
       string
       ,(semantic-lambda
	 (semantic-tag-new-variable
	  (nth 1 vals)
	  (nth 2 vals) nil))
       )
     (DEFINE
       symbol
       symbol
       ,(semantic-lambda
	 (semantic-tag-new-variable
	  (nth 1 vals)
	  (nth 2 vals) nil))
       )
     (DEFINE
       semantic-list
       expression
       ,(semantic-lambda
	 (let
	     (
	      (rs
	       (split-string
		(car
		 (semantic-bovinate-from-nonterminal
		  (car
		   (nth 1 vals))
		  (cdr
		   (nth 1 vals))
		  'sexp))
		" ")))
	   (semantic-tag-new-function
	    (car rs) nil
	    (cdr rs) nil)))
       )
     (REQUIRE
      require-spec-seq
      ,(semantic-lambda
	(progn
	  (semantic-tag-new-include
	   (nth 1 vals) nil)))
      )
     (punctuation
      "\\`[:]\\'"
      symbol
      semantic-list
      ,(semantic-lambda
	(list nil))
      )
     ) ;; end racket-in-list

    (require-spec-seq
     (require-spec
      require-spec-seq
      ,(semantic-lambda
	(cons
	 (car
	  (nth 0 vals))
	 (nth 1 vals)))
      )
     (require-spec
      ,(semantic-lambda
	(nth 0 vals))
      )
     (semantic-list
      require-spec-seq
      ,(semantic-lambda
	(cons
	 (car
	  (semantic-bovinate-from-nonterminal
	   (car
	    (nth 0 vals))
	   (cdr
	    (nth 0 vals))
	   'qualified-require-spec))
	 (nth 1 vals)))
      )
     (semantic-list
      ,(lambda (vals start end)
	 (semantic-bovinate-from-nonterminal
	  (car
	   (nth 0 vals))
	  (cdr
	   (nth 0 vals))
	  'qualified-require-spec))
      )
     ( ;;EMPTY
      )
     ) ;; end require-spec-seq

    (require-spec
     (symbol)
     (string)
     ) ;; end require-spec

    (qualified-require-spec
     (open-paren
      "("
      ONLY-IN
      require-spec
      require-spec-seq
      close-paren
      ")"
      ,(semantic-lambda
	(nth 2 vals))
      )
     ) ;; end qualified-require-spec

    (symbol-seq
     (symbol
      symbol-seq
      ,(semantic-lambda
	(cons
	 (nth 0 vals)
	 (nth 1 vals)))
      )
     ( ;;EMPTY
      ,(semantic-lambda
	(list))
      )
     ) ;; end symbol-seq

    (sequence
     (expression
      sequence
      ,(semantic-lambda
	(progn
	  (cons
	   (car
	    (nth 0 vals))
	   (nth 1 vals))))
      )
     (expression
      ,(semantic-lambda
	(progn
	  (nth 0 vals)))
      )
     ) ;; end sequence

    (sexp
     (open-paren
      "("
      sequence
      close-paren
      ")"
      ,(semantic-lambda
	(progn
	  (let
	      (
	       (s-exp
		(mapconcat
		 'identity
		 (nth 1 vals)
		 " ")))
	    (list s-exp))))
      )
     ) ;; end sexp

    (expression
     (semantic-list
      ,(semantic-lambda
	(let
	    (
	     (rs
	      (semantic-bovinate-from-nonterminal
	       (car
		(nth 0 vals))
	       (cdr
		(nth 0 vals))
	       'sexp)))
	  (list
	   (concat
	    "("
	    (car rs)
	    ")"))))
      )
     (symbol)
     (string)
     (number)
     ) ;; end expression
    )
  "Parser table.")

(defun semantic-tr-by--install-parser ()
  "Setup the Semantic Parser."
  (setq semantic--parse-table semantic-tr-by--parse-table
	semantic-debug-parser-source #("palm-tr.by" 0 10 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))
	semantic-debug-parser-class 'semantic-bovine-debug-parser
	semantic-flex-keywords-obarray semantic-tr-by--keyword-table
	))


;;; Analyzers
;;

;;; Epilogue
;;

(provide 'palm-tr-by)

;;; palm-tr-by.el ends here
