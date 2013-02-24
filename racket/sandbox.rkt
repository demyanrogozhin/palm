#| WARNING CURRENT LIVE FILE IS IN PRELUDE |#

#lang typed/racket

(provide
 do-sandbox
 sandbox)

(require racket/sandbox)

(struct: exn:restart exn ())

(: sandbox (Path-String -> Void))
(define (sandbox path-str)

  (define: path : Path (if (string? path-str)
			   (string->path path-str)
			   path-str))
  (display (banner))
  (let loop ()
    (when (do-sandbox path)
	  (displayln "Restarting REPL...")
	  (loop))))

;; returns #t if REPL should be restarted else #f

(define (do-sandbox path)  
  ;; Parameters to set _before_ creating the sandboxed evaluator:
  (parameterize ([current-namespace (make-empty-namespace)]
		 [sandbox-input (current-input-port)]
		 [sandbox-output (current-output-port)]
		 [sandbox-error-output (current-error-port)]
		 [sandbox-security-guard (current-security-guard)] ;permissive
		 [sandbox-propagate-exceptions #f]
		 [sandbox-memory-limit 1024]
		 [compile-enforce-module-constants #f]
		 [compile-context-preservation-enabled #f]
		 [current-read-interaction read-interaction]
		 [current-prompt-read (make-prompt-read path)])
		(parameterize ([current-eval (make-module-evaluator path)])
			      (with-handlers ([exn:fail:sandbox-terminated?
					       (λ (exn) 
						  (displayln (format "Sandbox terminated with ~a" 
								     (exn-message exn))
							     #f))]
					      [exn:restart? (λ (_) 
							      (displayln "Restarting")
							      #t)])
					     (call-with-trusted-sandbox-configuration
					      (λ ()
						 (displayln "REPL")
						 (read-eval-print-loop)))))))

(define (make-prompt-read path)
  (let-values ([(base name dir?) (split-path path)])
    (λ ()
       (display name) (display "> ")
       (let ([in ((current-get-interaction-input-port))])
	 ((current-read-interaction) (object-name in) in)))))

(define (read-interaction src in)
  (parameterize ([read-accept-reader #t]
		 [read-accept-lang #f])
		(define: stx : Syntax (read-syntax src in))
		(displayln (format "Syntax: ~s" stx))
		(syntax-case stx (restart)
		  [(restart) (raise (exn:restart "" (current-continuation-marks)))]
		  [_ stx])))
