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

(global-set-key (kbd "C-c C-k") 'copy-line)

(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)

(global-set-key (kbd "C-i") 'overwrite-mode)

;;by default, the next two keybindings are switched
(global-set-key (kbd "C-a") 'back-to-indentation)

(global-set-key (kbd "M-m") 'beginning-of-line)
;;;; end set-key maps
