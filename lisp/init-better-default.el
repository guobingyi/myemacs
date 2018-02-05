;;显示当前显示行信息,即当前行已深色标示
(global-hl-line-mode t)

;;关闭文件到顶端和尾端的声音提示
(setq ring-bell-function 'ignore)

;;开启自动覆盖模式
(global-auto-revert-mode t)

;;关闭自动备份文件
(setq make-backup-files nil)

;;关闭自动保存文件模式
(setq auto-save-default nil)

;;设置最近使用文件模式
(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;窗口激活状态
(require 'popwin)
(popwin-mode t)

;设置全局的补齐模式
(global-company-mode t)

;;设置全局的窗口选择方式
(window-numbering-mode t)

;;设置换行方式
(global-visual-line-mode t)




(provide 'init-better-default)
