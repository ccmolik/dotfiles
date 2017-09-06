(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-eldoc yaml-mode fiplr go-mode exec-path-from-shell rebecca-theme auto-complete rbenv web-mode go-autocomplete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (setq compile-command "go build -v && go test -v && go vet")
  (add-hook 'before-save-hook 'gofmt-before-save)
    (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode-setup)
(load-theme #'rebecca t)
(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(require 'rbenv)
(global-rbenv-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
; ------------------------------------------
; => fiplr
; ------------------------------------------
(unless (package-installed-p 'fiplr)
  (package-refresh-contents)
  (package-install 'fiplr))
(global-set-key (kbd "M-p") 'fiplr-find-file)
(global-set-key (kbd "M-y") 'fiplr-clear-cache)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(load "server")
(unless (server-running-p) (server-start))






