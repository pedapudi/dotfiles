;;;; begin hooks
(add-hook 'c++-mode-hook
          (lambda nil
            (setq c-basic-offset 4)))

;; hook to calculate linenum string length to right justify the numbers
;; on the left. hook to avoid recalculating count-lines
(add-hook 'linum-before-numbering-hook
	  (lambda ()
	    (setq linum-format
		  (lambda (line)
		    (propertize
		     (format
		      (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
			(concat "%" (number-to-string w) "d")) line)
		     'face
		     'linum)))))

; color for comint-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

; enable fci-mode for all modes
(add-hook 'after-change-major-mode-hook 'fci-mode)
(add-hook 'term-mode-hook (lambda () (setq fci-mode -1))) ; except for ansi-term

; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'window-configuration-change-hook
          (lambda () (reset-fringe)))

(add-hook 'after-change-major-mode-hook (lambda () (reset-fringe)))

;; If you want to hide the mode-line in every buffer by default
;; (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)
;;;; end hooks

