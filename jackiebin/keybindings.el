;;; config.el --- jackiebin Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2016 jackiebin;

;; Author: 沈贵宾 <jackiebin@536408205@qq.com>
;; URL: https://github.com/jackiebin/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;键位绑定
;;(global-set-key (kbd "C-c f") (kbd "C-u - 1 0 C-x {"));;增加buffer宽度，步长10
;;(global-set-key (kbd "C-c b") (kbd "C-u - 1 0 C-x }"));;减小buffer宽度，步长10

(global-set-key (kbd "C-\\") 'toggle-input-method)

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;;bash中的回删单词，也是这三个键
(global-set-key (kbd "C-M-h") 'backward-kill-word)
;;快速的对代码进行注释与反注释
(global-set-key (kbd "C-c C-u") 'comment-or-uncomment-region)

(global-set-key (kbd "M-s o") 'occur-dwim)

;; 个人键绑定
;; search engine
(global-set-key (kbd "C-z g") 'engine/search-google)
(global-set-key (kbd "C-z b") 'engine/search-bing)

;; avy
(global-set-key (kbd "C-z w") 'avy-goto-word-0)
