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
     go
     html
     (python :variables
             python-fill-column 80
             python-indent-offset 4
     )
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; themes-megapack
     helm
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-return-key-behavior 'complete
      auto-completion-tab-key-behavior 'cycle
      auto-completion-enable-help-tooltip 'manual
      :disabled-for erc)
     smex
     ;; better-defaults
     emacs-lisp
     (c-c++ :variables c-c++-enable-clang-support nil)
     cscope
     git
     markdown
     ;; org
     ;; ranger
     shell
     javascript
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     ;; (version-control :variables
     ;;                  version-control-global-margin nil)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     powerline
     xah-find
     ;; (spaceline :location "~/ws/spaceline")
     yasnippet-snippets
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
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 20
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
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
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; dotspacemacs-startup-lists '((projects . 7))
   dotspacemacs-startup-lists 'nil
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         hc-zenburn
                         sanityinc-tomorrow-night
                         zenburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font  '("Source Code Pro for Powerline"
                                ;; dotspacemacs-default-font  '("DejaVu Sans Mono for powerline"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-distinguish-gui-tab nil
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
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10
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
   dotspacemacs-helm-position 'right
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
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
   dotspacemacs-maximized-at-startup t
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
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
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'nil
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
  ;; Evil
  ;;evil-shift-round nil

  ;; Avy
  ;; avy-all-windows 'all-frames

  ;; Avoid environment startup error
  ;;(setq exec-path-from-shell-check-startup-files nil)
  ;;(setq exec-path-from-shell-arguments '("-c"))
  ;;(setq exec-path-from-shell-copy-env "GOPATH")

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Initialization Config

  (setq-default global-company-mode t)
  (setq-default c-default-style "bsd")
  (setq-default c-basic-offset 4)
  (setq-default tab-width 4)
  (turn-on-fci-mode)
  ;; (setq-default spacemacs/toggle-fill-column-indicator-on)

  ;; Filenames
  (dolist (e '(("xml" . xml-mode)
               ("ccp" . xml-mode)
               ("json" . json-mode)
               ("schema" . json-mode)
               ("xinp" . web-mode)
               ("C" . c++-mode)
               ("h" . c++-mode)
               ("py" . python-mode)
               ("nh" . python-mode)
               ("in" . python-mode)))
    (push (cons (concat "\\." (car e) "\\'") (cdr e)) auto-mode-alist))

  (with-eval-after-load 'projectile
    (push '("C" "h") projectile-other-file-alist))

  ;; Auto wrap line
  (setq-default global-visual-line-mode t)
  ;; Global git commit editor
  (setq-default global-git-commit-mode t)
  ;; Turn off global current line highlight
  (setq-default global-hl-line-mode nil)
  ;; Turn on truncate-lines
  (setq-default truncate-lines t)
  ;; Do not create lock files
  (setq create-lockfiles nil)
  ;; Do not maintain recent files
  (setq recentf-mode nil)
  ;; Evil escape key sequence
  (setq-default evil-escape-key-sequence "jk")


  ;; Magit config settings
  (setq-default git-magit-status-fullscreen nil)
  (global-set-key (kbd "<f5>") 'magit-show-refs-popup)
  (spacemacs/set-leader-keys (kbd "gr") 'magit-show-refs-popup)
  (global-set-key (kbd "<f6>") 'magit-status)
  (spacemacs/set-leader-keys (kbd "gd") 'magit-diff-popup)
  ;; (define-key magit-mode-map (kbd "ll") 'magit-log-no-merges)

  ;; Performance Settings
  ;; Magit customization
  (with-eval-after-load 'magit
    (magit-add-section-hook 'magit-status-sections-hook
                            'magit-insert-unpushed-to-upstream
                            'magit-insert-unpushed-to-upstream-or-recent
                            'replace)
    (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
    (remove-hook 'server-switch-hook 'magit-commit-diff)
    )

  ;; (setq vc-handled-backends nil)
  ;; (setq vc-handled-backends (delq 'Git vc-handled-backends))
  (setq-default vc-follow-symlinks t)
  ;; My Ediff Mappings
  ;; turn off whitespace checking:
  (setq ediff-diff-options "-w")
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)
  (spacemacs/set-leader-keys (kbd "od") 'ediff-buffers)


  ;; helm config
  (setq helm-always-two-windows t)
  (setq helm-split-window-default-side 'right)
  (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case -G .[c|h]$")
  ;; (setq helm-ag-command-option "--all-text")
  (setq helm-follow-mode-persistent nil)
  (setq helm-ag-insert-at-point 'symbol)
  (setq helm-ag-ignore-buffer-patterns '("\\.txt\\'" "\\.mkd\\'" "\\.tim" "\\.out"))
  (setq helm-ag-ignore-patterns '("\\.txt\\'" "\\.mkd\\'" "\\.tim\\'" "\\cscope\\'" "\\make\\'" "\\bin\\'"))

  ;; Tags
  (setq tags-revert-without-query nil)
  ;; Cscope
  ;; (setq load-path (cons "/usr/local/timostools" load-path))
  ;; (setq cscope-do-not-update-database t)
  ;; (setq cscope-indexing-script "cscope-indexer")
  ;; Setting to replace word with previous yank when new word highlighted
  (setq delete-selection-mode t)

  ;; Spaceline config
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-projectile-root-on)
  (spaceline-toggle-window-number-off)
  (setq powerline-default-separator 'wave)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  ;; display time in powerline
  (display-time)

  ;; My mappings
  (spacemacs/declare-prefix "o" "custom")
  (spacemacs/set-leader-keys (kbd "os") 'open-projectile-multi-term-in-root)
  (spacemacs/set-leader-keys (kbd "or") 'open-remdocs)
  (spacemacs/set-leader-keys (kbd "ot") 'helm-cscope-pop-mark)
  (spacemacs/set-leader-keys (kbd "ox") 'xml-format)
  (spacemacs/set-leader-keys (kbd "oj") 'json-format)
  (spacemacs/set-leader-keys (kbd "on") 'new-buffer-frame)
  (spacemacs/declare-prefix "ol" "linum")
  (spacemacs/set-leader-keys (kbd "olh") 'change-linum-format-h)
  (spacemacs/set-leader-keys (kbd "olo") 'change-linum-format-o)
  (spacemacs/declare-prefix "og" "magit")
  (spacemacs/set-leader-keys (kbd "ogd") 'magit-diff)
  (spacemacs/set-leader-keys (kbd "ogp") 'gen_git_pr_url)
  (spacemacs/set-leader-keys (kbd "mm") 'man)

  ;; Defaults overridden
  (spacemacs/set-leader-keys (kbd "/") 'helm-projectile-ag)
  (spacemacs/set-leader-keys (kbd "*") 'helm-grep-do-git-grep)
  (define-key evil-normal-state-map (kbd "C-+") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)
  (define-key evil-window-map (kbd "C-q") 'evil-window-delete)

  ;; Yasnippet keymaps
  (setq-default yas-global-mode t)
  (spacemacs/declare-prefix "y" "yasnippet")
  (spacemacs/set-leader-keys (kbd "yra") 'yas-reload-all)
  (spacemacs/set-leader-keys (kbd "yrb") 'yas-load-snippet-buffer)
  (spacemacs/set-leader-keys (kbd "yn") 'yas-new-snippet)
  (spacemacs/set-leader-keys (kbd "ya") 'helm-yas-create-snippet-on-region)

  )

;; Magit update all remotes
(defun upd-all-git-remotes ()
  (interactive)
  (magit-fetch-all-prune)
  )

;; Open remote documents folder
(defun open-remdocs ()
  (interactive)
  ;; Split window
  (setq-local evil-vsplit-window-right t)
  (evil-window-vsplit)
  (dired "~/remdocs/mydocs/")
  )

;; Add new ediff mode 'd' which get changes $REMOTE and $LOCAL both
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer)))
  )

(defun add-d-to-ediff-mode-map ()
  (define-key ediff-mode-map "D" 'ediff-copy-both-to-C)
 )

(defun open-projectile-multi-term-in-root ()
  (interactive)
  ;; Split window
  (setq-local evil-vsplit-window-right t)
  (evil-window-vsplit)

  ;; Launch terminal in project root
  (projectile-multi-term-in-root)
  )

(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t))
  )

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
)

(defun new-buffer-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil)))
)

(defun change-linum-format-o ()
  (interactive)
  ;; (setq-default linum-format "%d")
  (setq-default linum-format "%d")
  )

(defun change-linum-format-h ()
  (interactive)
  (setq-default linum-format "%d ")
  )

(defun magit-log-no-merges ()
   (interactive)
   (magit-key-mode-popup-logging)
   (magit-key-mode-toggle-option (quote logging) "--no-merges")
   )

(defun gen_git_pr_url ()
  (interactive)
  (if (y-or-n-p "Pushed local branch to remote?")
      (progn (setq branch (magit-get-current-branch)
                   )
             (setq proj (read-string "Enter remote project name: " )
                   )
             (setq proj_ver (read-string "Enter project version: ")
                   )
             (shell-command-to-string (format "git_pull_request.py %s %s %s" branch proj proj_ver))
             )

    )
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-guru go-eldoc company-go go-mode spinner mmm-mode evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu evil undo-tree adaptive-wrap less-css-mode powerline org-plus-contrib markdown-mode magit-popup magit skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode lv parent-mode projectile request xcscope haml-mode gitignore-mode flycheck pkg-info epl flx highlight transient git-commit with-editor web-completion-data dash-functional tern pos-tip company bind-key yasnippet packed anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup paradox goto-chg yasnippet-snippets yapfify xterm-color xah-find ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline smex smeargle smartparens slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el orgit org-bullets open-junk-file neotree multi-term move-text markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hydra hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag hc-zenburn-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-unimpaired evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-escape eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster diminish define-word cython-mode company-web company-tern company-statistics company-quickhelp company-c-headers company-anaconda column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format bind-map auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
