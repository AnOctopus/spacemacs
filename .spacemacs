;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
    "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
    (setq-default
        ;; Base distribution to use. This is a layer contained in the directory
        ;; `+distribution'. For now available distributions are `spacemacs-base'
        ;; or `spacemacs'. (default 'spacemacs)
        dotspacemacs-distribution 'spacemacs
        ;; Lazy installation of layers (i.e. layers are installed only when a file
        ;; with a supported type is opened). Possible values are `all', `unused'
        ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
        ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
        ;; lazy install any layer that support lazy installation even the layers
        ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
        ;; installation feature and you have to explicitly list a layer in the
        ;; variable `dotspacemacs-configuration-layers' to install it.
        ;; (default 'unused)
        dotspacemacs-enable-lazy-installation 'unused
        ;; If non-nil then Spacemacs will ask for confirmation before installing
        ;; a layer lazily. (default t)
        dotspacemacs-ask-for-lazy-installation t
        ;; If non-nil layers with lazy install support are lazy installed.
        ;; List of additional paths where to look for configuration layers.
        ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
        dotspacemacs-configuration-layer-path '()
        ;; List of configuration layers to load.
        dotspacemacs-configuration-layers
        '(
             auto-completion
             colors
             command-log
             dap
             docker
             emacs-lisp
             (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
             fasd
             git
             graphviz
             (haskell :variables
                 haskell-completion-backend 'lsp)
             html
             latex
             (lsp :variables
                 lsp-print-io t
                 lsp-print-performance t
                 company-lsp-cache-candidates 'auto
                 lsp-pyls-server-command '("pyls" "-vv" "--log-file" "pyls.log")
                 )
             markdown
             (mu4e :variables
                 mu4e-enable-mode-line t
                 mu4e-use-maildirs-extension t
                 mu4e-maildir "~/maildir"
                 mu4e-get-mail-command "mbsync -a"
                 mu4e-update-interval 300
                 mu4e-context-policy 'pick-first
                 message-send-mail-function 'message-send-mail-with-sendmail
                 mu4e-hide-index-messages t
                 mu4e-change-filenames-when-moving t
                 mu4e-confirm-quit nil
                 mu4e-index-update-error-warning nil
                 )
             ;; no-dots
             org
             (python :variables
                 python-backend 'lsp
                 lsp-pyls-plugins-pyflakes-enabled nil
                 lsp-pyls-plugins-rope-completion-enabled nil
                 lsp-pyls-plugins-yapf-enabled nil
                 lsp-pyls-plugins-jedi-completion-include-params nil
                 ;; lsp-pyls-plugins-pylint-enabled t
                 lsp-pyls-plugins-mccabe-enabled nil
                 )
             shell
             shell-scripts
             ;; flyspell is a surprisingly bad cpu/memory hog
             ;; spell-checking
             syntax-checking
             terraform
             (version-control :variables version-control-diff-tool 'git-gutter)
             yaml
             )
        ;; List of additional packages that will be installed without being
        ;; wrapped in a layer. If you need some configuration for these
        ;; packages, then consider creating a layer. You can also put the
        ;; configuration in `dotspacemacs/user-config'.
        dotspacemacs-additional-packages
        '(
             context-coloring
             darktooth-theme
             rainbow-blocks
             )
        ;; A list of packages that cannot be updated.
        dotspacemacs-frozen-packages '()
        ;; A list of packages that will not be installed and loaded.
        dotspacemacs-excluded-packages '()
        ;; Defines the behaviour of Spacemacs when installing packages.
        ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
        ;; `used-only' installs only explicitly used packages and uninstall any
        ;; unused packages as well as their unused dependencies.
        ;; `used-but-keep-unused' installs only the used packages but won't uninstall
        ;; them if they become unused. `all' installs *all* packages supported by
        ;; Spacemacs and never uninstall them. (default is `used-only')
        dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
    "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
    ;; This setq-default sexp is an exhaustive list of all the supported
    ;; spacemacs settings.
    (setq-default
        ;; If non-nil then enable support for the portable dumper. You'll need
        ;; to compile Emacs 27 from source following the instructions in file
        ;; EXPERIMENTAL.org at to root of the git repository.
        ;; (default nil)
        dotspacemacs-enable-emacs-pdumper nil

        ;; File path pointing to emacs 27.1 executable compiled with support
        ;; for the portable dumper (this is currently the branch pdumper).
        ;; (default "emacs-27.0.50")
        dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

        ;; Name of the Spacemacs dump file. This is the file will be created by the
        ;; portable dumper in the cache directory under dumps sub-directory.
        ;; To load it when starting Emacs add the parameter `--dump-file'
        ;; when invoking Emacs 27.1 executable on the command line, for instance:
        ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
        ;; (default spacemacs.pdmp)
        dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

        ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
        ;; possible. Set it to nil if you have no way to use HTTPS in your
        ;; environment, otherwise it is strongly recommended to let it set to t.
        ;; This variable has no effect if Emacs is launched with the parameter
        ;; `--insecure' which forces the value of this variable to nil.
        ;; (default t)
        dotspacemacs-elpa-https t

        ;; Maximum allowed time in seconds to contact an ELPA repository.
        dotspacemacs-elpa-timeout 5

        ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
        ;; This is an advanced option and should not be changed unless you suspect
        ;; performance issues due to garbage collection operations.
        ;; (default '(100000000 0.1))
        dotspacemacs-gc-cons '(819200 0.1)

        ;; If non-nil then Spacelpa repository is the primary source to install
        ;; a locked version of packages. If nil then Spacemacs will install the lastest
        ;; version of packages from MELPA. (default nil)
        dotspacemacs-use-spacelpa nil

        ;; If non-nil then verify the signature for downloaded Spacelpa archives.
        ;; (default nil)
        dotspacemacs-verify-spacelpa-archives nil

        ;; If non nil then spacemacs will check for updates at startup
        ;; when the current branch is not `develop'. Note that checking for
        ;; new versions works via git commands, thus it calls GitHub services
        ;; whenever you start Emacs. (default nil)
        dotspacemacs-check-for-update nil

        ;; If non-nil, a form that evaluates to a package directory. For example, to
        ;; use different package directories for different Emacs versions, set this
        ;; to `emacs-version'.
        dotspacemacs-elpa-subdirectory nil

        ;; One of `vim', `emacs' or `hybrid'.
        ;; `hybrid' is like `vim' except that `insert state' is replaced by the
        ;; `hybrid state' with `emacs' key bindings. The value can also be a list
        ;; with `:variables' keyword (similar to layers). Check the editing styles
        ;; section of the documentation for details on available variables.
        ;; (default 'vim)
        dotspacemacs-editing-style 'vim

        ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
        dotspacemacs-verbose-loading nil

        ;; Specify the startup banner. Default value is `official', it displays
        ;; the official spacemacs logo. An integer value is the index of text
        ;; banner, `random' chooses a random text banner in `core/banners'
        ;; directory. A string value must be a path to an image format supported
        ;; by your Emacs build.
        ;; If the value is nil then no banner is displayed. (default 'official)
        dotspacemacs-startup-banner 'official

        ;; List of items to show in startup buffer or an association list of
        ;; the form `(list-type . list-size)`. If nil then it is disabled.
        ;; Possible values for list-type are:
        ;; `recents' `bookmarks' `projects' `agenda' `todos'."
        ;; List sizes may be nil, in which case
        ;; `spacemacs-buffer-startup-lists-length' takes effect.
        dotspacemacs-startup-lists '((projects . 7))

        ;; True if the home buffer should respond to resize events.
        dotspacemacs-startup-buffer-responsive t

        ;; Default major mode of the scratch buffer (default `text-mode')
        dotspacemacs-scratch-mode 'lisp-interaction-mode

        ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
        ;; (default nil)
        dotspacemacs-initial-scratch-message nil

        ;; List of themes, the first of the list is loaded when spacemacs starts.
        ;; Press <SPC> T n to cycle to the next theme in the list (works great
        ;; with 2 themes variants, one dark and one light)
        dotspacemacs-themes
        '(
             (dt-min :location (recipe
                                   :fetcher github
                                   :repo "anoctopus/emacs-theme-darktooth"))
             darktooth
             ;; spacemacs-dark
             )

        ;; If non nil the cursor color matches the state color in GUI Emacs.
        dotspacemacs-colorize-cursor-according-to-state t

        ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
        ;; quickly tweak the mode-line size to make separators look not too crappy.
        dotspacemacs-default-font '("Source Code Pro"
                                       :size 18
                                       :weight normal
                                       :width normal
                                       :powerline-scale 1.3)

        ;; The leader key
        dotspacemacs-leader-key "SPC"

        ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
        ;; (default "SPC")
        dotspacemacs-emacs-command-key "SPC"

        ;; The key used for Vim Ex commands (default ":")
        dotspacemacs-ex-command-key ":"

        ;; The leader key accessible in `emacs state' and `insert state'
        ;; (default "M-m")
        dotspacemacs-emacs-leader-key "M-m"

        ;; Major mode leader key is a shortcut key which is the equivalent of
        ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
        dotspacemacs-major-mode-leader-key ","

        ;; Major mode leader key accessible in `emacs state' and `insert state'.
        ;; (default "C-M-m")
        dotspacemacs-major-mode-emacs-leader-key "C-M-m"

        ;; These variables control whether separate commands are bound in the GUI to
        ;; the key pairs C-i, TAB and C-m, RET.
        ;; Setting it to a non-nil value, allows for separate commands under <C-i>
        ;; and TAB or <C-m> and RET.
        ;; In the terminal, these pairs are generally indistinguishable, so this only
        ;; works in the GUI. (default nil)
        dotspacemacs-distinguish-gui-tab t

        ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
        dotspacemacs-remap-Y-to-y$ t

        ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
        ;; there. (default t)
        dotspacemacs-retain-visual-state-on-shift t

        ;; If non-nil, J and K move lines up and down when in visual mode.
        ;; (default nil)
        dotspacemacs-visual-line-move-text nil

        ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
        ;; (default nil)
        dotspacemacs-ex-substitute-global nil

        ;; Name of the default layout (default "Default")
        dotspacemacs-default-layout-name "Default"

        ;; If non nil the default layout name is displayed in the mode-line.
        ;; (default nil)
        dotspacemacs-display-default-layout nil

        ;; If non nil then the last auto saved layouts are resume automatically upon
        ;; start. (default nil)
        dotspacemacs-auto-resume-layouts nil

        ;; If non-nil, auto-generate layout name when creating new layouts. Only has
        ;; effect when using the "jump to layout by number" commands. (default nil)
        dotspacemacs-auto-generate-layout-names nil

        ;; Size (in MB) above which spacemacs will prompt to open the large file
        ;; literally to avoid performance issues. Opening a file literally means that
        ;; no major mode or minor modes are active. (default is 1)
        dotspacemacs-large-file-size 5

        ;; Location where to auto-save files. Possible values are `original' to
        ;; auto-save the file in-place, `cache' to auto-save the file to another
        ;; file stored in the cache directory and `nil' to disable auto-saving.
        ;; (default 'cache)
        dotspacemacs-auto-save-file-location 'cache

        ;; Maximum number of rollback slots to keep in the cache. (default 5)
        dotspacemacs-max-rollback-slots 5

        ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
        dotspacemacs-helm-resize nil

        ;; if non nil, the helm header is hidden when there is only one source.
        ;; (default nil)
        dotspacemacs-helm-no-header nil

        ;; define the position to display `helm', options are `bottom', `top',
        ;; `left', or `right'. (default 'bottom)
        dotspacemacs-helm-position 'bottom

        ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
        ;; in all non-asynchronous sources. If set to `source', preserve individual
        ;; source settings. Else, disable fuzzy matching in all sources.
        ;; (default 'always)
        dotspacemacs-helm-use-fuzzy 'always

        ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
        ;; several times cycle between the kill ring content. (default nil)
        dotspacemacs-enable-paste-transient-state t

        ;; Which-key delay in seconds. The which-key buffer is the popup listing
        ;; the commands bound to the current keystroke sequence. (default 0.4)
        dotspacemacs-which-key-delay 1

        ;; Which-key frame position. Possible values are `right', `bottom' and
        ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
        ;; right; if there is insufficient space it displays it at the bottom.
        ;; (default 'bottom)
        dotspacemacs-which-key-position 'bottom

        ;; Control where `switch-to-buffer' displays the buffer. If nil,
        ;; `switch-to-buffer' displays the buffer in the current window even if
        ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
        ;; displays the buffer in a same-purpose window even if the buffer can be
        ;; displayed in the current window. (default nil)
        dotspacemacs-switch-to-buffer-prefers-purpose nil

        ;; If non nil a progress bar is displayed when spacemacs is loading. This
        ;; may increase the boot time on some systems and emacs builds, set it to
        ;; nil to boost the loading time. (default t)
        dotspacemacs-loading-progress-bar t

        ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
        ;; (Emacs 24.4+ only)
        dotspacemacs-fullscreen-at-startup nil

        ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
        ;; Use to disable fullscreen animations in OSX. (default nil)
        dotspacemacs-fullscreen-use-non-native nil

        ;; If non nil the frame is maximized when Emacs starts up.
        ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
        ;; (default nil) (Emacs 24.4+ only)
        dotspacemacs-maximized-at-startup nil

        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's active or selected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-active-transparency 90

        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's inactive or deselected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-inactive-transparency 90

        ;; If non nil show the titles of transient states. (default t)
        dotspacemacs-show-transient-state-title t

        ;; If non nil show the color guide hint for transient state keys. (default t)
        dotspacemacs-show-transient-state-color-guide t

        ;; If non-nil unicode symbols are displayed in the mode line.
        ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
        ;; the value to quoted `display-graphic-p'. (default t)
        dotspacemacs-mode-line-unicode-symbols t

        ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
        ;; scrolling overrides the default behavior of Emacs which recenters point
        ;; when it reaches the top or bottom of the screen. (default t)
        dotspacemacs-smooth-scrolling t

        ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
        ;; derivatives. If set to `relative', also turns on relative line numbers.
        ;; (default nil)
        dotspacemacs-line-numbers t

        ;; Code folding method. Possible values are `evil' and `origami'.
        ;; (default 'evil)
        dotspacemacs-folding-method 'evil

        ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
        ;; (default nil)
        dotspacemacs-smartparens-strict-mode t

        ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
        ;; over any automatically added closing parenthesis, bracket, quote, etc…
        ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
        dotspacemacs-smart-closing-parenthesis t

        ;; Select a scope to highlight delimiters. Possible values are `any',
        ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
        ;; emphasis the current one). (default 'all)
        dotspacemacs-highlight-delimiters 'all

        ;; If non-nil, start an Emacs server if one is not already running.
        ;; (default nil)
        dotspacemacs-enable-server t

        ;; Set the emacs server socket location.
        ;; If nil, uses whatever the Emacs default is, otherwise a directory path
        ;; like \"~/.emacs.d/server\". It has no effect if
        ;; `dotspacemacs-enable-server' is nil.
        ;; (default nil)
        dotspacemacs-server-socket-dir nil

        ;; If non nil, advise quit functions to keep server open when quitting.
        ;; (default nil)
        dotspacemacs-persistent-server nil

        ;; List of search tool executable names. Spacemacs uses the first installed
        ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
        ;; (default '("rg" "ag" "pt" "ack" "grep"))
        dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

        ;; The default package repository used if no explicit repository has been
        ;; Format specification for setting the frame title.
        ;; %a - the `abbreviated-file-name', or `buffer-name'
        ;; %t - `projectile-project-name'
        ;; %I - `invocation-name'
        ;; %S - `system-name'
        ;; %U - contents of $USER
        ;; %b - buffer name
        ;; %f - visited file name
        ;; %F - frame name
        ;; %s - process status
        ;; %p - percent of buffer above top of window, or Top, Bot or All
        ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
        ;; %m - mode name
        ;; %n - Narrow if appropriate
        ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
        ;; %Z - like %z, but including the end-of-line format
        ;; (default "%I@%S")
        dotspacemacs-frame-title-format "%I@%S"

        ;; Format specification for setting the icon title format
        ;; (default nil - same as frame-title-format)
        dotspacemacs-icon-title-format nil

        ;; specified with an installed package.
        ;; Not used for now. (default nil)
        dotspacemacs-default-package-repository nil

        ;; Delete whitespace while saving buffer. Possible values are `all'
        ;; to aggressively delete empty line and long sequences of whitespace,
        ;; `trailing' to delete only the whitespace at end of lines, `changed'to
        ;; delete only whitespace for changed lines or `nil' to disable cleanup.
        ;; (default nil)
        dotspacemacs-whitespace-cleanup 'changed

        ;; Either nil or a number of seconds. If non-nil zone out after the specified
        ;; number of seconds. (default nil)
        dotspacemacs-zone-out-when-idle nil

        ;; Run `spacemacs/prettify-org-buffer' when
        ;; visiting README.org files of Spacemacs.
        ;; (default nil)
        dotspacemacs-pretty-docs nil
        )
    )

(defun dotspacemacs/user-env ()
    "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
    )

(defun dotspacemacs/user-init ()
    "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
    )

(defun dotspacemacs/user-config ()
    "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
    (setq-default
        evil-want-Y-yank-to-eol t
        evil-move-cursor-back nil
        nxml-child-indent 4
        nxml-slash-auto-complete-flag t
        tab-width 4
        column-enforce-column 100
        tab-always-indent t
        vc-follow-symlinks t
        yaml-indent-offset 2
        spacemacs-show-trailing-whitespace nil
        )
    (setq
        custom-file "~/.emacs.d/custom.el"
        spacemacs-useful-buffers-regexp '("\\*\\(scratch\\|spacemacs\\)\\*")
        history-delete-duplicates t
        )
    (load custom-file)
    (define-key evil-normal-state-map (kbd "SPC #") #'server-edit)
    (spacemacs/toggle-highlight-long-lines-globally-on)
    (spacemacs/toggle-truncate-lines-off)
    (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
    (add-hook 'org-mode-hook #'spacemacs/toggle-truncate-lines-off)
    (add-hook 'message-mode-hook #'spacemacs/toggle-auto-fill-mode-off) ; Thanks jen <3
    ;; (poetry-tracking-mode 't)

    (add-to-list 'face-ignored-fonts "Noto Color Emoji")
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
        "r" 'org-agenda-refile
        "e" 'org-agenda-set-effort)

    (add-hook 'change-major-mode-after-body-hook
        (lambda ()
            (when (> (buffer-size) 40000)
                (turn-off-show-smartparens-mode))))
    (add-hook 'flycheck-error-list-mode-hook
        (lambda ()
            (visual-line-mode 1)))
    (add-to-list 'auto-mode-alist
        '("Dockerfile-\\.*" . dockerfile-mode))

    (setq
        user-full-name "Amanda Walker")

    (setq  mu4e-contexts
        `(,(make-mu4e-context
               :name "namecheap"
               :match-func (lambda (msg)
                               (when msg
                                   (mu4e-message-contact-field-matches msg
                                       :to "amanda@amandawalker.io")))
               :vars '((user-mail-address . "amanda@amandawalker.io")
                          (mu4e-sent-messages-behavior . sent)
                          (mu4e-trash-folder . "/namecheap/Trash")
                          (mu4e-sent-folder . "/namecheap/Sent")
                          (mu4e-drafts-folder . "/namecheap/Drafts")
                          (mu4e-refile-folder . "/namecheap/Archive")
                          ))
             ,(make-mu4e-context
                  :name "work"
                  :match-func (lambda (msg)
                                  (when msg
                                      (mu4e-message-contact-field-matches msg
                                          :to "amanda@greenmarsinc.com")))
                  :vars '((user-mail-address . "amanda@greenmarsinc.com")
                             (mu4e-sent-messages-behavior . sent)
                             (mu4e-trash-folder . "/greenmars/Trash")
                             (mu4e-sent-folder . "/greenmars/Sent")
                             (mu4e-drafts-folder . "/greenmars/Drafts")
                             (mu4e-refile-folder . "/greenmars/Archive")
                             ))
             ,(make-mu4e-context
                  :name "gmail"
                  :match-func (lambda (msg)
                                  (when msg
                                      (or
                                          (mu4e-message-contact-field-matches msg
                                              :to (rot13-string "frna.naqerj.jnyxre@tznvy.pbz"))
                                          (mu4e-message-contact-field-matches msg
                                              :to "crazy.gold.shield@gmail.com"))))
                  :vars '((user-mail-address . "crazy.gold.shield@gmail.com")
                             (mu4e-sent-messages-behavior . delete)
                             (mu4e-sent-folder . "/gmail/[Gmail]/Sent Mail")
                             (mu4e-drafts-folder . "/gmail/[Gmail]/Drafts")
                             (mu4e-trash-folder . "/gmail/[Gmail]/Trash")
                             (mu4e-refile-folder . "/archive")
                             )))
        )


    (add-to-list 'mu4e-marks
        '(archive
             :char       "A"
             :prompt     "Archive"
             :dyn-target (lambda (target msg) (mu4e-get-refile-folder msg))
             :action (lambda (docid msg target)
                         (mu4e~proc-move docid (mu4e~mark-check-target target)
                             "+S-u-N")))
        )
    (add-to-list 'mu4e-marks
        '(delread
             :char       "^"
             :prompt     "^Mark read and delete"
             :dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
             :action (lambda (docid msg target)
                         ;; must come before proc-move since retag runs
                         ;; 'sed' on the file
                         (mu4e~proc-move docid (mu4e~mark-check-target target)
                             "+T+S-u-N")))
        )


    (with-eval-after-load 'mu4e-alert
        (mu4e-alert-set-default-style 'notifications))
    (advice-add #'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))
    (setq shr-use-fonts nil)
    ;; (keyfreq-mode 1)
    ;; (keyfreq-autosave-mode 1)
    (spacemacs/set-leader-keys
        "xc" 'count-words)
    (add-hook 'yaml-mode-hook
        (lambda ()
            (setq-local yaml-indent-offset 2)))

    ;; Stolen from doom-emacs
    (defun doom-defer-garbage-collection-h ()
        (setq gc-cons-threshold most-positive-fixnum))

    (defun doom-restore-garbage-collection-h ()
        ;; Defer it so that commands launched immediately after will enjoy the
        ;; benefits.
        (run-at-time
            1 nil (lambda () (setq gc-cons-threshold 819200))))

    (add-hook 'minibuffer-setup-hook #'doom-defer-garbage-collection-h)
    (add-hook 'minibuffer-exit-hook #'doom-restore-garbage-collection-h)

    (with-eval-after-load 'lsp-mode
        (progn
            (add-to-list 'lsp-language-id-configuration '(dhall-mode . "dhall"))
            (lsp-register-client
                (make-lsp-client :new-connection (lsp-stdio-connection "dhall-lsp-server")
                    :major-modes '(dhall-mode)
                    :server-id 'dhall
                    ))
            ))
    )
