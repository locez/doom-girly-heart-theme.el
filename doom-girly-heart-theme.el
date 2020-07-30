;;; doom-girly-heart-theme.el --- Inspired by VSCode Horizon -*- no-byte-compile: t; -*-

;;; Commentary:
;;; This theme was inspired by the port of Horizon to Emacs
;;; see: https://github.com/aodhneine/horizon-theme.el
;;; see: https://horizontheme.netlify.app

(require 'doom-themes)

;;; Code:
(defgroup doom-girly-heart-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-girly-heart-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-girly-heart-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-girly-heart
  "A port of the port of the Visual Studio Code theme Horizon"

  ;; name        default   256       16
  ( (bg         '("#FDF0ED" "#FADAD1" nil))
    (bg-alt     '("#FADAD1" "#FDF0ED" nil))
    (base0      '("#1EAEAE" "#1EAEAE" "brightgreen"))
    (base1      '("#1a1c23" "#1a1c23" "brightblack"))
    (base2      '("#1d1f27" "#1c1e26" "brightblack"))
    (base3      '("#232530" "#232530" "brightblack"))
    (base4      '("#6a6a6a" "#6a6a6a" "brightblack"))
    (base5      '("#f9cec3" "#f9cec3" "brightblack"))
    (base6      '("#f9cbbe" "#f9cbbe" "brightblack"))
    (base7      '("#fadad1" "#fadad1" "brightblack"))
    (base8      '("#fdf0ed" "#fdf0ed" "white"))
    (fg-alt     '("#D5D8DA" "#D5D8DA" "brightwhite"))
    (fg         '("#333333" "#333333" "white"))

    (grey       base4)
    (red        '("#E95678" "#E95678" "red"))
    (orange     '("#f09383" "#f09383" "brightred"))
    (green      '("#3FDAA4" "#3FDAA4" "green"))
    (teal       base0)
    (yellow     '("#FAB795" "#FAB795" "yellow"))
    (blue       '("#26BBD9" "#26BBD9" "brightblue"))
    (dark-blue  '("#25b2bc" "#25b2bc" "blue"))
    (magenta    '("#EE64AC" "#EE64AC" "magenta"))
    (violet     '("#8A31B9" "#8A31B9" "brightmagenta"))
    (cyan       '("#6BE4E6" "#6BE4E6" "brightcyan"))
    (dark-cyan  '("#27d797" "#27d797" "cyan"))

    ;; additional highlighting colours for girly heart
    (girly-highlight  (doom-lighten magenta 0.5))
    (girly-highlight-selected (doom-lighten base5 0.1))
    (girly-highlight-bright (doom-lighten fg 0.5))

    ;; face categories -- required for all themes
    (highlight      red)
    (vertical-bar   base0)
    (selection      magenta)
    (builtin        violet)
    (comments       girly-highlight-bright)
    (doc-comments   yellow)
    (constants      orange)
    (functions      teal)
    (keywords       violet)
    (methods        magenta)
    (operators      teal)
    (type           teal)
    (strings        yellow)
    (variables      red)
    (numbers        orange)
    (region         girly-highlight)
    (error          red)
    (warning        dark-cyan)
    (success        green)
    (vc-modified    orange)
    (vc-added       green)
    (vc-deleted     red)


    ;; custom categories
    (hidden     `(,(car bg) "black" "black"))
    (-modeline-pad
     (when doom-girly-heart-padded-modeline
       (if (integerp doom-girly-heart-padded-modeline) doom-girly-heart-padded-modeline 4)))

    (modeline-fg     magenta)
    (modeline-fg-alt (doom-lighten magenta 0.5))

    (modeline-bg base5)
    (modeline-bg-l base5)

    (modeline-bg-inactive   base5)
    (modeline-bg-inactive-l base5))


  ;; --- extra faces ------------------------
  ( (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")


    ;; ((line-number &override) :foreground (doom-lighten bg 0.05))
    ((line-number &override) :foreground girly-highlight-selected)
    ((line-number-current-line &override) :foreground girly-highlight-bright)

    (font-lock-comment-face
     :inherit 'italic
     :foreground comments)
    (font-lock-doc-face
     :inherit 'font-lock-comment-face
     :foreground doc-comments)

    (mode-line
     :background modeline-bg :foreground modeline-fg
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
     :background modeline-bg-inactive :foreground modeline-fg-alt
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis
     :foreground highlight)
    (header-line :inherit 'mode-line :background fg-alt)
    (mode-line-highlight :background base5 :foreground fg)

    ;; modeline
    (doom-modeline-bar :background magenta)
    (doom-modeline-highlight :foreground (doom-lighten magenta 0.3))
    (doom-modeline-project-dir :foreground magenta :inherit 'bold)
    (doom-modeline-buffer-path :foreground magenta)
    (doom-modeline-buffer-file :foreground magenta)
    (doom-modeline-buffer-major-mode :foreground magenta)
    (doom-modeline-buffer-modified :foreground violet)
    (doom-modeline-panel :background (doom-lighten magenta 0.5))
    (doom-modeline-urgent :foreground modeline-fg)
    (doom-modeline-info :background base5 :foreground cyan)

    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-l
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-inactive-l
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

    ;; --- major-mode faces -------------------
    ;; NOTE: there are lots of tweaks here to mimic the VSCode theme

    ;; css-mode / scss-mode
    (css-proprietary-property :foreground violet)
    (css-property             :foreground fg)
    (css-selector             :foreground red)

    ;; markdown-mode
    (markdown-markup-face           :foreground cyan)
    (markdown-link-face             :foreground orange)
    (markdown-link-title-face       :foreground yellow)
    (markdown-header-face           :foreground magenta :inherit 'bold)
    (markdown-header-delimiter-face :foreground magenta :inherit 'bold)
    (markdown-language-keyword-face :foreground orange)
    (markdown-markup-face           :foreground fg)
    (markdown-bold-face             :foreground violet)
    (markdown-table-face            :foreground fg :background (doom-lighten base5 0.5))
    ((markdown-code-face &override) :foreground orange :background (doom-lighten base5 0.5))

    ;; outline (affects org-mode)
    ((outline-1 &override) :foreground blue :background nil)

    ;; org-mode
    ((org-block &override) :background (doom-lighten base5 0.5))
    ((org-block-begin-line &override) :background (doom-lighten base5 0.5) :foreground comments)
    ((org-quote &override) :background (doom-lighten base5 0.5))
    (org-hide :foreground hidden)
    (org-link :inherit 'underline :foreground yellow)
    (org-agenda-done :foreground cyan)
    (solaire-org-hide-face :foreground hidden)
    (solaire-header-line-face :background bg-alt :foreground fg)
    (header-line :background base2 :foreground fg)

    ;; ;; flycheck
    ;; (flycheck-popup-tip-face :background base5 :foreground fg-alt)
    ;; (flycheck-posframe-info-face :background base5 :foreground fg-alt)
    ;; (flycheck-posframe-warning-face :inherit 'warning)
    ;; (flycheck-posframe-error-face :inherit 'error)

    ;; tooltip
    (tooltip              :background base5 :foreground fg)
    (popup-tip-face :inherit 'popup-face :foreground magenta :background base5)

    ;; parenface
    (paren-face :foreground teal)
    (parinfer-pretty-parens:dim-parenface :foreground magenta)

    ;; haskell
    (haskell-type-face :foreground violet)
    (haskell-constructor-face :foreground yellow)
    (haskell-operator-face :foreground fg)
    (haskell-literate-comment-face :foreground girly-highlight-selected)

    ;; magit
    (magit-section-heading :foreground red)
    (magit-branch-remote   :foreground orange)

    ;; --- extra variables ---------------------
    ;; basics
    (link :foreground yellow :inherit 'underline)
    (fringe :background bg-alt)

    ;; evil
    (evil-ex-search          :background girly-highlight-selected :foreground fg)
    (evil-ex-lazy-highlight  :background girly-highlight :foreground fg)

    ;; ivy
    (ivy-current-match       :background girly-highlight :distant-foreground nil)
    (ivy-posframe-cursor     :background red :foreground base0)
    (ivy-minibuffer-match-face-2 :foreground red :weight 'bold)
    (ivy-posframe :background base5)

    ;; company
    (company-box-background    :background base5 :foreground fg)
    (company-tooltip-common    :foreground red :weight 'bold)
    (company-tooltip-selection :background girly-highlight :foreground fg)

    ;; treemacs
    (treemacs-root-face :foreground fg :weight 'bold :height 1.2)
    (doom-themes-treemacs-root-face :foreground fg :weight 'ultra-bold :height 1.2)
    (doom-themes-treemacs-file-face :foreground fg)
    (treemacs-directory-face :foreground fg)
    (treemacs-git-modified-face :foreground green)

    ;; js2-mode
    (js2-object-property        :foreground red)

    ;; rjsx-mode
    (rjsx-tag :foreground red)
    (rjsx-tag-bracket-face :foreground red)
    (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)))



;;; doom-girly-heart-theme.el ends here
