;;; boon-qwerty.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:
(require 'boon)

(define-key boon-select-map "@"  'boon-select-occurences)

(define-key boon-select-map "q"  'boon-select-outside-quotes)
(define-key boon-select-map "w"  'boon-select-word)
(define-key boon-select-map "g"  'boon-select-paragraph)

(define-key boon-select-map "a"  'boon-select-borders) ;; Around
(define-key boon-select-map "s"  'boon-select-wim) ;; symbol
(define-key boon-select-map "t"  'boon-select-with-spaces)
(define-key boon-select-map "d"  'boon-select-document)

(define-key boon-select-map "C"  'boon-select-comment)
(define-key boon-select-map "x"  'boon-select-outside-pairs) ;; eXpression
(define-key boon-select-map "c"  'boon-select-inside-pairs) ;; Contents

(define-key boon-select-map "z"  'boon-select-content) ;; inZide

(define-key boon-select-map "b"  'boon-select-blanks) ;; blanKs


(define-key boon-moves-map "n" 'boon-switch-mark) ; nope
(define-key boon-moves-map "N" 'pop-tag-mark)

(define-key boon-moves-map "y"  'boon-find-definition) ; yak ?
(define-key boon-moves-map "Y"  'find-function)
(define-key boon-moves-map "i"  'previous-line)
(define-key boon-moves-map "o"  'next-line)
(define-key boon-moves-map "I"  'backward-paragraph)
(define-key boon-moves-map "O"  'forward-paragraph)
(define-key boon-moves-map "u"  'boon-beginning-of-line)
(define-key boon-moves-map "p"  'boon-end-of-line)
(define-key boon-moves-map "j"  'boon-smarter-backward)
(define-key boon-moves-map ";"  'boon-smarter-forward)
(define-key boon-moves-map "K"  'boon-smarter-upward)
(define-key boon-moves-map "L"  'boon-smarter-downward)
(define-key boon-moves-map ","  'boon-beginning-of-expression)
(define-key boon-moves-map "."  'boon-end-of-expression)
(define-key boon-moves-map "k"  'backward-char)
(define-key boon-moves-map "l"  'forward-char)
(define-key boon-moves-map "<"  'beginning-of-buffer)
(define-key boon-moves-map ">"  'end-of-buffer)
(define-key boon-moves-map "h"  'avy-goto-word-1)
(define-key boon-moves-map "H"  'avy-goto-char)


(eval-after-load 'helm
  '(progn
     (define-helm-key (kbd "i") 'helm-previous-line)
     (define-helm-key (kbd "o") 'helm-next-line)
     (define-helm-key (kbd ",") 'helm-previous-page)
     (define-helm-key (kbd ".") 'helm-next-page)
     ))

;; top row
(define-key boon-helm-command-map (kbd "f")   'helm-follow-mode)
(define-key boon-helm-command-map (kbd "y")   'helm-next-line)
(define-key boon-helm-command-map (kbd "u")   'helm-previous-line)


;; Special keys

;; LEFT HAND

;; Top row
;; q
(define-key boon-command-map "q" 'boon-quote-character)

;; w,e
;; where is? elsewhere?
(define-key boon-moves-map "w "  'isearch-backward)
(define-key boon-moves-map "e "  'isearch-forward)

(define-key boon-moves-map "wt"  'boon-qsearch-previous-at-point)
(define-key boon-moves-map "et"  'boon-qsearch-next-at-point)
(define-key boon-moves-map "ws"  'boon-qsearch-previous-at-point)
(define-key boon-moves-map "es"  'boon-qsearch-next-at-point)

(define-key boon-moves-map "ww"  'boon-qsearch-previous)
(define-key boon-moves-map "ee"  'boon-qsearch-next)

(define-key boon-moves-map "W"  'boon-qsearch-previous)
(define-key boon-moves-map "E"  'boon-qsearch-next)
(define-key boon-moves-map "wp"  'boon-qsearch-previous)
(define-key boon-moves-map "ep"  'boon-qsearch-next)
(define-key boon-moves-map "we"  'previous-error)
(define-key boon-moves-map "ee"  'next-error)
(define-key boon-moves-map "wk"  'flycheck-previous-error)
(define-key boon-moves-map "ek"  'flycheck-next-error)
(define-key boon-moves-map "wb"  'previous-buffer)
(define-key boon-moves-map "yb"  'next-buffer)
(define-key boon-moves-map "eu"  'mc/cycle-forward)
(define-key boon-moves-map "wu"  'mc/cycle-backward)

;; r
(define-key boon-command-map "p" 'helm-occur) ;; occuR

;; Misc crap
(define-key boon-command-map "P" 'kmacro-end-or-call-macro) ; Play
(define-key boon-command-map "X" 'boon-highlight-regexp)

;; t
(define-key boon-command-map "t" 'boon-replace-by-character) ; "transform"


;; home row
;; a
(define-key boon-command-map "a" 'boon-enclose) ; around

;; s
(define-key boon-command-map "r" 'boon-substitute-region) ; replace
(define-key boon-command-map "R" 'kmacro-start-macro) ; Record

;; d
(define-key boon-command-map "d" 'boon-take-region) ; "delete"
(define-key boon-command-map "D" 'boon-treasure-region) ; "duplicate"

;; f
(define-key boon-command-map "f" 'boon-splice) ; flush
(define-key boon-command-map "F" 'yank-pop)

;; g
(define-key boon-command-map "g" boon-goto-map) ;; goto

;; Bottom row
;; z
;; reserved (repeat?)
;; x
(define-key boon-command-map "x" boon-x-map)
;; c
(define-key boon-command-map "c" 'boon-c-god)
;; v
(define-key boon-command-map (kbd "C-v") 'boon-open-line-and-insert)
(define-key boon-command-map "V" 'boon-open-next-line-and-insert)
(define-key boon-command-map "v" 'boon-set-insert-like-state) ; 'v' looks like an insertion mark
;; b
(define-key boon-command-map "B" 'boon-copy-to-register) ; bank
(define-key boon-command-map "b" 'insert-register)

;; RIGHT HAND: movement and marking commands.
;; Most of these are actually in the boon-moves-map; however some don't quite work there; so they end up here.
(define-key boon-command-map (kbd "C-k") 'scroll-down-line)
(define-key boon-command-map (kbd "C-l") 'scroll-up-line)

(define-key indent-rigidly-map "k" 'indent-rigidly-right)
(define-key indent-rigidly-map "l" 'indent-rigidly-left)


(provide 'boon-colemak)
;;; boon-colemak.el ends here


