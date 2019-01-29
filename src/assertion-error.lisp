(in-package #:assertion-error)

(define-condition assertion-error (error)
  ((message :initarg :message :reader message)
   (result :initarg :result :reader result)
   (actual :initarg :actual :reader actual)
   (expected :initarg :expected :reader expected)
   (stack :initarg :stack :reader stack)))

(defun get-stack-trace ()
  #+sbcl (sb-debug:list-backtrace)
  #+clisp (with-output-to-string (s) (system::print-backtrace :out s))
  #+cmu (debug:backtrace)
  #+mcl (ccl:print-call-history)
  #+excl (tpl::zoom-print-stack-1 stream 20))
  ;abcl, cll, clasp, ecl, mezzano, mkcl
