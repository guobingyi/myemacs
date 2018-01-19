;; go语言的自动补全设置                                                    
;; 需要预先安装gocode到$PATH中：github.com/nsf/gocode
(require 'go-complete)
(require 'go-autocomplete)

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

(provide 'init-golang)
