(require 'palm-tr)

(define-derived-mode palm-tr-mode scheme-mode
  (setq mode-name "Palm"))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . palm-tr-mode))
(add-to-list 'semantic-new-buffer-setup-functions 
	     '(palm-tr-mode . semantic-default-tr-setup))


;; (add-to-list srecode-map-load-path "./

(ecb-activate)
(semantic-mode)

(provide 'palm)
