;;; config.el --- jackiebin Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2016 jackiebin;

;; Author: 沈贵宾 <jackiebin@536408205@qq.com>
;; URL: https://github.com/jackiebin/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;自定义buffer头,显示更多的buffer标题信息
(setq frame-title-format
      '("" " jackiebin ☺ "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))

;;保存时自动清除行尾空格及文件结尾空行
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;tab&空格
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;开启行号
(global-linum-mode t)
;;关闭org-mode的行号
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))
