;;; rhombus-theme.el --- A black theme for Emacs 24

;; Copyright (C) 2015 Ross Donaldson

;; Author: Ross Donaldson <gastove@gmail.com>
;; URL: https://github.com/Gastove/rhombus
;; Version 1.0.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Credits:

;; This theme inspired by (and based heavily on) badger-theme.el by Cody
;; Canning, and flatland-back-theme, (which was auto-generated by, as best as I
;; can tell, Jason Milkins). The structure of this theme was based on
;; zenburn-theme.el by Bozhidar Batsov

;;; Code:
(deftheme rhombus "The Rhombus color theme")

(require 'color)

;; Rhombus Color Palette
(defvar rhombus-colors-alist
  '(("rhombus-fg"             . "#FFF5EB")
    ("rhombus-fg+1"           . "#FBF9F3")
    ("rhombus-bg"             . "#000000")
    ("rhombus-bg+1"           . "#171717")
    ("rhombus-bg+2"           . "#424242")

    ;; The Main Pallette
    ("rhombus-dark-red"       . "#9e1200")
    ("rhombus-dull-red"       . "#9e4d4a")
    ("rhombus-red"            . "#Ff2600")
    ("rhombus-bronze"         . "#D79600")
    ("rhombus-orange"         . "#fa9a4b")
    ("rhombus-orange-1"       . "#D84c00")
    ("rhombus-orange+1"       . "#Ff5d00")
    ("rhombus-yellow"         . "#D6d300")
    ("rhombus-purple"         . "#932092")
    ("rhombus-berry"          . "#3D002E")
    ("rhombus-violet"         . "#A630db")
    ("rhombus-violet-1"       . "#635770")
    ("rhombus-violet-2"       . "#433F4F")
    ("rhombus-violet+1"       . "#Ff87c1")
    ("rhombus-red-violet"     . "#9e3564")
    ("rhombus-pink"           . "#D82e88")
    ("rhombus-off-white"      . "#FFE0B2")
    ("rhombus-charcoal"       . "#656868")
    ("rhombus-grey"           . "#Bbbbbb")
    ("rhombus-dark-brown"     . "#9d5717")
    ("rhombus-light-brown"    . "#Fff59f")

    ;; Backup-dancing colors
    ("rhombus-green"          . "#006400")
    ("rhombus-blue"           . "#6495ed")
    ("rhombus-teal"           . "#65A399")
    ("rhombus-sand"           . "#C7B299")


    ;; Other People's Good Ideas
    ("rhombus-link"           . "#8ACDAA")
    ("rhombus-warn"           . "#Ff2600")
    ("rhombus-succ"           . "#9d5717")
    ("rhombus-hl"             . "#1D1D1D")))

;; Testing utility. Leave commented; C-x C-e to unbind the alist so eval-buffer
;; picks up changes
;; (makunbound 'rhombus-colors-alist)

;; This is seriously cool. H/T to whoever came up with it! Helpful hint: it was
;; not me. I got it from badger-theme.el
(defmacro rhombus/with-color-variables (&rest body)
  "`let' bind all colors defined in `badger-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   rhombus-colors-alist))
     ,@body))

(rhombus/with-color-variables
  (custom-theme-set-faces
   'rhombus

   ;; >>>>> Built-in
   '(button ((t (:underline t))))
   `(link ((t (:bold t :foreground ,rhombus-blue :underline t :weight bold))))
   ;; `(link-visited ((t (:foreground ,rhombus-grey-2 :underline t :weight normal))))

   ;; ordinary text. Its background color is used as the frame's background color.
   `(default ((t (:foreground ,rhombus-fg :background ,rhombus-bg :font "DejaVu Sans Mono"))))

   ;;The :background attribute of this face specifies the color of the text cursor
   `(cursor ((t (:background ,rhombus-grey))))

   `(shadow ((t (:foreground ,rhombus-charcoal))))

   ;; The face for displaying control characters and escape sequences
   `(escape-glyph ((t (:foreground ,rhombus-grey :bold t))))

   ;; The face for the narrow fringes to the left and right of windows on graphic displays.
   `(fringe ((t (:foreground ,rhombus-fg :background ,rhombus-bg+1))))

   ;;text highlighting in various contexts, when the mouse cursor is moved over a hyperlink.
   `(highlight ((t (:background ,rhombus-hl))))

   ;; “lazy matches” for Isearch and Query Replace (matches other than the current one).
   `(lazy-highlight ((t (:background ,rhombus-dull-red :foreground ,"black" :weight extra-bold))))

   ;; This face is used to highlight the current Isearch match
   `(isearch ((t (:background ,rhombus-bronze :foreground ,"black" :weight extra-bold))))

   `(success ((t (:foreground ,rhombus-succ :weight bold))))
   `(warning ((t (:foreground ,rhombus-warn :weight bold))))

   ;; This face is used for displaying an active region
   `(region ((t (:background ,rhombus-bg+1))))

   `(show-paren-match-face ((t (:background ,rhombus-orange-1 :foreground ,"black" ))))

   ;; >>>>> mode-line
   `(mode-line    ((,class (:foreground ,rhombus-violet
                                        :background ,rhombus-berry))
                   (t :inverse-video nil)))

   `(mode-line-inactive ((t (:background ,rhombus-bg+1 :foreground ,rhombus-violet-2 :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,rhombus-grey))))
   `(minibuffer-prompt ((t (:foreground ,rhombus-violet))))


   `(mode-line-highlight ((t (:foreground ,rhombus-red))))

   ;; linum
   `(linum ((t (:foreground ,rhombus-charcoal :background ,"black"))))


   ;; >>>>> font-lock
   `(font-lock-warning-face ((t (:foreground ,rhombus-warn :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,rhombus-orange+1))))
   `(font-lock-variable-name-face ((t (:foreground ,rhombus-red-violet))))
   `(font-lock-keyword-face ((t (:foreground ,rhombus-blue))))
   `(font-lock-comment-face ((t (:foreground ,rhombus-charcoal))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,rhombus-violet-2 :weight light :slant italic))))
   `(font-lock-type-face ((t (:foreground ,rhombus-pink))))
   `(font-lock-constant-face ((t (:foreground ,rhombus-purple))))
   `(font-lock-builtin-face ((t (:foreground ,rhombus-dull-red))))
   `(Font-lock-preprocessor-face ((t (:foreground ,rhombus-bronze))))
   `(font-lock-string-face ((t (:foreground ,rhombus-grey))))
   `(font-lock-doc-face ((t (:foreground ,rhombus-dark-brown))))
   `(font-lock-negation-char-face ((t (:foreground ,rhombus-yellow :weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,rhombus-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,rhombus-green :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))

   ;; >>>>> eshell
   `(eshell-prompt ((t (:foreground ,rhombus-green))))
   `(eshell-ls-archive ((t (:foreground ,rhombus-orange :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,rhombus-violet :weight normal))))
   `(eshell-ls-executable ((t (:foreground ,rhombus-yellow :weight normal))))
   `(eshell-ls-unreadable ((t (:foreground ,rhombus-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,rhombus-blue :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,rhombus-link :weight bold))))

   ;;------------------------------- Org Mode ----------------------------------
   `(org-document-info-keyword ((t (:foreground ,rhombus-purple))))
   `(org-document-title ((t (:foreground ,rhombus-grey :height 1.50))))
   `(org-archived ((t (:foreground ,rhombus-fg :weight bold))))
   `(org-checkbox ((t (:foreground ,rhombus-fg+1 :foreground ,rhombus-sand
                                   :box (:line-width 1 :style released-button)))))
   `(org-done ((t (:foreground ,rhombus-dark-brown :strike-through t))))
   `(org-todo ((t (:foreground ,rhombus-light-brown :bolt t))))
   `(org-formula ((t (:foreground ,rhombus-violet))))
   `(org-headline-done ((t (:strike-through t :foreground ,rhombus-charcoal))))
   `(org-hide ((t (:foreground ,rhombus-bg))))
   `(org-level-1 ((t (:foreground ,rhombus-violet))))
   `(org-level-2 ((t (:foreground ,rhombus-violet+1))))
   `(org-level-3 ((t (:foreground ,rhombus-orange-1))))
   `(org-level-4 ((t (:foreground ,rhombus-yellow))))
   `(org-level-5 ((t (:foreground ,rhombus-grey))))
   `(org-level-6 ((t (:foreground ,rhombus-green))))
   `(org-level-7 ((t (:foreground ,rhombus-dark-brown))))
   `(org-level-8 ((t (:foreground ,rhombus-teal))))
   `(org-link ((t (:foreground ,rhombus-link :underline t))))
   `(org-agenda-date ((t (:foreground ,rhombus-blue))))
   `(org-deadline-announce ((t (:foreground ,rhombus-dark-red))))
   `(org-date ((t (:foreground ,rhombus-purple :underline t))))
   `(org-agenda-date-today  ((t (:foreground ,rhombus-grey :weight light :slant italic))))
   `(org-agenda-structure  ((t (:inherit font-lock-comment-face))))
   `(org-scheduled ((t (:foreground ,rhombus-green))))
   `(org-scheduled-previously ((t (:foreground ,rhombus-red))))
   `(org-scheduled-today ((t (:foreground ,rhombus-blue))))
   `(org-sexp-date ((t (:foreground ,rhombus-blue :underline t))))
   `(org-time-grid ((t (:foreground ,rhombus-orange))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-special-keyword ((t (:foreground ,rhombus-charcoal :weight normal))))
   `(org-table ((t (:foreground ,rhombus-orange))))
   `(org-tag ((t (:bold t :foreground ,rhombus-orange :strike-through nil))))
   `(org-warning ((t (:bold t :foreground ,rhombus-pink :weight bold))))
   `(org-column ((t (:background ,"black"))))
   `(org-column-title ((t (:background ,"black" :foreground ,rhombus-green :underline t))))
   `(org-mode-line-clock ((t (:foreground ,rhombus-yellow))))
   `(org-footnote ((t (:foreground ,rhombus-link :underline t))))
   `(org-code ((t (:foreground ,rhombus-orange+1))))
   `(org-verbatim ((t (:inherit org-code))))

   ;; >>>>> message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,rhombus-purple))))
   `(message-header-other ((t (:foreground ,rhombus-violet))))
   `(message-header-to ((t (:foreground ,rhombus-pink :weight bold))))
   `(message-header-from ((t (:foreground ,rhombus-violet-2 :weight bold))))
   `(message-header-cc ((t (:foreground ,rhombus-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,rhombus-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,rhombus-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,rhombus-green))))
   `(message-mml ((t (:foreground ,rhombus-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))

   ;; >>>>> mu4e
   `(mu4e-cited-1-face ((t (:foreground ,rhombus-violet :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,rhombus-violet-1 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,rhombus-violet :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,rhombus-violet-1   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,rhombus-violet  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,rhombus-violet-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,rhombus-violet    :slant italic))))
   `(mu4e-unread-face ((t (:foreground ,rhombus-orange :bold t))))
   `(mu4e-replied-face ((t (:foreground ,rhombus-dark-brown))))
   `(mu4e-moved-face ((t (:foreground ,rhombus-bronze))))
   `(mu4e-trashed-face ((t (:foreground ,rhombus-dull-red :strike-through t))))
   `(mu4e-header-highlight-face ((t (:background ,rhombus-hl :underline t))))

   ;; >>>>> elpy and ipython
   `(highlight-indentation-face ((t (:background ,rhombus-bg))))
   `(comint-highlight-prompt ((t (:inherit eshell-prompt))))

   ;; >>>>> auto-complete and popup
   `(ac-candidate-face ((t (:background ,rhombus-sand :foreground ,"black"))))
   `(ac-selection-face ((t (:background ,rhombus-violet :foreground ,"black"))))
   `(popup-tip-face ((t (:background ,rhombus-sand :foreground ,"black"))))
   `(popup-scroll-bar-foreground-face ((t (:background ,rhombus-violet-1))))
   `(popup-scroll-bar-background-face ((t (:background ,rhombus-green))))
   `(popup-isearch-match ((t (:background ,rhombus-yellow :foreground ,"black"))))

   ;; >>>>> smart-mode-line
   `(sml/global ((t (:background ,rhombus-bg :inverse-video nil))))
   `(sml/folder ((t (:foreground ,rhombus-charcoal))))
   `(sml/filename ((t (:foreground ,rhombus-grey :weight normal))))
   `(sml/prefix   ((t (:foreground ,rhombus-grey :weight normal))))
   `(sml/line-number ((t (:foreground ,rhombus-blue :weight normal))))
   `(sml/col-number ((t (:foreground ,rhombus-violet-1 :weight normal))))
   `(sml/read-only ((t (:foreground ,rhombus-charcoal))))
   `(sml/outside-modified ((t (:foreground ,rhombus-dark-red))))
   `(sml/modified ((t (:foreground ,rhombus-red))))
   `(sml/remote ((t (:foreground ,rhombus-charcoal))))
   `(sml/numbers-separator ((t (:foreground ,rhombus-charcoal))))
   `(sml/client ((t (:foreground ,rhombus-succ))))
   `(sml/not-modified ((t (:foreground ,rhombus-yellow))))
   `(sml/git  ((t (:foreground ,rhombus-bronze))))
   `(sml/vc-edited  ((t (:foreground ,rhombus-warn))))
   `(sml/modes ((t (:foreground ,rhombus-violet+1))))
   `(sml/position-percentage ((t (:foreground ,rhombus-charcoal))))

   ;;-------------------------------Jabber-Mode--------------------------------
   `(jabber-roster-user-away ((t (:foreground ,rhombus-dark-brown))))
   `(jabber-roster-user-online ((t (:foreground ,rhombus-green))))
   `(jabber-roster-user-dnd ((t (:foreground ,rhombus-red))))
   `(jabber-rare-time-face ((t (:foreground ,rhombus-charcoal))))
   `(jabber-chat-prompt-local ((t (:foreground ,rhombus-orange))))
   `(jabber-chat-text-local ((t (:foreground ,rhombus-orange-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,rhombus-purple))))
   `(jabber-activity-face((t (:foreground ,rhombus-red))))
   `(jabber-activity-personal-face ((t (:foreground ,rhombus-blue))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))

   ;;--------------------------------- dired -----------------------------------
   `(dired-directory ((t (:foreground ,rhombus-dark-brown :weight normal))))
   `(dired-flagged ((t (:foreground ,rhombus-warn))))
   `(dired-header ((t (:foreground ,rhombus-bg+1 :background ,rhombus-berry))))
   `(dired-ignored ((t (:inherit shadow))))
   `(dired-mark ((t (:foreground ,rhombus-bronze :weight bold))))
   `(dired-marked ((t (:foreground ,rhombus-orange :weight bold))))
   `(dired-perm-write ((t (:foreground ,rhombus-fg+1 :underline t))))
   `(dired-symlink ((t (:foreground ,rhombus-purple :background ,rhombus-bg+1 :weight bold))))
   `(dired-warning ((t (:inherit warning :underline t))))

   ;;------------------------------ dired-async --------------------------------
   ;; `(dired-async-message ((,class (:background ,(if (eq variant 'light) yellow-l yellow) ))))
   ;; `(dired-async-mode-message
     ;; ((,class (:background ,(if (eq variant 'light) red-l red) ))))

   ;;------------------------------- dired-efap --------------------------------
   ;; `(dired-efap-face ((,class (:box nil
                                    ;; :background ,base02
                                    ;; :foreground ,base1
                                    ;; :underline ,s-line
                                    ;; :weight bold))))

   ;;-----------------------------------Erc-------------------------------------
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,rhombus-red :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,rhombus-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,rhombus-orange-1))))
   `(erc-keyword-face ((t (:foreground ,rhombus-purple :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,rhombus-orange :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,rhombus-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,rhombus-violet-2))))
   `(erc-pal-face ((t (:foreground ,rhombus-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,rhombus-orange :background ,rhombus-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,rhombus-charcoal))))
   `(erc-underline-face ((t (:underline t))))

   ;;--------------------------------FlyCheck-----------------------------------
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rhombus-red) :inherit unspecified))
      (t (:foreground ,rhombus-red :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rhombus-yellow) :inherit unspecified))
      (t (:foreground ,rhombus-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,rhombus-light-brown) :inherit unspecified))
      (t (:foreground ,rhombus-light-brown :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,rhombus-red :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,rhombus-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,rhombus-light-brown :weight bold))))

   ;; >>>>> FlySpell
   `(flyspell-incorrect ((t (:underline (:color ,rhombus-red :style wave)))))
   `(flyspell-duplicate ((t (:underline (:color ,rhombus-yellow :style wave)))))

   ;; >>>>> Company Mode
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name rhombus-bg+1 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name rhombus-bg+1 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name rhombus-bg+1 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))

   ;;---------------------------------- helm -----------------------------------
   `(helm-header
     ((t (:foreground ,rhombus-charcoal
                      :background ,rhombus-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:background ,rhombus-berry
                      :foreground ,rhombus-fg
                      :weight bold
                      :underline nil
                      :box (:line-width -1 :style released-button)
                      :height 1.3
                      :family "Sans Serif"))))
   `(helm-selection ((t (:background ,rhombus-hl :underline nil))))
   `(helm-selection-line ((t (:background ,rhombus-bg+1))))
   `(helm-visible-mark ((t (:foreground ,rhombus-bg :background ,rhombus-orange-1))))
   `(helm-candidate-number ((t (:foreground ,rhombus-green :background ,rhombus-bg))))
   `(helm-separator ((t (:foreground ,rhombus-red :background ,rhombus-bg))))
   `(helm-time-zone-current ((t (:foreground ,rhombus-green :background ,rhombus-bg))))
   `(helm-time-zone-home ((t (:foreground ,rhombus-red :background ,rhombus-bg))))
   ;;   `(helm-bookmark-addressbook ((t (:foreground ,rhombus-orange :background ,rhombus-bg))))
   ;;   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   ;;   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   ;;   `(helm-bookmark-gnus ((t (:foreground ,rhombus-magenta :background ,rhombus-bg))))
   ;;   `(helm-bookmark-info ((t (:foreground ,rhombus-green+2 :background ,rhombus-bg))))
   ;;   `(helm-bookmark-man ((t (:foreground ,rhombus-yellow :background ,rhombus-bg))))
   ;;   `(helm-bookmark-w3m ((t (:foreground ,rhombus-magenta :background ,rhombus-bg))))
   ;;   `(helm-buffer-not-saved ((t (:foreground ,rhombus-red :background ,rhombus-bg))))
   ;;   `(helm-buffer-process ((t (:foreground ,rhombus-cyan :background ,rhombus-bg))))
   ;;   `(helm-buffer-saved-out ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))
   ;;   `(helm-buffer-size ((t (:foreground ,rhombus-fg-1 :background ,rhombus-bg))))
   `(helm-ff-directory ((t (:inherit 'dired-directory))))
   `(helm-ff-dotted-directory ((nil (:foreground nil :background nil :inherit 'helm-ff-directory))))
   `(helm-ff-file ((t (:foreground ,rhombus-fg :background ,rhombus-bg+1 :weight normal))))
   `(helm-ff-executable ((t (:foreground ,rhombus-violet :background ,rhombus-orange :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,rhombus-warn :background ,rhombus-bg+1 :weight bold))))
   `(helm-ff-symlink ((t (:inherit dired-symlink))))
   `(helm-ff-prefix ((t (:foreground ,rhombus-bg :background ,rhombus-red-violet :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,rhombus-orange :background ,rhombus-bg))))
   `(helm-grep-file ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))
   `(helm-grep-finish ((t (:foreground ,rhombus-green :background ,rhombus-bg))))
   `(helm-grep-lineno ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,rhombus-blue :background ,rhombus-bg))))
   ;;   `(helm-moccur-buffer ((t (:foreground ,rhombus-cyan :background ,rhombus-bg))))
   ;;   `(helm-mu-contacts-address-face ((t (:foreground ,rhombus-fg-1 :background ,rhombus-bg))))
   ;;   `(helm-mu-contacts-name-face ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))


   ;; >>>>> Magit
   `(magit-item-highlight ((t (:background ,rhombus-violet-2))))
   `(magit-section-title ((t (:foreground ,rhombus-orange :weight bold))))
   `(magit-process-ok ((t (:foreground ,rhombus-succ :weight bold))))
   `(magit-process-ng ((t (:foreground ,rhombus-warn :weight bold))))
   `(magit-branch ((t (:foreground ,rhombus-violet :weight bold))))
   `(magit-log-author ((t (:foreground ,rhombus-purple))))
   `(magit-log-sha1 ((t (:foreground ,rhombus-yellow))))
   `(magit-diff-add ((t (:background ,rhombus-green))))
   `(magit-diff-remove ((t (:background ,rhombus-dull-red))))

   ;; Perspective
   `(persp-selected-face ((t (:foreground ,rhombus-light-brown :inherit mode-line))))

   ;; >>>>> whitespace-mode
   ;; `(whitespace-space ((t (:background ,rhombus-bg+1 :foreground ,rhombus-bg+1))))
   ;; `(whitespace-hspace ((t (:background ,rhombus-bg+1 :foreground ,rhombus-bg+1))))
   ;; `(whitespace-tab ((t (:background ,rhombus-red-1))))
   ;; `(whitespace-newline ((t (:foreground ,rhombus-bg+1))))
   ;; `(whitespace-trailing ((t (:background ,rhombus-red))))
   ;; `(whitespace-line ((t (:background ,rhombus-bg :foreground ,rhombus-magenta))))
   ;; `(whitespace-space-before-tab ((t (:background ,rhombus-orange :foreground ,rhombus-orange))))
   ;; `(whitespace-indentation ((t (:background ,rhombus-yellow :foreground ,rhombus-red))))
   ;; `(whitespace-empty ((t (:background ,rhombus-yellow))))
   ;; `(whitespace-space-after-tab ((t (:background ,rhombus-yellow :foreground ,rhombus-red))))

   ))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rhombus)

;;; rhombus-theme.el ends here
