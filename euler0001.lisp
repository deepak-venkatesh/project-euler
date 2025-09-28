;; Project Euler Problem 1

;; 0.000036 seconds of total run time (0.000036 user, 0.000000 system)


(defun sum-three-five (n)
  (loop for i from 1 to n
	when (or (zerop (mod i 3))
		 (zerop (mod i 5)))
	  sum i))

