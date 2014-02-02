;;;; TODO: emacs 24
;;;; begin define new modes
;; begin hidden-mode-line-mode
;; (defvar hidden-mode-line-mode nil)
;; (defvar hide-mode-line nil)
;; (define-minor-mode hidden-mode-line-mode
;;   "Minor mode to hide the mode-line in the current buffer."
;;   :init-value nil
;;   :global t
;;   :variable hidden-mode-line-mode
;;   :group 'editing-basics
;;   (if hidden-mode-line-mode
;;       (setq hide-mode-line mode-line-format
;;             mode-line-format nil)
;;     (setq mode-line-format hide-mode-line
;;           hide-mode-line nil))
;;   (force-mode-line-update)
;;   ;; Apparently force-mode-line-update is not always enough to
;;   ;; redisplay the mode-line
;;   (redraw-display)
;;   (when (and (called-interactively-p 'interactive)
;;              hidden-mode-line-mode)
;;     (run-with-idle-timer
;;      0 nil 'message
;;      (concat "Hidden Mode Line Mode enabled.  "
;;              "Use M-x hidden-mode-line-mode to make the mode-line appear."))))
;; end hidden-mode-line-mode

;; A small minor mode to use a big fringe
(define-minor-mode big-fringe-mode
  :init-value nil
  :global t
  (reset-fringe))
;; end big-fringe-mode
;;;; end define new modes

;;;; begin enabling/disabling of operating modes
;; the following modes can be moved to site-start.el
;; to improve load times
(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)
(ido-everywhere t)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
(fixme-mode 1)
;; activate this global minor mode
(big-fringe-mode 1)
; (hidden-mode-line-mode 1)
(display-time-mode)
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))
;;;; end enabling/disabling of operating modes

