
(require 'tr)

(define-derived-mode tr-mode scheme-mode
  (setq mode-name "TypedRacket"))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . tr-mode))

(add-to-list 'semantic-new-buffer-setup-functions '(tr-mode . semantic-default-tr-setup))

(provide 'palm)
