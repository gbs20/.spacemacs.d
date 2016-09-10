;;; config.el --- jackiebin Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2016 jackiebin;

;; Author: 沈贵宾 <jackiebin@536408205@qq.com>
;; URL: https://github.com/jackiebin/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC hom cfs-profil SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `jackiebin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `jackiebin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `jackiebin/pre-init-PACKAGE' and/or
;;   `jackiebin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jackiebin-packages
  '()
  "The list of Lisp packages required by the jackiebin layer.
Each entry is either:
1. A symbol, which is interpreted as a package to be installed, or
2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.
    The following keys are accepted:
    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil
    - :location: Specify a custom installation location.
      The following values are legal:
      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.
      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'
      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")




;;
;;jackiebin private config start
;;
(setq *win64* (eq system-type 'windows-nt))
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)))

;; jackiebin-packages
;;添加包依赖
(setq jackiebin-packages
      '(
        nyan-mode;;彩虹猫
        web-mode;;web模式
        ace-jump-mode;;快速跳转
        chinese-fonts-setup;;中英文对齐
        youdao-dictionary
        chinese-pyim
        company
        )
      )
;;配置包
;; use-package 装载包
;; :init 在包装载之前执行的代码
;; :config 在包装载之后执行的代码
;; :bind 自定义绑定包快捷键，例如:bind ("C-." . jumpweb-mode))
;; :defer t 自动推迟加载，在空闲时间加载
;; :disabled t 禁用

;;彩虹猫
(defun jackiebin/init-nyan-mode ()
  (use-package nyan-mode
    :init
    :config
    (nyan-mode t);;启动彩虹猫
    (nyan-toggle-wavy-trail);;开启彩虹波浪
    (nyan-start-animation);;开启猫动画
    ))
;;ace-jump-mode跳转
(defun jackiebin/init-ace-jump-mode ()
  (use-package ace-jump-mode
    :init
    (autoload
      'ace-jump-mode
      "ace-jump-mode"
      "Emacs quick move minor mode"
      t)
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
    )
  )

;;web-mode
(defun jackiebin/init-web-mode ()
  (use-package web-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
    (setq web-mode-content-types-alist
          '(("jsx"  . "/.*/react/.*\\.js[x]?\\'")))
    ))

;;中文输入法
(defun jackiebin/init-chinese-pyim ()
  (use-package chinese-pyim
    :init
    :config
    (setq default-input-method "chinese-pyim")
    ))

;;中英文对齐
(defun jackiebin/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
	       :init
	       :config
	       ))
(defun jackiebin/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point)
    ))

;; 配置spacemacs已经安装过的包
;; 对于一个包，先调用pre-init-xxx,再调用init-xxx,最后调用post-init-xxx
;; 注意：一般init-xxx里面调用use-package安装包
(defun jackiebin/post-init-company ()
  (setq company-minimum-prefix-length 1))

;;; packages.el ends here
