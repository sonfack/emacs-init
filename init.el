;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------


(require 'package)
(package-initialize)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t) 


;; php
(when (file-directory-p "~/php-mode-master")
  (load "~/php-mode-master/php-mode-autoloads.el"))

;; Any code below is *unnecessary*
;; (require 'php-mode)
;; (add-to-list 'load-path (expand-file-name "~/php-mode-master"))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))


;; jdee

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-server-dir "/home/sonfack/jdeeJars")
 '(python-shell-interpreter "python3")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

(autoload 'jde-mode "jde" "JDE mode" t)
  (setq auto-mode-alist
        (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

;; jedi setup
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                     
(setq jedi:complete-on-dot t) 

;; activate all packages 
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; define list of packages to install
(defvar myPackages
  '(better-defaults
    elpy ;; add the elpy package
    flycheck ;; add the flycheck package
    py-autopep8 ;;
    material-theme))



;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
(add-to-list 'load-path "~/Slime/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")


;; Emacs shell output buffer height

(defun shell-compile ()
  (interactive)
  (save-buffer)
  (shell-command (concat "python " (buffer-file-name)))
  (if (<= (* 2 (window-height)) (frame-height))
      (enlarge-window 20)
    nil))

(setq undo-outer-limit 1000000000)

;; Other settings 

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(global-visual-line-mode t);; enable good visualisation on long lines 
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
(elpy-enable)
(setq elpy-rpc-python-command "python3")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
