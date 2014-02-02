;;;; begin set default values
;; (set-fringe-mode '(3 . 3))
;; (set-fringe-mode
;;  (/ (- (frame-pixel-width)
;;        (* 100 (frame-char-width)))
;;     2))
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq scroll-step 1)
(setq x-select-enable-clipboard t)
(setq indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq-default fill-column 80)
(setq-default truncate-lines t)
(setq tramp-default-method "ssh")
(setq fci-rule-width 5)
(setq fci-rule-color "#360000")
(setq comment-auto-fill-only-comments t)
(setq-default fringe-indicator-alist
		'((truncation . (nil nil))
		  (continuation . (left-curly-arrow right-curly-arrow))
		  (overlay-arrow . right-triangle)
		  (up . up-arrow)
		  (down . down-arrow)
		  (top . (top-left-angle top-right-angle))
		  (bottom . (bottom-left-angle bottom-right-angle
			     top-right-angle top-left-angle))
		  (top-bottom . (left-bracket right-bracket
				 top-right-angle top-left-angle))
		  (empty-line . empty-line)
		  (unknown . question-mark)))
;; Use a minimal cursor
(setq cursor-type 'hbar)
(fset 'yes-or-no-p 'y-or-n-p)

; (set-face-font 'default "Monospace")
; (set-face-attribute 'default nil :height 90 :width 'normal)
;;;; end set default values
