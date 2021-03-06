;;在使用go语言的模式下调用
;;;(add-hook 'go-mode-hook 'smartparens-mode)
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-o") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-k") 'godoc)))
(add-to-list 'load-path "/Users/guoby/OneDrive/mywork/code/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)
(add-hook 'go-mode-hook 'company-mode)(add-hook 'go-mode-hook (lambda ()  (set (make-local-variable 'company-backends) '(company-go))
								(company-mode)))

;;在go web编程中进行补充
;; golang mode
 (require 'go-mode-load)
 (require 'go-autocomplete)
 ;; speedbar
 ;; (speedbar 1)
 (speedbar-add-supported-extension ".go")
 (add-hook
 'go-mode-hook
 '(lambda ()
 	;; gocode
 	(auto-complete-mode 1)
 	(setq ac-sources '(ac-source-go))
 	;; Imenu & Speedbar
 	(setq imenu-generic-expression
 		'(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
 		("func" "^func *\\(.*\\) {" 1)))
 	(imenu-add-to-menubar "Index")
 	;; Outline mode
 	(make-local-variable 'outline-regexp)
 	(setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
 	(outline-minor-mode 1)
 	(local-set-key "\M-a" 'outline-previous-visible-heading)
 	(local-set-key "\M-e" 'outline-next-visible-heading)
 	;; Menu bar
 	(require 'easymenu)
 	(defconst go-hooked-menu
 		'("Go tools"
 		["Go run buffer" go t]
 		["Go reformat buffer" go-fmt-buffer t]
 		["Go check buffer" go-fix-buffer t]))
 	(easy-menu-define
 		go-added-menu
 		(current-local-map)
 		"Go tools"
 		go-hooked-menu)

 	;; Other
 	(setq show-trailing-whitespace t)
 	))
 ;; helper function
 (defun go ()
 	"run current buffer"
 	(interactive)
 	(compile (concat "go run " (buffer-file-name))))

 ;; helper function
 (defun go-fmt-buffer ()
 	"run gofmt on current buffer"
 	(interactive)
 	(if buffer-read-only
 	(progn
 		(ding)
 		(message "Buffer is read only"))
 	(let ((p (line-number-at-pos))
 	(filename (buffer-file-name))
 	(old-max-mini-window-height max-mini-window-height))
 		(show-all)
 		(if (get-buffer "*Go Reformat Errors*")
 	(progn
 		(delete-windows-on "*Go Reformat Errors*")
 		(kill-buffer "*Go Reformat Errors*")))
 		(setq max-mini-window-height 1)
 		(if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
 	(progn
 		(erase-buffer)
 		(insert-buffer-substring "*Go Reformat Output*")
 		(goto-char (point-min))
 		(forward-line (1- p)))
 	(with-current-buffer "*Go Reformat Errors*"
 	(progn
 		(goto-char (point-min))
 		(while (re-search-forward "<standard input>" nil t)
 		(replace-match filename))
 		(goto-char (point-min))
 		(compilation-mode))))
 		(setq max-mini-window-height old-max-mini-window-height)
 		(delete-windows-on "*Go Reformat Output*")
 		(kill-buffer "*Go Reformat Output*"))))
 ;; helper function
 (defun go-fix-buffer ()
 	"run gofix on current buffer"
 	(interactive)
 	(show-all)
 	(shell-command-on-region (point-min) (point-max) "go tool fix -diff"))



(provide 'golang)
