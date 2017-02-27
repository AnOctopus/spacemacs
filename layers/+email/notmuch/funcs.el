;;; funcs.el --- notmuch Layer functions File for Spacemacs
;;
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun notmuch/notmuch-toggle-delete nil
  "toggle deleted tag for message"
  (interactive)
  (notmuch-show-tag (list "-unread"))
  (notmuch-show-tag (list "-inbox"))
  (if (member "deleted" (notmuch-show-get-tags))
      (notmuch-show-tag (list "-deleted"))
    (notmuch-show-tag (list "+deleted"))))

(defun notmuch/notmuch-toggle-delete-search nil
  "toggle delete tag for message"
  (interactive)
  (notmuch-search-tag (list "-unread"))
  (notmuch-search-tag (list "-inbox"))
  (if (member "deleted" (notmuch-search-get-tags))
      (notmuch-search-tag (list "-deleted"))
    (notmuch-search-tag (list "+deleted")))
  (next-line))
