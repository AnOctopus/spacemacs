;;; packages.el --- notmuch Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq notmuch-packages
      '(
        notmuch
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
      (setq-default
       user-mail-address "amanda@amandawalker.io"
       user-full-name "Amanda Walker"
       message-send-mail-function 'message-send-mail-with-sendmail))))
