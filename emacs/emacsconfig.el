;; General Setup/Tweaks
(setq inhibit-startup-message t)
(global-linum-mode t)
(toggle-scroll-bar -1)
(setq scroll-step 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-margin 3)
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 'always)
(setq default-frame-alist '((width . 130) (height . 45)))
;; End General Setup/Tweaks

;; Config utf8 for everything
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;; End General Setup/Tweaks

;;Setup up Packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;End Setup up Packages

;; Random Packages
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))
;; End Random Packages

;; Appearance
(setq custom-safe-themes t)

(use-package all-the-icons)
(load-theme 'nord t)

(use-package spaceline
  :ensure t)

(use-package spaceline-all-the-icons
  :ensure t)

(spaceline-highlight-face-evil-state)
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-neotree)
(setq spaceline-all-the-icons-separator-type 'arrow)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-items '((recents  . 5)
			(projects . 5)
			(agenda . 5)))

  ;; Set the title
(setq dashboard-banner-logo-title "Hey Babe")
  ;; Set the banner
(setq dashboard-startup-banner "~/orgfiles/sun.png")
;; End Appearance

;; Evil Setup
(use-package evil
  :ensure t)

(use-package evil-leader
  :ensure t)

(evil-mode t)
(global-evil-leader-mode)

(evil-leader/set-leader "SPC")
(setq evil-leader/in-all-states t)

(evil-leader/set-key
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  "wd" 'evil-window-delete
  "w/" 'evil-window-split
  "w|" 'evil-window-vsplit)
;; End Evil Setup

;; Navigation/Projects
(use-package neotree
  :ensure t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(define-key evil-normal-state-map (kbd "RET") 'neotree-enter)

(use-package projectile
  :ensure t)

(use-package helm
  :ensure t)

(use-package helm-projectile
  :ensure t)

(setq helm-display-header-line nil)
(set-face-attribute 'helm-source-header nil :height 0.1)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 25)
(setq helm-autoresize-min-height 25)
(setq helm-split-window-in-side-p t)

(evil-leader/set-key
  "ft" 'neotree-toggle
  "pt" 'neotree-projectile-action
  "bb"  'helm-buffers-list
  "bd" 'kill-buffer-and-window
  "bn" 'next-buffer
  "bN" 'previous-buffer
  "ff" 'helm-find-files
  "pf" 'helm-projectile-find-file
  "gs" 'magit-status
  "sgp" 'projectile-grep
  "sp" 'projectile-switch-project
  "'" 'multi-term-dedicated-toggle
  "ct" 'xref-find-definitions
  "nt" 'xref-find-definitions-other-window
  "fed" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
  "ot" (lambda () (interactive) (find-file "~/orgfiles/todo.org")))

(setq tags-table-list '("~/code/modernmsg/modernmsg/TAGS"))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)
;; End Navigation/Projects

;; Org Mode
(use-package org-evil
  :ensure t)

(use-package org-bullets
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (web-mode cargo evil-smartparens zerodark-theme which-key toml-mode toml spaceline-all-the-icons smartparens rust-mode ruby-additional rjsx-mode powerline-evil org-evil org-bullets org-beautify-theme nord-theme neotree multi-term markdown-mode helm-projectile evil-magit evil-leader evil-commentary company coffee-mode))))

(setq org-agenda-files (list "~/orgfiles/todo.org"))

(setq org-capture-templates
      '(("t" "To Do Item" entry (file+headline "~/orgfiles/todo.org" "ToDo")
	 "* TODO %?\n%u" :prepend t)
	("n" "Note" entry (file+headline "~/orgfiles/notes.org" "Note space")
	 "* %?\n%u" :prepend t)
	))

(setq org-bullets-bullet-list
      '("◉" "◎" "⚫ " "○" "►" "◇"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
			  (sequence "⚑ WAITING(w)" "|")
			  (sequence "|" "✘ CANCELED(c)")))

(evil-leader/set-key
  "oa" 'org-agenda
  "oc" 'org-capture)
;; End Org Mode

;; Lanugage
(evil-commentary-mode)

(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-selection-wrap-around t)
(setq company-minimum-prefix-length 2)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


(use-package flycheck
  :ensure t)

(use-package smartparens
  :ensure t)
(smartparens-global-mode t)

(use-package evil-smartparens
  :ensure t)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
(add-hook 'ruby-mode-hook #'evil-smartparens-mode)
(add-hook 'rust-mode-hook #'evil-smartparens-mode)
(add-hook 'js-mode-hook #'evil-smartparens-mode)

(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'rust-mode-hook #'smartparens-mode)
(add-hook 'rails-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)

(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)


(use-package toml-mode
  :ensure t)

(use-package cargo
  :ensure t)

(use-package rjsx-mode
  :ensure t)

  ;; set default tabbing to 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; End Language

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(spaceline-all-the-icons-sunrise-face ((t (:inherit powerline-active2 :foreground "#88c0d0"))))
 '(spaceline-all-the-icons-sunset-face ((t (:inherit powerline-active2 :foreground "dark cyan"))))
 '(spaceline-highlight-face ((t (:foreground "#ECEFF4" :background "#5E81AC")))))
