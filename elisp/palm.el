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

(require 'palm-tr)
(require 'palm-inf)
(require 'palm-edit)
(require 'palm-syntax)

(defun palm-tr-mode-init ()
  "Initialize Palm Major mode.  Run by mode-hook."
  (message "FLD: %s" font-lock-defaults)
  (add-to-list 'semantic-new-buffer-setup-functions 
	       '(palm-tr-mode . semantic-default-tr-setup)))

(define-derived-mode palm-tr-mode scheme-mode "Palm"
  (setq font-lock-defaults (palm-syntax-font-lock-insensitive-case font-lock-defaults))
  (font-lock-add-keywords 'palm-tr-mode palm-syntax--keywords)
  (add-hook 'palm-tr-mode-hook 'palm-tr-mode-init))


(add-to-list 'auto-mode-alist '("\\.rkt\\'" . palm-tr-mode))

(ecb-activate)
(semantic-mode 1)
(setq font-lock-keywords-case-fold-search nil)

;; (add-to-list srecode-map-load-path "./


(provide 'palm)
