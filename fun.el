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
  "fake modulo, (-inf,inf) to [0,n)"
  (cond ((<  m 0) (+ (- (% (- m) n)) n))
	((>= m n) (% m n))
	(t m)))

(defun msort (n)
  "merge sort, for giggles"
  (cond ((<= 1 (length n)) ar)
	(t (merge (sub n 0 (/ (length n) 2))
		  (sub n (/ (length n) 2) (length n))))))

;;; weather - https://api.weather.gov/gridpoints/LIX/25,107/forecast/hourly
;;;         - properties.periods.0.temperature
;;;         - properties.periods.0.shortForecast
(defun weather ()
  (interactive)
  (with-temp-buffer (url-retrieve-synchronously "https://api.weather.gov/gridpoints/LIX/25,107/forecast")
    (let* ((json-object-type 'hash-table)
	   (json-array-type 'list)
	   (json-key-type 'string)
	   (json-value-type 'string)
	   (json (condition-case json-end-of-file
		     (json-parse-buffer)
		   (json-parse-buffer)))
	   (data (car (gethash "periods" (gethash "properties" json)
			       ))))
      (message "%d, %s" (gethash "temperature" data)
	       (gethash "shortForecast" data)))))

(defun substitute ()
  (interactive)
  (let (contents (buffer-string))
	(erase-buffer)
	(insert (mapconcat (lambda (c)
						 )))))
