(in-package #:assertion-error)

(define-condition assertion-error (error)
  ((assertion-error-message :initarg :assertion-error-message :reader assertion-error-message)
   (assertion-error-result :initarg :assertion-error-result :reader assertion-error-result)
   (assertion-error-actual :initarg :assertion-error-actual :reader assertion-error-actual)
   (assertion-error-expected :initarg :assertion-error-expected :reader assertion-error-expected)
   (assertion-error-stack :initarg :assertion-error-stack :reader assertion-error-stack)))

(defun get-stack-trace ()
  (stack))
