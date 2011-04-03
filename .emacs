;;;; begin adding paths
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(add-to-list 'load-path "~/.emacs.d/fixme-mode")
;(add-to-list 'load-path "~/.emacs.d/column-marker")
;;;;end adding paths

;;;; begin require statements
(require 'color-theme-zenburn)
(require 'color-theme-thor)
(require 'scala-mode-auto)
(require 'fixme-mode) ;NOTE when a new mode is added, need to edit fixme-mode.el
;(require 'column-marker)
;;;; end require statements

;;;; begin enabling/disabling of operating modes
(menu-bar-mode 0) 
(tool-bar-mode 0)
(ido-mode 1)
(fixme-mode 1)
(ido-everywhere t)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
;;;; end enabling/disabling of operating modes

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

(fset 'yes-or-no-p 'y-or-n-p)
;;;; end set default values

;;;; begin defuns

;; begin tags
(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
    (defun find-tags-file-r (path)
      "find the tags file from the parent directories"
      (let* ((parent (file-name-directory path))
	     (possible-tags-file (concat parent "TAGS")))
	(cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))
    
    (if (buffer-file-name)
        (catch 'found-it 
          (find-tags-file-r (buffer-file-name)))
      (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
 (interactive)
  (setq tags-table-list (list (jds-find-tags-file))))
;; end tags

;; begin next and previous window navigation
(defun select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))

;;end next and previous window navigation 

;;begin fullscreen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
;;end fullscreen

;;begin copy
 (defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
;;end copy

;;;; end defuns

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

; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
;;;; end hooks

;;;; begin set-key maps

;;begin M-x mode for ido
(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))
;;end M-x mode for ido

;;begin navigation
;C-x o is by default set to other-window
(global-set-key (kbd "C-x o") 'select-next-window)
(global-set-key (kbd "C-x p")  'select-previous-window)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to lower window
;;end navigation

(global-set-key (kbd "C-l") 'goto-line)

(global-set-key (kbd "C-\\") 'ecb-toggle-ecb-windows)

(global-set-key (kbd "C-x t") 'jds-set-tags-file-path)

(global-set-key [f11] 'toggle-fullscreen)

(global-set-key "\C-c\C-k" 'copy-line)
;;;; end set-key maps

;;;; begin miscellaneous
;; begin 80 column marker
;;OPTION 1
;(setq whitespace-style (quote (lines-tail))
;      whitespace-line-column 80)
;(global-whitespace-mode 1)
;
;;OPTION 2
;(column-marker-1 80)
;; end 80 column marker


;; begin color theme
;(color-theme-zenburn)
(color-theme-thor)
;; end color theme

;; begin modes list
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))
;;end modes list
;;;; end miscellaneous

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
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "gray2" 
                         :foreground "white" :inverse-video nil 
                         :box nil :strike-through nil :overline nil 
                         :underline nil :slant normal :weight normal 
                         :height 98 :width normal :foundry "unknown" 
                         :family "DejaVu Sans Mono"))))
 '(linum ((t (:background "gray10" :foreground "white")))))
;;;; end default face
