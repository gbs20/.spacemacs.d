
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

;; the %? After completing the template, position cursor here.
;; the %i would copy the selected text into the template
;; the %U Inactive timestamp
;;http://www.howardism.org/Technical/Emacs/journaling-org.html
;;add multi-file journal
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Workspace")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("n" "notes" entry (file+headline "~/org/notes.org" "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("b" "Blog Ideas" entry (file+headline "~/org/notes.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("s" "Code Snippet" entry
         (file "~/org/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
        ("w" "work" entry (file+headline "~/org/gtd.org" "Cocos2D-X")
         "* TODO [#A] %?\n  %i\n %U"
         :empty-lines 1)
        ("c" "Chrome" entry (file+headline "~/org/notes.org" "Quick notes")
         "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/org/notes.org" "Quick notes")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ("j" "Journal Entry"
         entry (file+datetree "~/org/journal.org")
         "* %?"
         :empty-lines 1)))
