;; For installation, see
;; http://emacs.rubikitch.com/use-package-2/
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))


;; ==== builtin modes ====
(defalias 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8-unix)
(menu-bar-mode 0)
(windmove-default-keybindings)
(global-linum-mode t)
(setq linum-format "%4d  ")
(show-paren-mode t)
(setq indent-tabs-mode nil)
;; scroll line-by-line
(setq scroll-step 1
      scroll-conservatively 10000)


;; ==== third-party packages ====
(require 'use-package)

(use-package company
  :ensure t
  :config (global-company-mode t))

(use-package whitespace
  :config
  (setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  ;; Zenkaku space
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  (setq whitespace-action '(auto-cleanup))
  (global-whitespace-mode 1))

(use-package helm
  :ensure t
  :config
  (recentf-mode t)
  (helm-mode t)
  (global-set-key (kbd "C-f") 'helm-recentf)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x))

(use-package google-c-style
  :ensure t
  :config
  (add-hook 'c-mode-hook 'google-set-c-style)
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'd-mode-hook 'google-set-c-style))

(use-package d-mode
  :ensure t
  :init
  (use-package flycheck-dmd-dub
    :init
    (use-package flycheck :ensure t)
    (use-package f :ensure t)
    :load-path "~/repos/flycheck-dmd-dub")

  (use-package company-dcd
    :load-path "~/repos/company-dcd"
    :init
    (use-package yasnippet :ensure t)
    (use-package popwin :ensure t)
    (use-package cl-lib :ensure t)
    (use-package ivy :ensure t)
    :config
    (setq company-dcd-client-executable "~/repos/DCD/bin/dcd-client")
    (setq company-dcd-server-executable "~/repos/DCD/bin/dcd-server"))

  :config
  (add-hook 'd-mode-hook 'google-set-c-style)
  (add-hook 'd-mode-hook 'company-dcd-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm d-mode google-c-style ivy popwin yasnippet company f flycheck use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
