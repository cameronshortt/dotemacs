(defun consumas ()
  (interactive)
  (message "$%.2f" (- 550.0 (* (/ 550.0 10191600.0)
			       (- (float-time) 1705298400)))))

(defun semester-progress ()
  (interactive)
  (message "%d%%" (* 100 (/ (- (float-time) 1705298400)
			    10191600))))

(defun caeser-cipher (key)
  (interactive "nKey? ")
  (let ((contents (buffer-string)))
    (erase-buffer)
    (insert (mapconcat (lambda (c)
			 (format "%c"
				 (cond ((and (<= ?a c) (>= ?z c))
					(+ ?a (cycle (+ (- c ?a) key)
						 26)))
				       ((and (<= ?A c) (>= ?Z c))
					(+ ?A (cycle (+ (- c ?A) key)
						 26)))
 				       (t c))))
 		       contents ""))))

(defun rot13 ()
  (interactive)
  (caeser-cipher 13))

(defun cycle (m n)
  (% (cond ((< m 0) (+ m n))
	   (t m)) n))
