(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t
      use-package-always-defer t)

(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

(defun open-conf ()
  (interactive)
  (find-file "~/.emacs"))

(defun path-cons (dir)
  (interactive "sDirectory to add? ")
  (setenv "PATH" (concat dir (getenv "PATH")))
  (setq exec-path (cons dir exec-path)))

(use-package emacs
  :bind (("C-=" . text-scale-increase)
         ("C--" . text-scale-decrease)
         ("C-c r" . reload)
         ("C-c c" . open-conf)
	 ("C-c i" . ibuffer)
	 ("C-c s" . eshell)
	 ("C-c w w" . delete-window)
	 ("C-c w o" . delete-other-windows)
	 ("C-c w s" . split-window-right)
	 ("C-c w v" . split-window-below))
  :hook (emacs-startup . (lambda () (message "(%s %d)"
					     (format "%.2f"
						     (float-time
						      (time-subtract after-init-time before-init-time)))
					     gcs-done)))
  :config (setq truncate-lines t
                inhibit-startup-echo-area-message t
                inhibit-startup-message t
		dired-use-ls-dired nil)

          (when (eq system-type 'darwin)
            (path-cons "/opt/homebrew/bin")
            (path-cons "/opt/homebrew/opt/openjdk/bin"))
          (path-cons (concat (getenv "HOME") "/bin"))
	  
          (menu-bar-mode -1)
          (tool-bar-mode -1)
          (scroll-bar-mode -1)

          (global-display-line-numbers-mode 1)
          (global-visual-line-mode 1)
          (column-number-mode)

          (load-theme 'modus-vivendi)

          (server-start))

(use-package org
  :hook ((org-mode . org-indent-mode))
  :config (setq org-edit-src-content-indentation 0))
(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))
(autoload 'org-tempo "org-tempo" t nil)
(use-package org-drill)

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (ielm-mode . enable-paredit-mode)
         (lisp-interaction-mode . enable-paredit-mode)
         (eval-expression-minibuffer-setup . enable-paredit-mode)
         (org-mode . enable-paredit-mode)))

(use-package magit
  :bind ("C-x C-u" . magit-status))
(use-package esup :config (setq esup-depth 0))

(use-package god-mode
  :bind ("<escape>" . god-mode-all)
  :config (setq god-exempt-major-modes nil
	        god-exempt-predicates nil ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(god-mode esup magit paredit org-drill toc-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
