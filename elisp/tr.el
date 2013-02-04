
;; Use the Semantic Bovinator for Typed Racket.
;; which was generated from tr.by

(require 'semantic)
(require 'semantic/bovine)
(require 'tr-by)
(require 'semantic/format)
(require 'semantic/dep)

(define-lex-regex-analyzer semantic-lex-scheme-symbol
  "Detect and create symbol and keyword tokens."
  "\\(\\sw\\([:]\\|\\sw\\|\\s_\\)+\\)"
  (message (format "symbol: %s" (match-string 0)))
  (semantic-lex-push-token
   (semantic-lex-token
    (or (semantic-lex-keyword-p (match-string 0)) 'symbol)
    (match-beginning 0) (match-end 0))))

(define-lex semantic-scheme-lexer
  "A simple lexical analyzer that handles simple buffers.
This lexer ignores comments and whitespace, and will return
syntax as specified by the syntax table."
  semantic-lex-ignore-whitespace
  semantic-lex-ignore-newline
  semantic-lex-scheme-symbol
  semantic-lex-charquote
  semantic-lex-paren-or-list
  semantic-lex-close-paren
  semantic-lex-string
  semantic-lex-ignore-comments
  semantic-lex-punctuation
  semantic-lex-number
  semantic-lex-default-action)


(defun semantic-default-tr-setup ()
  "Setup hook function for TR and Samantic."
  (semantic-tr-by--install-parser) ;; from compiling tr.by
  (setq semantic-symbol->name-assoc-list '((variable . "Variables")
					   (type . "Types")
					   (function . "Functions")
					   (include . "Requires")
					   (package . "Module"))
        imenu-create-index-function 'semantic-create-imenu-index
        imenu-create-index-function 'semantic-create-imenu-index)
  (setq semantic-lex-analyzer #'semantic-scheme-lexer))
  
(provide 'tr)
