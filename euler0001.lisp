;; Project Euler Problem 1

(defun sum-three-five (n)
  (loop for i from 1 to n
	when (or (zerop (mod i 3))
		 (zerop (mod i 5)))
	  sum i))
