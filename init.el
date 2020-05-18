;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------


(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t) 

;; Initializes the package infrastructure
(package-initialize)


;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; Enable elpy
(elpy-enable)


;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(global-flycheck-mode);; start flycheck on any language


;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; Magit key binding
(global-set-key (kbd "C-x g") 'magit-status)





;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Other settings 

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(global-visual-line-mode t);; enable good visualisation on long lines 
(setq linum-format "%4d \u2502 ")  ;; format line number spacing


;; Emacs shell output buffer height
(defun shell-compile ()
  (interactive)
  (save-buffer)
  (shell-command (concat "python " (buffer-file-name)))
  (if (<= (* 2 (window-height)) (frame-height))
      (enlarge-window 20)
    nil))
(setq undo-outer-limit 1000000000)


;; Jedi : Python autocompletion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 


;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)



;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck jedi yafolding py-autopep8 material-theme magit macrostep jdee elpy better-defaults))))
