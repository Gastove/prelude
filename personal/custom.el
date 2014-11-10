(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("fc6e906a0e6ead5747ab2e7c5838166f7350b958d82e410257aeeb2820e8a07a" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" default)))
 '(fci-rule-color "#383838")
 '(safe-local-variable-values (quote ((project-venv-name . "mashboard"))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ff-directory ((t (:background "gray0" :foreground "DarkRed"))))
 '(helm-selection ((t (:background "gray14"))))
 '(helm-source-header ((t (:background "DarkOrange4" :foreground "white" :weight bold :height 1.3 :family "Sans Serif")))))

;; Pull in custom packages
(prelude-require-packages '(jade-mode
                            ess
                            twittering-mode
                            floobits
                            sublime-themes
                            company
                            virtualenvwrapper
                            org
                            protobuf-mode
                            jedi
                            ensime
                            web-mode
                            thrift
                            ag
                            malabar-mode
                            polymode))

;; Pull in all my personal bits and bobs from external files
(defvar load-personal-config-list)
(setq load-personal-config-list '("/jsl-checker.el"
                                  "/jsx-configs.el"
                                  "/work.el"            ;; Contains work erc configs too.
                                  "/python-configs.el"
                                  "/erc-configs.el"
                                  "/ess-configs.el"
                                  "/jsx-configs.el"
                                  "/web-mode-configs.el"))

(mapc (lambda (rmd-file-name)
        (load (concat prelude-personal-dir rmd-file-name)))
      load-personal-config-list)

;;; Whitespace Mode
;; Disable whitespace-mode in certain other major modes
(add-hook 'org-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'markdown-mode-hook (lambda () (whitespace-mode -1)))

;;; Tweak Mac Keyboard Behavior
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;; Projectile
(setq projectile-remember-window-configs t)
(setq projectile-switch-project-action 'projectile-dired)
(global-set-key (kbd "s-p") 'projectile-switch-projec)

;;; Twittering-mode
(setq twittering-icon-mode t)
(setq twittering-use-master-password t)
(setq twittering-use-icon-storage t)

;;; Company-mode
;; errwhrr
(add-hook 'global-init-hook 'global-company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(setq company-idle-delay .3)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 20)
(global-set-key (kbd "TAB") 'company-complete)

;;; Go Configs
;; Totally re-enable these if you ever do Go again.
;; (let ((go-path (getenv "GOPATH")))
;;   (load (concat go-path "/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")))

;; Smartparens all the time
(smartparens-global-mode t)
(sp-local-pair 'org-mode "~" "~")
(sp-local-pair 'org-mode "/" "/")
(sp-local-pair 'org-mode "*" "*")

;;; Support for Marked.app -- assumes you're on a Mac,
;;; and have Marked.app installed.
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name))))
  )
(global-set-key (kbd "C-c m") 'markdown-preview-file)

;;; yasnippet
(yas-global-mode 1)

;; Tell yas to use system autocomplete instead of an f'ed-up X window:
(setq yas-prompt-functions '(yas-completing-prompt))

;;; Malabar Mode for the Jabbas
 ;;; Malabar Mode for the Jabbas
(require 'cedet)
(require 'semantic)
(load "semantic/loaddefs.el")
(semantic-mode 1);;
(require 'malabar-mode)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;;; Org Mode
;; Support for Babel Mode code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp .t)
   (clojure . t)
   (bash . t)))

;; Config org export backends
(setq org-export-backends
      `(beamer
        ascii
        markdown
        deck))

;; polymode
(add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode))

;; Hide org emphasis marks
(setq org-hide-emphasis-markers t)

;; Start indented
(setq org-startup-indented t)
(setq org-startup-folded nil)

;; Stop folding. Just... stop.
(setq org-startup-folded nil)

;;; Scala
;; Ensime
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;; Polymode for markdown
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . poly-markdown-mode))

(provide 'custom)

;;; custom.el ends here
