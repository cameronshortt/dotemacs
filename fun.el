(defun consumas ()
  (interactive)
  (message "$%.2f" (- 550.0 (* (/ 550.0 10191600.0)
			       (- (float-time) 1705298400)))))

(defun semester-progress ()
  (interactive)
  (message "%d%%" (* 100 (/ (- (float-time) 1705298400)
			    10191600))))

;; (defun caeser-cipher (key)
;;   (interactive "iKey? ")
;;   (insert (mapcar (lambda (c)
;; 		    (cond ((and (>= #a c) (<= #z c))
;; 			   (% (+ c key) 26))
;; 			  (t c)))
;; 		  (buffer-string))))
