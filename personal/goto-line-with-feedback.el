;; from https://gist.github.com/magnars/3292872
;; turn line numbers off by default
(global-linum-mode -1)

(defun goto-line-with-feedback (&optional line)
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if line
      (goto-line line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (goto-line (read-number "Goto line: ")))
      (linum-mode -1))))

;; bind to specific key
(global-set-key (kbd "C-l") 'goto-line-with-feedback)

;; or replace all goto-line
(global-set-key (vector 'remap 'goto-line) 'goto-line-with-feedback)
