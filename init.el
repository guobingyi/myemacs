;;by guoby at 2018-01-19 add git
;;使用统一管理方式进行修改
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;自定义函数
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(defun open-my-go-workspace()
  (interactive)
  (find-file "~/OneDrive/mywork/code/gocode/src/FimasCenter/main.go"))

(global-set-key (kbd "<f3>") 'open-my-go-workspace)

(defun open-fimas-workspace()
  (interactive)
  (find-file "/Volumes/Transcend/work_bak/Letour/SNV_ALL/fimas/sourcecode/controller/firewall_common201712/analysis/firewall_analysis.py")
  )
(global-set-key (kbd "<f4>") 'open-fimas-workspace)


(require 'init-packages)
(require 'init-ui)
(require 'init-better-default)
(require 'init-keybindings)
(require 'init-org)
(require 'init-golang)
(require 'init-markdown)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;注册快捷键f2直接调用init.el文件
;(defun open-my-init-file()
;  (interactive)
;  (find-file "~/.emacs.d/init.el"))

;(global-set-key (kbd "<f2>") 'open-my-init-file)


;;设置smex，来源于官方，目的是主要在使用M-x时提供相应的操作,由于后面使用了ivy可以直接删除smex了
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize); Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)





