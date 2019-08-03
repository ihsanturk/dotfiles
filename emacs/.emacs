(package-initialize)

(load-theme 'gruvbox t)
(global-hl-line-mode 1)
(global-linum-mode 1)
(set-default-font "Hack-11")
(global-set-key (kbd "M-x") 'smex)
(ido-mode 1)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)

(pdf-tools-install)
(pdf-loader-install)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")))
(setq-default cursor-type 'bar)
(setq linum-format "%3d ")
(setq inhibit-startup-screen t)
(setq c-set-style 'awk)
(setq backup-directory-alist `(("." . "~/.saves")))
