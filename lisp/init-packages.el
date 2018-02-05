;;(package-initialize)
;;使用包管理进行安装
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )

(require 'cl)
;;add whatever packages you want here
(defvar guoby/packages '(
				   company
				   monokai-theme
				   hungry-delete
				   swiper
				   counsel
				   smartparens
				   js2-mode
				   nodejs-repl
				   exec-path-from-shell
				   company-go
				   popwin
				   neotree
				   all-the-icons
				   psvn
				   window-numbering
				   nov
				   auto-complete
				   )  "Default packages")

(setq package-selected-packages guoby/packages)

(defun guoby/packages-installed-p ()
    (loop for pkg in guoby/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (guoby/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg guoby/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))


;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;;For golang
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOBIN")


;;使用一次删除多个空行
(require 'hungry-delete)
(global-hungry-delete-mode)



;;安装查询 ivy / counsel 源于官方配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;安装左右括号补齐
(require 'smartparens-config)
;;在使用lisp的模式下调用smartparens-mode
;;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(smartparens-global-mode t)
;;让Emacs可以访问exec
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;;开始配置js2-mode
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))

;;让emacs展现树形菜单
;;(add-to-list 'load-path "/Users/guoby/OneDrive/mywork/code/gocode/src/FimasCenter")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;树形菜单样式/
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;使用emacs读取epub电子书
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;;使用c-x o 选择窗口
;;(require 'switch-window)

;;日历插件
(require 'calfw)
(require 'calfw-org)


;;
;;auto-complete
 (require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")
 (ac-config-default)
 (local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert)

(provide 'init-packages)
