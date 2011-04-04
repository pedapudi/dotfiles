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

;; begin modes list
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))
;;end modes list
;;;; end miscellaneous

