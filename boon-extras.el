;;; boon-extras.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:

;; This module provides (arguably) more useful bindings to the "x"
;; prefix map.

;;; Code:

(require 'boon-core)

(define-key boon-x-map "rr" 'boon-query-replace) ; replace the region if it is selected
(define-key boon-x-map "t" 'boon-toggle-comment) ; commenT
(define-key boon-x-map "i" 'boon-adjust-indent)
(define-key boon-x-map [(return)] 'boon-split-line)

(define-key boon-x-map ":" 'eval-expression)
(define-key boon-x-map "M" 'menu-bar-open)
(define-key boon-x-map "O" 'previous-window) ;; o is next window
(define-key boon-x-map "S" 'save-some-buffers)
(define-key boon-x-map "U" 'undo-tree-visualize)
(define-key boon-x-map "\\" 'align-regexp)
(define-key boon-x-map "b" 'ido-switch-buffer)
(define-key boon-x-map "f" 'ido-find-file)
(define-key boon-x-map "g" 'helm-for-files) ;; see http://amitp.blogspot.se/2012/10/emacs-helm-for-finding-files.html
(define-key boon-x-map "h" help-map)
(define-key boon-x-map "j" 'join-line)
(define-key boon-x-map "k" 'kill-this-buffer)
(define-key boon-x-map "l" 'fill-paragraph)
(define-key boon-x-map "s" 'save-buffer)
(define-key boon-x-map "vv" 'magit-status)
(define-key boon-x-map "x" 'helm-M-x)

(with-eval-after-load 'flycheck
  (define-key boon-x-map "y" flycheck-command-map))


(provide 'boon-extras)
;;; boon-extras.el ends here
