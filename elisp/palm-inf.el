;;; Comint interaction with a Typed Racket REPL.
(require 'comint)

(defconst palm-inf--buffer-name "*palm-inferior-racket*")

(defconst palm-inf--racket-cmd "/usr/local/racket/bin/racket")

(define-derived-mode palm-inf--comint-mode comint-mode "Palm Inferior Racket"
"Major mode for interacting with a the Racket interpreter.")

(defun palm-inf--racket-running-p ()
  (comint-check-proc palm-inf--buffer-name))

(defun palm-inf--assert-racket-running ()
  (unless (palm-inf--racket-running-p)
    (error "Palm: No Racket interpreter is running")))

(defun palm-inf--send-command (cmd &rest args)
  (comint-send-string palm-inf--buffer-name (apply 'format cmd args))
  (comint-send-string palm-inf--buffer-name "\n"))

(defun palm-inf-spawn-racket-process ()
  "Spawn a Racket process under comint."
  (interactive) 
  ;; make mode local
  (setq ansi-color-for-comint-mode t)
  (switch-to-buffer-other-window
   (get-buffer-create palm-inf--buffer-name))
  (palm-inf--comint-mode)
  (comint-exec (current-buffer)
	       "palm-inferior-racket"
	       palm-inf--racket-cmd
	       nil
	       nil))

(defun palm-inf-racket-exit ()
  "Exit Racket interpreter."
  (interactive)
  (palm-inf--assert-racket-running)
  (palm-inf--send-command "\n(exit)"))
  
(provide 'palm-inf)
