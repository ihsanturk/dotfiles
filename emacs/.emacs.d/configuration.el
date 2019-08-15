(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-compile
:config (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package gruvbox-theme
:config
(load-theme 'gruvbox t))

(use-package telephone-line
:config
(telephone-line-mode 1))

(setq inhibit-startup-screen t)

(setq c-set-style 'awk)
(setq-default cursor-type 'bar)
(set-window-scroll-bars (minibuffer-window) nil nil)

(set-default-font "Hack-18")
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)
(global-hl-line-mode 1)

(setq-default tab-width 4)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "M-o") 'other-window)
(setq backup-directory-alist `(("." . "~/.emacs.d/.backup")))

(use-package undo-tree
:config
(global-undo-tree-mode 1))

;; (use-package pdf-tools
;; :config
;; (pdf-tools-install)
;; (pdf-loader-install))
;; (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)

(use-package which-key
:ensure t
:config
(which-key-mode))

(use-package evil
:config
(evil-mode 1))

(use-package evil-surround
:config
(global-evil-surround-mode 1))

(use-package org-bullets
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(org-babel-do-load-languages
'org-babel-load-languages '((python . t)))

(use-package counsel
:bind
("M-x" . 'counsel-M-x)
("C-s" . 'swiper)

:config
(use-package flx)
(use-package smex)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-initial-inputs-alist nil)
(setq ivy-re-builders-alist
		'((swiper . ivy--regex-plus)
		(t . ivy--regex-fuzzy))))

(use-package markdown-mode
:ensure t
:commands (markdown-mode gfm-mode)
:mode (("README\\.md\\'" . gfm-mode)
		("\\.md\\'" . markdown-mode)
		("\\.markdown\\'" . markdown-mode))
:init (setq markdown-command "multimarkdown"))

(use-package company
  :config

  (defun company-semantic-setup ()
  "Configure company-backends for company-semantic and company-yasnippet."
  (delete 'company-irony company-backends)
  (push '(company-semantic :with company-yasnippet) company-backends))
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-backends (delete 'company-semantic company-backends))

  (require 'cc-mode)
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))


(use-package company-jedi
  :config

  (setq jedi:environment-root "jedi")
  (defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'jedi:install-server)
  (add-hook 'python-mode-hook 'company-jedi-setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup))

(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-+") 'hs-show-block)

(defun fold-def-all ()
  (require 'hs-minor-mode)
  (interactive)
  (goto-char 1)
  (while
	  (re-search-forward "^\s*def\s" nil t)
	  (hs-hide-block)))
