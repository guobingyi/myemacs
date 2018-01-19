
;;close toolbar
(tool-bar-mode -1)

;;close scroll bar
(scroll-bar-mode -1)

;;close electric
;;(electric-indent-mode -1)

;;close splash screen
(setq inhibit-splash-screen t)

;;show line num
(global-linum-mode t)

;设置光标模式
(setq-default cursor-type 'bar)

;;设置开始界面最大化
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;设置字体大小 使用 M-x describe-font 查看字体描述，然后将字体描述复制到以下命令中
;;(setq cjk-font-size 18)
;;(setq ansi-font-size 18) Monaco - Menlo - Helvetica
(set-default-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")



;;显示当前显示行信息,即当前行已深色标示
(global-hl-line-mode t)

;;设置样式
(load-theme 'monokai t)
;;(load-theme 'zenburn t)

(provide 'init-ui)
