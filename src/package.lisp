(in-package #:cl-user)
   (defpackage #:noloop.assertion-error
       (:use #:common-lisp)
         (:nicknames #:assertion-error)
	   (:export #:assertion-error
		    #:get-stack-trace))
(in-package #:noloop.assertion-error)
