;; init.el configuration file
;; Initial version : 0.1
;; Created on 24-Oct-2020
;; -- RAMESH
;; --------------------------------

;; Remove startup message
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

;;(menu-bar-mode -1)            ; Disable the menu bar

; Set up the visible bell
(setq visible-bell t)

;; font settings 
(set-face-attribute 'default nil :font "Monaco" :height 100)

;;Load theme 
(load-theme 'wombat)



;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(package-selected-packages
   '(gruvbox-theme spacemacs-theme org-bullets org-easy-img-insert org-attach-screenshot command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; My Org Mode configuration
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'emacs-orgmode-config)
(require 'ox)  

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; ;; GLOBAL Keybindings that can be added to .emacs
;; (global-set-key [f4] 'org-capture)
;; (global-set-key [f5] '(lambda () (interactive)(find-file "~/org/mygtd.org")))
;; (global-set-key [f6] 'org-todo-list)
;; ;; (global-set-key [f7] 'org-agenda)


(setq org-log-done nil) 
(setq org-startup-truncated nil)

(setq org-directory (expand-file-name "~/MyOrgSpace"))
(setq org-default-notes-file (concat org-directory "/mygtd.org"))
(setq org-agenda-files '("~/MyOrgSpace" "~/MyOrgSpace/www/org" "~/MyOrgSpace/xwww/_org"))


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Remove the formatting symbols like ** for Bold
 (setq org-hide-emphasis-markers t)


;; Org export options
'(org-file-apps
    (quote
      ((auto-mode . emacs)
      ("\\.mm\\'" . default)
      ("\\.x?html?\\'" . "/usr/bin/firefox %s")
      ("\\.pdf\\'" . default))))

;; Remove validation in html through org-export

(setq org-html-validation-link nil)
