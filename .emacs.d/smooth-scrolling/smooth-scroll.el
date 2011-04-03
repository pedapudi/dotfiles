<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: smooth-scroll.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=smooth-scroll.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: smooth-scroll.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=smooth-scroll.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for smooth-scroll.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=smooth-scroll.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22smooth-scroll.el%22">smooth-scroll.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/smooth-scroll.el">Download</a></p><pre class="code"><span class="linecomment">;;; smooth-scroll.el --- Minor mode for smooth scrolling.</span>

<span class="linecomment">;; Copyright (C) 2010 K-talo Miyazaki, all rights reserved.</span>

<span class="linecomment">;; Author: K-talo Miyazaki &lt;Keitaro dot Miyazaki at gmail dot com&gt;</span>
<span class="linecomment">;; Created: 14 March 2010 AM 03:36 JST</span>
<span class="linecomment">;; Keywords: convenience emulations frames</span>
<span class="linecomment">;; Revision: $Id: 2c3b0432e90ab6bbf20747d607b64fcf89e3c223 $</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/emacs/download/smooth-scroll.el</span>
<span class="linecomment">;; GitHub: http://github.com/k-talo/smooth-scroll.el</span>

<span class="linecomment">;; This file is not part of GNU Emacs.</span>

<span class="linecomment">;; This program is free software: you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation, either version 3 of the License, or</span>
<span class="linecomment">;; (at your option) any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>

<span class="linecomment">;;; NOTE</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This library is just tested on Emacs 23.2.1 on Ubuntu 10.04</span>
<span class="linecomment">;; and Mac OS X 10.6.3, and won't be run with any version of XEmacs.</span>

<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Overview</span>
<span class="linecomment">;; ========</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This library provides minor mode `smooth-scroll-mode' which adds</span>
<span class="linecomment">;; smooth scrolling feature to Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; INSTALLING</span>
<span class="linecomment">;; ==========</span>
<span class="linecomment">;; To install this library, save this file to a directory in your</span>
<span class="linecomment">;; `load-path' (you can view the current `load-path' using "C-h v</span>
<span class="linecomment">;; load-path RET" within Emacs), then add the following line to your</span>
<span class="linecomment">;; .emacs startup file:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (require 'smooth-scroll)</span>
<span class="linecomment">;;    (smooth-scroll-mode t)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; USING</span>
<span class="linecomment">;; =====</span>
<span class="linecomment">;; To toggle smooth scrolling feature, just type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    M-x smooth-scroll-mode</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; while smooth scrolling feature is enabled, the string "SScr" will</span>
<span class="linecomment">;; be displayed on mode line.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Also check out the customization group</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `M-x customize-group RET smooth-scroll RET'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Additional commands provided by `smooth-scroll.el'.</span>
<span class="linecomment">;; ===================================================</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This library provides commands that brings `in place scrolling'</span>
<span class="linecomment">;; feature, listed below:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `scroll-up-1'</span>
<span class="linecomment">;;    `scroll-down-1'</span>
<span class="linecomment">;;    `scroll-left-1'</span>
<span class="linecomment">;;    `scroll-right-1'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Bind these commands to any key you like for your convenience.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Keymap example:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;      (global-set-key [(control  down)]  'scroll-up-1)</span>
<span class="linecomment">;;      (global-set-key [(control  up)]    'scroll-down-1)</span>
<span class="linecomment">;;      (global-set-key [(control  left)]  'scroll-right-1)</span>
<span class="linecomment">;;      (global-set-key [(control  right)] 'scroll-left-1)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;      NOTE: Keys described above won't work on non window-system.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; KNOWN PROBLEMS</span>
<span class="linecomment">;; ==============</span>
<span class="linecomment">;; - The speed of smooth scrolling is very slow on `Carbon Emacs'</span>
<span class="linecomment">;;   and `Cocoa Emacs' on Mac OS X. If you want to use smooth scrolling</span>
<span class="linecomment">;;   feature comfortably on these Emacsen, set large number</span>
<span class="linecomment">;;   (e.g. 4, 6 or 8) to the variable `smooth-scroll/vscroll-step-size' </span>
<span class="linecomment">;;   and `smooth-scroll/hscroll-step-size'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - `scroll-left-1' and `scroll-right-1' may not work properly</span>
<span class="linecomment">;;   when the `smooth-scroll-mode' is turned off, due to the behavior</span>
<span class="linecomment">;;   of original `scroll-left' and `scroll-right' functions.</span>

<span class="linecomment">;;; Change Log:</span>

<span class="linecomment">;;; Code:</span>

(defconst smooth-scroll/version "<span class="quote">1.0</span>")

(eval-when-compile
  (require 'cl)
  (require 'easy-mmode))

 
<span class="linecomment">;;; ===========================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;  User customizable things.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; ===========================================================================</span>

(defgroup smooth-scroll nil
  "<span class="quote">Scroll window smoothly.</span>"
  :group 'editing)

(defcustom smooth-scroll/vscroll-step-size 2
  "<span class="quote">Amount of lines, which determines quality of smooth vertical scrolling.
The small number makes it better, the large number makes it rough.

This value must be a positive number, otherwise `1' will be used.

Default value is `2'.</span>"
  :type 'integer
  :group 'smooth-scroll)

(defcustom smooth-scroll/hscroll-step-size 2
  "<span class="quote">Amount of columns, which determines quality of smooth horizontal scrolling.
The small number makes it better, the large number makes it rough.

This value must be a positive number, otherwise `1' will be used.

Default value is `2'.</span>"
  :type 'integer
  :group 'smooth-scroll)

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Additional commands provided by `smooth-scroll.el'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>

(defun scroll-up-1 (&optional arg)
  "<span class="quote">Scroll text of selected window upward ARG lines.
If ARG is omitted or nil, scroll upward by a line.
Negative ARG means scroll downward.
If ARG is the atom `-', scroll downward by a line.
When calling from a program, supply as argument a number, nil, or `-'.

After scrolling, position of the cursor will be kept when possible.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
    (scroll-up amount)))

(defun scroll-down-1 (&optional arg)
  "<span class="quote">Scroll text of selected window down ARG lines.
If ARG is omitted or nil, scroll down by a line.
Negative ARG means scroll upward.
If ARG is the atom `-', scroll upward by a line.
When calling from a program, supply as argument a number, nil, or `-'.

After scrolling, position of the cursor will be kept when possible.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
    (scroll-down amount)))

(defun scroll-left-1 (&optional arg)
  "<span class="quote">Scroll selected window display ARG columns left.
If ARG is omitted or nil, scroll left by a column.
Negative ARG means scroll rightward.
If ARG is the atom `-', scroll right by a column.
When calling from a program, supply as argument a number, nil, or `-'.

After scrolling, position of the cursor will be kept when possible.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
    (scroll-left amount)))

(defun scroll-right-1 (&optional arg)
  "<span class="quote">Scroll selected window display ARG columns right.
If ARG is omitted or nil, scroll right by a column.
Negative ARG means scroll leftward.
If ARG is the atom `-', scroll left by a column.
When calling from a program, supply as argument a number, nil, or `-'.

After scrolling, position of the cursor will be kept when possible.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
    (scroll-right amount)))

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Variables.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>
(defvar smooth-scroll/.scrolling-p nil
  "<span class="quote">Private variable used in `smooth-scroll-mode'.</span>")

(defvar smooth-scroll/.debugging-p nil
  "<span class="quote">Private variable used in `smooth-scroll-mode'.</span>")

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Macros and Utility functions.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>
(defmacro smooth-scroll/.run-without-recursive-call (&rest body)
  `(when (and (not smooth-scroll/.scrolling-p)
              (not (smooth-scroll/.drop-events)))
     (prog2 (setq smooth-scroll/.scrolling-p t)
       (unwind-protect
         (progn ,@body)
         (setq smooth-scroll/.scrolling-p nil)))))
    
(defun smooth-scroll/.debug-msg (str)
  (when smooth-scroll/.debugging-p
    (save-excursion
      (set-buffer (get-buffer-create "<span class="quote">*Messages*</span>"))
      (goto-char (point-max))
      (insert str)
      (goto-char (point-max))
      <span class="linecomment">;;(recenter -3)</span>
      )))
    
(defun smooth-scroll/.drop-events ()
  <span class="linecomment">;; To avid queuing so much scrolling events to the event</span>
  <span class="linecomment">;; queue of Emacs, drop them while scrolling smoothly.</span>
  (when (input-pending-p)
    (smooth-scroll/.debug-msg "<span class="quote">smooth-scroll/.drop-events: dropped event.\n</span>")
    (let (ev)
      (while (and (input-pending-p) (setq ev (read-event)))
        (smooth-scroll/.debug-msg
         (format "<span class="quote">\"%s\"\n</span>" ev))))
    t))

(defvar smooth-scroll/redisplay-interval (when (not window-system) 0.005)
  "<span class="quote">Private variable used in `smooth-scroll-mode'.</span>")

(defun smooth-scroll/.force-redisplay ()
  (while (and (not executing-kbd-macro)
              (not (redisplay t)))
    (smooth-scroll/.debug-msg "<span class="quote">Redisplay was not run.</span>"))
  (when (numberp smooth-scroll/redisplay-interval)
    <span class="linecomment">;; Required by emacs running with '-nw' option.</span>
    (sleep-for smooth-scroll/redisplay-interval)))

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Vertical scrolling.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>

<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>
<span class="linecomment">;;; Commands</span>
<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>

(defun smooth-scroll/scroll-up (&optional arg)
       "<span class="quote">Scroll text of selected window upward ARG lines.
If ARG is omitted or nil, scroll upward by a near full screen.
A near full screen is `next-screen-context-lines' less than a full screen.
Negative ARG means scroll downward.
If ARG is the atom `-', scroll downward by nearly full screen.
When calling from a program, supply as argument a number, nil, or `-'.</span>"
  (interactive "<span class="quote">P</span>")
  (smooth-scroll/.vscroll-aux arg t))


(defun smooth-scroll/scroll-down (&optional arg)
       "<span class="quote">Scroll text of selected window down ARG lines.
If ARG is omitted or nil, scroll down by a near full screen.
A near full screen is `next-screen-context-lines' less than a full screen.
Negative ARG means scroll upward.
If ARG is the atom `-', scroll upward by nearly full screen.
When calling from a program, supply as argument a number, nil, or `-'.</span>"
  (interactive "<span class="quote">P</span>")
  (smooth-scroll/.vscroll-aux arg nil))


<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>
<span class="linecomment">;;; Functions</span>
<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>

(defun smooth-scroll/.vscroll-aux (amount up-p)
  "<span class="quote">Private function used in `smooth-scroll-mode'.</span>"
  (smooth-scroll/.run-without-recursive-call
     <span class="linecomment">;; First argument is a list, typically prefix arguments with no value.</span>
     (when (listp amount)
       (setq amount (first amount)))
     
   <span class="linecomment">;; Arrange direction.</span>
   <span class="linecomment">;;</span>
   (when (eq amount '-)
     (setq amount nil)
     (setq up-p (not up-p)))
   (when (minusp (or amount 0))
     (setq amount (- amount))
     (setq up-p (not up-p)))

   <span class="linecomment">;; Scroll by a near full screen, when scroll amount</span>
   <span class="linecomment">;; is not specified.</span>
   (or amount
       (setq amount (- (window-height)
                       1                <span class="linecomment">;current line</span>
                       (if mode-line-format 1 0)
                       (if header-line-format 1 0)
                       (or next-screen-context-lines 0))))

   <span class="linecomment">;; Do smooth scrolling.</span>
   <span class="linecomment">;;</span>
   (while (&gt; amount 0)
     (let ((delta (min amount (max smooth-scroll/vscroll-step-size 1))))
       (if up-p
         (smooth-scroll/orig-scroll-up delta)
         (smooth-scroll/orig-scroll-down delta))
       (smooth-scroll/.force-redisplay)
       (setq amount (- amount delta))))

   amount))

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Horizontal scrolling.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>

<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>
<span class="linecomment">;;; Commands</span>
<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>

(defun smooth-scroll/scroll-left (&optional arg set-minimum)
  "<span class="quote">Scroll selected window display ARG columns left.
Default for ARG is window width minus 2.
Value is the total amount of leftward horizontal scrolling in
effect after the change.
If SET-MINIMUM is non-nil, the new scroll amount becomes the
lower bound for automatic scrolling, i.e. automatic scrolling
will not scroll a window to a column less than the value returned
by this function.  This happens in an interactive call.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; XXX: Process set-minimum properly.</span>
  <span class="linecomment">;;</span>
  (smooth-scroll/.hscroll-aux arg t))


(defun smooth-scroll/scroll-right (&optional arg set-minimum)
  "<span class="quote">Scroll selected window display ARG columns right.
Default for ARG is window width minus 2.
Value is the total amount of leftward horizontal scrolling in
effect after the change.
If SET-MINIMUM is non-nil, the new scroll amount becomes the
lower bound for automatic scrolling, i.e. automatic scrolling
will not scroll a window to a column less than the value returned
by this function.  This happens in an interactive call.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; XXX: Process set-minimum properly.</span>
  <span class="linecomment">;;</span>
  (smooth-scroll/.hscroll-aux arg nil))


<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>
<span class="linecomment">;;; Functions</span>
<span class="linecomment">;;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </span>

(defun smooth-scroll/.keep-cursor-within-new-hscroll-margin (delta left-p)
  <span class="linecomment">;; Relations of values used in this function are:</span>
  <span class="linecomment">;;</span>
  <span class="linecomment">;;         col-num</span>
  <span class="linecomment">;;             \</span>
  <span class="linecomment">;;  |&lt;--------------------&gt;|</span>
  <span class="linecomment">;;  |          left-margin |     right-margin</span>
  <span class="linecomment">;;  |        |&lt;-----------&gt;|&lt;--------------------&gt;|</span>
  <span class="linecomment">;;                                                      BUFFER</span>
  <span class="linecomment">;;           +------------------------------------+      /</span>
  <span class="linecomment">;;  +--------|             (point)                |-----+</span>
  <span class="linecomment">;;  |        |             /                      |     |</span>
  <span class="linecomment">;;  |text text text text.. I text text text text text   |</span>
  <span class="linecomment">;;  |\       |                                    | /   |</span>
  <span class="linecomment">;;  |(point-at-bol)                       (poitn-at-eol)|</span>
  <span class="linecomment">;;  |        |                                    |     |</span>
  <span class="linecomment">;;  +--------|                                    |-----+</span>
  <span class="linecomment">;;           +------------------------------------+ &lt;--\</span>
  <span class="linecomment">;;                                                     WINDOW</span>
  <span class="linecomment">;;           |&lt;---&gt;|                        |&lt;---&gt;|</span>
  <span class="linecomment">;;           |   \                            /   |</span>
  <span class="linecomment">;;           | required-margin    required-margin |</span>
  <span class="linecomment">;;  |&lt;------&gt;|&lt;----------------------------------&gt;|</span>
  <span class="linecomment">;;       \                       \</span>
  <span class="linecomment">;;       hscroll                (window-width)</span>
  <span class="linecomment">;;</span>
  (let* ((col-num (- (point) (point-at-bol)))
         (hscroll (window-hscroll))
         (required-margin (+ hscroll-margin delta 1)))
    <span class="linecomment">;; Retains required margin if necessary.</span>
    (if left-p 
      <span class="linecomment">;; When scroll to left:</span>
      (let ((left-margin (- col-num hscroll)))
        (when (&lt; left-margin required-margin)
          <span class="linecomment">;; Move cursor to forward.</span>
          (forward-char (min (- required-margin left-margin)
                             <span class="linecomment">;; Don't move forward over (point-at-eol).</span>
                             (- (point-at-eol) (point))))))
      <span class="linecomment">;; When scroll to right:</span>
      (let ((right-margin (- (+ (window-width) hscroll) col-num)))
        (when (&lt; right-margin required-margin)
          (backward-char (min (- required-margin right-margin)
                              <span class="linecomment">;; Don't move back over (point-at-bol).</span>
                              col-num)))))))


(defun smooth-scroll/.do-primitive-hscroll (delta left-p)
  (if left-p
    (smooth-scroll/orig-scroll-left delta)
    (smooth-scroll/orig-scroll-right delta)))


<span class="linecomment">;; These two variables are used in `smooth-scroll/.restore-auto-hscroll-mode'.</span>
(defvar smooth-scroll/.pre-command-hook nil)
(defvar smooth-scroll/.orig-auto-hscroll-mode nil)

(defun smooth-scroll/.restore-auto-hscroll-mode (orig-auto-hscroll-mode)
  (when (not smooth-scroll/.pre-command-hook)
    (setq smooth-scroll/.orig-auto-hscroll-mode orig-auto-hscroll-mode)
    (setq smooth-scroll/.pre-command-hook
            #'(lambda ()
                (when (or (not (symbolp this-command))
                          (not (get this-command 'scroll-command-p)))
                  (progn
                    (smooth-scroll/.debug-msg
                     (format "<span class="quote">this-command: %s\n</span>" this-command))
                    (setq auto-hscroll-mode smooth-scroll/.orig-auto-hscroll-mode)
                    (remove-hook 'pre-command-hook smooth-scroll/.pre-command-hook)
                    (setq smooth-scroll/.pre-command-hook nil)))))
    (add-hook 'pre-command-hook smooth-scroll/.pre-command-hook)))


(defun smooth-scroll/.hscroll-aux (amount left-p)
  (smooth-scroll/.run-without-recursive-call
   (if (not truncate-lines)
       (message "<span class="quote">[smooth-scroll] hscroll won't work when the value of `truncate-line' is `nil'.</span>")
     <span class="linecomment">;; First argument is a list, typically prefix arguments with no value.</span>
     (when (listp amount)
       (setq amount (first amount)))
     
     <span class="linecomment">;; Arrange direction.</span>
     <span class="linecomment">;;</span>
     (when (eq amount '-)
       (setq amount nil)
       (setq left-p (not left-p)))
     (when (minusp (or amount 0))
       (setq amount (- amount))
       (setq left-p (not left-p)))

     <span class="linecomment">;; Scroll by a near full screen, when scroll amount</span>
     <span class="linecomment">;; is not specified.</span>
     (or amount
         (setq amount (- (window-width)
                         2)))

     (let ((orig-auto-p auto-hscroll-mode))
       <span class="linecomment">;; </span>
       (setq auto-hscroll-mode nil)
       <span class="linecomment">;; Do smooth scrolling.</span>
       (while (&gt; amount 0)
         (let ((delta (min amount
                           (max smooth-scroll/hscroll-step-size 1))))
           (smooth-scroll/.keep-cursor-within-new-hscroll-margin delta left-p)
           (smooth-scroll/.do-primitive-hscroll delta left-p)
           (smooth-scroll/.force-redisplay)
           (decf amount delta)))
       <span class="linecomment">;;</span>
       (smooth-scroll/.restore-auto-hscroll-mode orig-auto-p)
       
       amount))))

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Define minor mode `smooth-scroll-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>

(easy-mmode-define-minor-mode
 smooth-scroll-mode "<span class="quote">Minor mode for smooth scrolling.</span>"
 :global t
 :init-value nil
 :lighter "<span class="quote"> SScr</span>"
 (if (or (not (boundp 'smooth-scroll-mode))
         smooth-scroll-mode)
   (progn
     <span class="linecomment">;; Override embedded functions. (Evil hack)</span>
     (setf (symbol-function 'scroll-up)
             (symbol-function 'smooth-scroll/scroll-up))
     (setf (symbol-function 'scroll-down)
             (symbol-function 'smooth-scroll/scroll-down))
     (setf (symbol-function 'scroll-left)
             (symbol-function 'smooth-scroll/scroll-left))
     (setf (symbol-function 'scroll-right)
             (symbol-function 'smooth-scroll/scroll-right))

     <span class="linecomment">;; Initialize variables</span>
     (setq smooth-scroll/.scrolling-p nil)
     (when smooth-scroll/.pre-command-hook
       (remove-hook 'pre-command-hook smooth-scroll/.pre-command-hook)
       (setq smooth-scroll/.pre-command-hook nil)))
   (progn
     <span class="linecomment">;; Restore original scrolling functions.</span>
     (setf (symbol-function 'scroll-up)
             (symbol-function 'smooth-scroll/orig-scroll-up))
     (setf (symbol-function 'scroll-down)
             (symbol-function 'smooth-scroll/orig-scroll-down))
     (setf (symbol-function 'scroll-left)
             (symbol-function 'smooth-scroll/orig-scroll-left))
     (setf (symbol-function 'scroll-right)
             (symbol-function 'smooth-scroll/orig-scroll-right)))))

 
<span class="linecomment">;;;============================================================================</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Initialization.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;============================================================================</span>

(when (not (featurep 'smooth-scroll))
  <span class="linecomment">;; Save original scrolling functions.</span>
  (when (not (fboundp 'smooth-scroll/orig-scroll-up))
    (setf (symbol-function 'smooth-scroll/orig-scroll-up)
            (symbol-function 'scroll-up)))
  (when (not (fboundp 'smooth-scroll/orig-scroll-down))
    (setf (symbol-function 'smooth-scroll/orig-scroll-down)
            (symbol-function 'scroll-down)))
  (when (not (fboundp 'smooth-scroll/orig-scroll-left))
    (setf (symbol-function 'smooth-scroll/orig-scroll-left)
            (symbol-function 'scroll-left)))
  (when (not (fboundp 'smooth-scroll/orig-scroll-right))
    (setf (symbol-function 'smooth-scroll/orig-scroll-right)
            (symbol-function 'scroll-right)))
  
  <span class="linecomment">;; Mark scroll commands.</span>
  (put 'scroll-up      'scroll-command-p t)
  (put 'scroll-down    'scroll-command-p t)
  (put 'scroll-left    'scroll-command-p t)
  (put 'scroll-right   'scroll-command-p t)
  (put 'scroll-up-1    'scroll-command-p t)
  (put 'scroll-down-1  'scroll-command-p t)
  (put 'scroll-left-1  'scroll-command-p t)
  (put 'scroll-right-1 'scroll-command-p t))

(provide 'smooth-scroll)

<span class="linecomment">;; smooth-scroll ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=smooth-scroll.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=smooth-scroll.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=smooth-scroll.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=smooth-scroll.el">Administration</a></span><span class="time"><br /> Last edited 2010-10-21 01:27 UTC by <a class="author" title="from 61-22-3-160.rev.home.ne.jp" href="http://www.emacswiki.org/emacs/Kiwanami">Kiwanami</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=smooth-scroll.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
