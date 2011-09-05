;;;; begin adding paths
(add-to-list 'load-path "~/.emacs.d/byte-code-cache")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(add-to-list 'load-path "~/.emacs.d/fixme-mode")
;(add-to-list 'load-path "~/.emacs.d/column-marker")
;;;;end adding paths

;;;; begin require statements
(require 'byte-code-cache) ;; everything after this is compiled on load
(require 'load-usr-config)
(require 'color-theme-zenburn)
(require 'scala-mode-auto)
(require 'fixme-mode) ;NOTE when a new mode is added, need to edit fixme-mode.el
(require 'browse-kill-ring) ;; provided with emacs-goodies.el
;;;; end require statements

;;begin loading customizations
(load-usr-config) ;;contains text that is typically in .emacs
;;end loading customizations

;; begin color theme
(color-theme-zenburn)
;; end color theme


;;;; begin ECB customizations
;; kept separate from other customization
;; blocks
;;;; end ECB customizations


;;;; begin defaults for custom-sets
;; note that these are already reflected 
;; in setq at the beginning of the init
;; file
;(custom-set-variables
; '(column-number-mode t)
; '(inhibit-startup-screen t)
; '(scroll-bar-mode nil)
; '(show-paren-mode t))
;;;; end defaults for custom-sets

;;;; begin default face 
;; used when color-theme is not used
;(custom-set-faces
; '(default ((t (:inherit nil :stipple nil :background "gray2" 
;                         :foreground "white" :inverse-video nil 
;                         :box nil :strike-through nil :overline nil 
;                         :underline nil :slant normal :weight normal 
;                         :height 80 :width normal :foundry "unknown" 
;                         :family "Monospace"))))
; '(linum ((t (:background "gray10" :foreground "white")))))
;;;; end default face
