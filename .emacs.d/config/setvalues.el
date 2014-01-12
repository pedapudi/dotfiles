;;;; begin set default values
(set-fringe-mode '(3 . 3))

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

(fset 'yes-or-no-p 'y-or-n-p)

(set-face-font 'default "Monospace")
; (set-face-attribute 'default nil :height 90 :width 'normal)
;;;; end set default values
