(in-package #:cl-user)
(defpackage #:noloop.assertion-error-test
  (:use #:common-lisp)
  (:nicknames #:assertion-error-test)
  (:import-from #:assertion-error
                #:assertion-error
	        #:get-stack-trace
                #:assertion-error-message
                #:assertion-error-result
                #:assertion-error-actual
                #:assertion-error-expected
                #:assertion-error-stack))
(in-package #:noloop.assertion-error-test)

;; Simple assertion library
(defun is-t? (actual)
  (assertion (equal t actual) actual t 'equal))

(defun is-nil? (actual)
  (assertion (equal nil actual) actual nil 'equal))

(defun assertion (result actual expected operator)
  (unless result
    (error 'assertion-error
           :assertion-error-message (concatenate 'string (string actual) " " (string operator) " " (string expected))
           :assertion-error-result result
           :assertion-error-actual actual
           :assertion-error-expected expected
           :assertion-error-stack (get-stack-trace))))

;; Simple Test Runner
(defun run ()
   (handler-case (is-t? nil)
     (assertion-error (c) 
       (format t "Test result: ~a" (and (string= "NIL EQUAL T" (assertion-error-message c))
                                         (equal nil (assertion-error-result c))
                                         (equal nil (assertion-error-actual c)) 
                                         (equal t (assertion-error-expected c)))))))

