;;;; begin enabling/disabling of operating modes
;; the following modes have been moved to site-start.el
;; to improve load times
;; (menu-bar-mode 0) 
;; (tool-bar-mode 0)
;; (ido-mode 1)
;; (ido-everywhere t)
;; (scroll-bar-mode -1)
;; (show-paren-mode 1)
;; (global-linum-mode 1)
;; (column-number-mode 1)
;; (delete-selection-mode 1)
(fixme-mode 1)
(display-time-mode)
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))
;;;; end enabling/disabling of operating modes
