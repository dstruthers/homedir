;; Use C-h as backspace. Access help with: M-x help
(global-set-key (kbd "C-h") 'delete-backward-char)

;; Auto-indentation
(global-set-key (kbd "RET") 'newline-and-indent)

;; Never insert tabs
(setq-default indent-tabs-mode nil)

;; Highlight current line
(global-hl-line-mode t)

;; Always use column-number-mode
(setq column-number-mode t)

;; Use cua-selection-mode on older Emacs lacking rectangle-mark-mode
(when (version< emacs-version "24.4")
  (cua-selection-mode t)
  (global-set-key (kbd "C-x SPC") 'cua-set-rectangle-mark)
  (define-key cua-global-keymap (kbd "C-t") 'string-rectangle))

;; Correct download failures for melpa.org
(when (and (version< "25" emacs-version)
           (version< emacs-version "26.3"))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(when (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers (quote relative))
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(linum-relative-current-symbol "")
 '(linum-relative-format "%3s ")
 '(linum-relative-global-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-variable-tag ((t (:foreground "magenta" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "cyan"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "brightyellow"))))
 '(font-lock-comment-face ((t (:foreground "brightblack"))))
 '(font-lock-constant-face ((t (:foreground "brightred"))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-type-face ((t (:foreground "yellow"))))
 '(font-lock-variable-name-face ((t (:foreground "white"))))
 '(highlight ((t (:background "brightmagenta"))))
 '(hl-line ((t (:extend t :background "color-16"))))
 '(line-number ((t (:inherit default :background "color-16" :foreground "brightblack"))))
 '(line-number-current-line ((t (:foreground "green" :inverse-video t))))
 '(link ((t (:foreground "blue" :underline t))))
 '(linum ((t (:inherit (shadow default) :background "color-16"))))
 '(linum-relative-current-face ((t (:inherit linum :background "green" :foreground "color-16"))))
 '(lsp-ui-peek-list ((t (:background "light gray" :foreground "black"))))
 '(lsp-ui-peek-peek ((t nil)))
 '(mode-line ((t (:background "brightblack" :foreground "black" :box nil))))
 '(mode-line-buffer-id ((t (:foreground "green" :weight bold))))
 '(region ((t (:extend t :background "brightblack"))))
 '(widget-field ((t (:background "brightblack" :foreground "black")))))

;; Don't warn about certain commands
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
