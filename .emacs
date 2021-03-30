;; Use C-h as backspace, not help
(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key [?\C-x ?h] 'help-command) ;; overrides mark-whole-buffer

;; Highlight current line by default
(global-hl-line-mode 1)

;; Never insert tabs
(setq-default indent-tabs-mode nil)

;; https://emacs.stackexchange.com/questions/61997/how-do-i-fix-incomprehensible-buffer-error-when-running-list-packages
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq explicit-shell-file-name "/usr/bin/zsh")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" default)))
 '(display-line-numbers (quote relative))
 '(package-selected-packages (quote (base16-theme))))

(load-theme 'base16-materia t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "brightmagenta"))))
 '(hl-line ((t (:extend t :background "color-16"))))
 '(line-number ((t (:inherit default :background "color-16" :foreground "brightblack"))))
 '(line-number-current-line ((t (:foreground "green"))))
 '(lsp-ui-peek-list ((t (:background "light gray" :foreground "black"))))
 '(lsp-ui-peek-peek ((t nil)))
 '(mode-line ((t (:background "brightblack" :foreground "black" :box nil))))
 '(region ((t (:extend t :background "brightblack")))))
