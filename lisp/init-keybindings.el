;;快捷键设置
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;switch-window 使用快捷键
;;(global-set-key (kbd "C-x o") 'switch-window)
;;(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
;;(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
;;(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
;;(global-set-key (kbd "C-x 0") 'switch-window-then-delete)

(provide 'init-keybindings)
