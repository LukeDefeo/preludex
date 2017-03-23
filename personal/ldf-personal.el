;note if any of the bindings throw an error evalulation of the file will stop and all bindings below wont work
;; note to hook into minor mode map, find the map in question probably by doing C-q, keystroke and it will tell you,
;; then do s-b to locate which file its defined in then do evai-after-load "fileame" and the map shoudl be avaulable
;;fundamental. If it errors you probably forgot to put a quote ' before the body of eval after load

 ;http://stackoverflow.com/questions/557282/in-emacs-whats-the-best-way-for-keyboard-escape-quit-not-destroy-other-windows
;this makes keyboard escape quit work :)
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(global-set-key (kbd "C-q") 'describe-key) ;ctrl-q
(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;;show key map

(bind-key* "C-/" 'helm-descbinds)

(defvar structual-bindings '(progn
                              (bind-key "C-." 'paredit-forward-slurp-sexp paredit-mode-map)
                              (bind-key "C-,"   'paredit-backward-slurp-sexp  paredit-mode-map)
                              (bind-key  "C->"   'paredit-forward-barf-sexp  paredit-mode-map)
                              (bind-key "C-<"   'paredit-forward-bark-sexp  paredit-mode-map)
                              (bind-key "<C-backspace>"   'paredit-splice-sexp  paredit-mode-map)
                              (bind-key "C-<left>" 'paredit-backward paredit-mode-map)
                              (bind-key "C-<right>" 'paredit-forward paredit-mode-map)
                              (bind-key "C-<right>" 'paredit-forward paredit-mode-map)
                              (bind-key "C-<down>" 'paredit-forward-down paredit-mode-map)
                              (bind-key "C-<up>" 'paredit-backward-up paredit-mode-map)
                              (bind-key "C-F"   ' cider-load-buffer) ))
(eval-after-load "paredit"
  structual-bindings)

(eval-after-load "clojure-mode"
  structual-bindings)

(eval-after-load "cua-base"
  '(unbind-key "<C-return>" cua-global-keymap))

;;line level
(bind-key* "<s-backspace>" 'crux-kill-line-backwards)
(bind-key* "s-/" 'comment-line)

;; ;easy mark is the expanding thing
(global-set-key (kbd "M-SPC") 'easy-mark) ;cmd-s

(eval-after-load 'easy-kill
  '(progn
     (bind-key "<up>" 'easy-kill-expand  easy-kill-base-map)
     (bind-key "<down>" 'easy-kill-shrink  easy-kill-base-map)))

;;project nav
(bind-key* "s-b" 'elisp-slime-nav-find-elisp-thing-at-point)

;;files

(global-set-key (kbd "s-s") 'save-buffer) ;cmd-s
(global-set-key (kbd "s-S") 'write-file) ;cmd-shift-s
(global-set-key (kbd "s-w") 'kill-buffer) ;cmd-w
(global-set-key (kbd "s-W") 'kill-buffer-and-window) ;cmd-shift-w dont change this
(bind-key* "s-n" 'crux-create-scratch-buffer)
(bind-key* "C-R" 'crux-rename-buffer-and-file)

(bind-key*  "s-o" 'projectile-find-file )
(bind-key*  "s-O" 'helm-find-files)
(bind-key*  "s-M-o" 'helm-locate)


(bind-key* "s-d" 'crux-duplicate-current-line-or-region)
(bind-key* "s-D" 'crux-duplicate-and-comment-current-line-or-region)

(bind-key* (kbd "s-f") 'helm-ag-this-file)
(bind-key* (kbd "s-F") 'helm-ag-project-root)




;global nav
(global-set-key (kbd "s-<left>") 'crux-move-beginning-of-line) ;cmd-left
(global-set-key (kbd "s-<right>") 'end-of-line)      ;cmd-right
(global-set-key (kbd "C-M-v") 'helm-show-kill-ring)  ;for some reason cant makethis be C-M-v
(bind-key* "M-<up>" 'backward-paragraph)
(bind-key* "M-<down>" 'forward-paragraph)
(bind-key* "s-S-<down>" 'move-text-down)
(bind-key* "s-S-<up>" 'move-text-up)
;(global-set-key (kbd "<backspace>")   'kill-region) ; this breaks ackspace
(global-set-key (kbd "s-g") 'goto-line)


(global-set-key (kbd "s-P") 'helm-M-x)               ;cmd-shift-p  this way works better
(global-set-key (kbd "M-x") 'helm-M-x)               ;cmd-shift-p
(global-set-key (kbd "s-e") 'helm-buffers-list)      ;cmd-e



;;;ldf-personal.el ends here
