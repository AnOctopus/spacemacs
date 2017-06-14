;;; packages.el --- notmuch Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq notmuch-packages
      '(
        notmuch
        smtpmail
        ))

(defun notmuch/init-notmuch ()
  (use-package notmuch
    :commands notmuch
    :init
    (spacemacs/set-leader-keys "a n" 'notmuch)
    :config
    (progn
      (evilified-state-evilify-map notmuch-common-keymap)
      (evilified-state-evilify notmuch-hello-mode notmuch-hello-mode-map)
      (evilified-state-evilify notmuch-show-mode notmuch-show-stash-map)
      (evilified-state-evilify notmuch-show-mode notmuch-show-part-map)
      (evilified-state-evilify notmuch-show-mode notmuch-show-mode-map
        (kbd "d") #'notmuch/notmuch-toggle-delete)

      (evilified-state-evilify notmuch-tree-mode notmuch-tree-mode-map)
      (evilified-state-evilify notmuch-search-mode notmuch-search-mode-map
        (kbd "d") #'notmuch/notmuch-toggle-delete-search)
      ))
  (use-package smtpmail
    :defer t
    :ensure t
    :config
    (setq
     user-mail-address "amanda@amandawalker.io"
     user-full-name "Amanda Walker"
     message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587)))
