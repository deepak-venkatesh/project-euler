;;;; Project Euler Problem 2


;; simple aproach of generate -> filter -> reduce
;; 0.000004 seconds of total run time (0.000003 user, 0.000001 system)
;; my python while loop which is similar takes 0.45 milli seconds to 0.65 milli seconds. Lisp code is over 200 times faster.

(defun sum-even-fibs-fn (n)
  (reduce #'+
          (remove-if-not #'evenp
                         (loop for a = 0 then b
                               and b = 1 then (+ a b)
			       while (<= a n)
                               collect a))
	  :initial-value 0))


;; closure approach
;; 0.000003 seconds of total run time (0.000002 user, 0.000001 system)

(defun make-fib-gen ()
  (let ((a 0) (b 1))
    (lambda ()
      (prog1 a
	(psetq a b
	       b (+ a b))))))

(defun sum-even-fibs (n)
  (let ((fib (make-fib-gen)))
    (loop for x = (funcall fib)
	  while (<= x n)
	  when (evenp x) sum x)))

;; tail recursion approach
;; 0.000002 seconds of total run time (0.000001 user, 0.000001 system)

(defun sum-even-fibs-tail (limit &optional (a 0) (b 1) (acc 0))
  (if (> a limit)
      acc
      (sum-even-fibs-tail limit
                          b
                          (+ a b)
                          (if (evenp a) (+ acc a) acc))))
