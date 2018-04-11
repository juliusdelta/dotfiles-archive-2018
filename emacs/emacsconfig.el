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
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

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
(setq dashboard-banner-logo-title "Hey Babe")
(setq dashboard-startup-banner "~/dotfiles/sun.png")

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
  "w|" 'evil-window-vsplit
  "d"  'dired-jump)

(use-package neotree
  :ensure t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "gr") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-quick-look)

(use-package projectile
  :ensure t)

(use-package projectile-ripgrep
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

(use-package expand-region
  :ensure t)
(setq expand-region-contract-fast-key "z")

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
  "sgp" 'projectile-ripgrep
  "sp" 'projectile-switch-project
  "'" 'multi-term-dedicated-toggle
  "ct" 'xref-find-definitions
  "nt" 'xref-find-definitions-other-window
  "v" 'er/expand-region
  "fed" (lambda () (interactive) (find-file "~/dotfiles/emacs/emacsconfig.org"))
  "ot" (lambda () (interactive) (find-file "~/Dropbox/orgfiles/todo.org"))
  "on" (lambda () (interactive) (find-file "~/Dropbox/orgfiles/notes.org")))

(setq tags-table-list '("~/code/modernmsg/modernmsg/TAGS"))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package org-evil
  :ensure t)

(use-package org-bullets
  :ensure t)
  
(use-package htmlize
  :ensure t)

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)
  
(use-package ox-twbs
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (web-mode cargo evil-smartparens zerodark-theme which-key toml-mode toml spaceline-all-the-icons smartparens rust-mode ruby-additional rjsx-mode powerline-evil org-evil org-bullets org-beautify-theme nord-theme neotree multi-term markdown-mode helm-projectile evil-magit evil-leader evil-commentary company coffee-mode))))

(setq org-agenda-files (list "~/Dropbox/orgfiles/todo.org"))

(setq org-capture-templates
      '(("t" "To Do Item" entry (file+headline "~/Dropbox/orgfiles/todo.org" "ToDo")
         "* TODO %?\n%u" :prepend t)
        ("n" "Note" entry (file+headline "~/Dropbox/orgfiles/notes.org" "Note space")
         "* %?\n%u" :prepend t)
        ("b" "Blog Idea" entry (file+headline "~/Dropbox/orgfiles/blogs.org" "Idea List")
         "* %?\n%u" :prepend t)
        ("s" "Code Snippet" entry (file  "~/Dropbox/orgfiles/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC" :prepend t)
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
  :ensure t
  :config
  (progn 
    (show-smartparens-global-mode t)))
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

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
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-hook 'ruby-mode-hook #'smartparens-mode)
(setq ruby-insert-encoding-magic-comment nil)
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

(use-package jsx-mode
  :ensure t)

(defadvice js-jsx-indent-line (after js-jsx-indent-line-after-hack activate)
  "Workaround sgml-mode and follow airbnb component style."
  (save-excursion
    (beginning-of-line)
    (if (looking-at-p "^ +\/?> *$")
        (delete-char sgml-basic-offset))))

(use-package rspec-mode
  :ensure t)
(evil-leader/set-key
  "mtb" 'rspec-verify-single
  "mtt" 'rspec-verify-matching
  "mta" 'rspec-verify-all)

(use-package exec-path-from-shell
  :ensure t)

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

  (defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

;; begin customization taken from https://gist.github.com/ekaschalk/f0ac91c406ad99e53bb97752683811a5
(require 'dash)
(require 's)

(defmacro with-face (STR &rest PROPS)
  "Return STR propertized with PROPS."
  `(propertize ,STR 'face (list ,@PROPS)))

(defmacro esh-section (NAME ICON FORM &rest PROPS)
  "Build eshell section NAME with ICON prepended to evaled FORM with PROPS."
  `(setq ,NAME
         (lambda () (when ,FORM
                 (-> ,ICON
                    (concat esh-section-delim ,FORM)
                    (with-face ,@PROPS))))))

(defun esh-acc (acc x)
  "Accumulator for evaluating and concatenating esh-sections."
  (--if-let (funcall x)
      (if (s-blank? acc)
          it
        (concat acc esh-sep it))
    acc))

(defun esh-prompt-func ()
  "Build `eshell-prompt-function'"
  (concat esh-header
          (-reduce-from 'esh-acc "" eshell-funcs)
          "\n"
          eshell-prompt-string))

(esh-section esh-dir
             "\xf07b"  ;  (faicon folder)
             (abbreviate-file-name (eshell/pwd))
             '(:foreground "#88c0d0" :bold ultra-bold :underline t))

(esh-section esh-git
             "\xe907"  ;  (git icon)
             (magit-get-current-branch)
             '(:foreground "#A3BE8C"))

;; Separator between esh-sections
(setq esh-sep " ")  ; or " | "

;; Separator between an esh-section icon and form
(setq esh-section-delim " ")

;; Eshell prompt header
(setq esh-header "\n┌─")  ; or "\n┌─"

;; Eshell prompt regexp and string. Unless you are varying the prompt by eg.
;; your login, these can be the same.
(setq eshell-prompt-regexp " ")   ; or "└─> "
(setq eshell-prompt-string " ")   ; or "└─> "

;; Choose which eshell-funcs to enable
(setq eshell-funcs (list esh-dir esh-git))

;; Enable the new eshell prompt
(setq eshell-prompt-function 'esh-prompt-func)
;; end test

(use-package elfeed
  :ensure t)
  
(setq elfeed-feeds
      '("https://rubyweekly.com/rss/"
        "http://planet.emacsen.org/atom.xml"
        "http://sachachua.com/blog/feed/"
        "https://jamesclear.com/feed" 
        "https://this-week-in-rust.org/rss.xml"
        "http://endlessparentheses.com/atom.xml"))

(defun kill-other-buffers ()
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(spaceline-all-the-icons-sunrise-face ((t (:inherit powerline-active2 :foreground "#88c0d0"))))
 '(spaceline-all-the-icons-sunset-face ((t (:inherit powerline-active2 :foreground "dark cyan"))))
 '(spaceline-highlight-face ((t (:foreground "#ECEFF4" :background "#5E81AC")))))
