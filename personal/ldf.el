;note if any of the bindings throw an error evalulation of the file will stop and all bindings below wont work

                                        ;http://stackoverflow.com/questions/557282/in-emacs-whats-the-best-way-for-keyboard-escape-quit-not-destroy-other-windows
;this makes keyboard escape quit work :)
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))



;fundamental
(global-set-key (kbd "C-q") 'describe-key) ;ctrl-q
(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;(global-set-key (kbd "<escape>") 'keyboard-quit) ;key board escape quit seems to work better however it kills open panes :(

;files
(global-set-key (kbd "s-s") 'save-buffer) ;cmd-s
(global-set-key (kbd "s-S") 'write-file) ;cmd-shift-s
(global-set-key (kbd "s-w") 'kill-buffer) ;cmd-w
(global-set-key (kbd "s-W") 'kill-buffer-and-window) ;cmd-shift-w dont change this
(global-set-key (kbd "s-o") 'helm-find-files)      ;cmd-shift-n

;global nav
(global-set-key (kbd "s-<left>") 'beginning-of-line) ;cmd-left
(global-set-key (kbd "s-<right>") 'end-of-line)      ;cmd-right
(global-set-key (kbd "C-M-v") 'helm-show-kill-ring)  ;for some reason cant makethis be C-M-v
(global-set-key (kbd "s-g") 'goto-line)  ;for some reason cant makethis be C-M-v


(global-set-key (kbd "s-P") 'helm-M-x)               ;cmd-shift-p  this way works better
(global-set-key (kbd "M-x") 'helm-M-x)               ;cmd-shift-p
(global-set-key (kbd "s-e") 'helm-buffers-list)      ;cmd-e
;(global-set-key (kbd "s-e") 'crux-recentf-find-fil)  ;cmd-e better recent files list but doesnt work



;(global-unset-key (kbd "s-p <escape>"))


;;;ldf.el ends here
