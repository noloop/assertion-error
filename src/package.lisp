(in-package #:cl-user)
   (defpackage #:noloop.assertion-error
       (:use #:common-lisp)
       (:nicknames #:assertion-error)
       (:import-from #:dissect
                     #:stack)
       (:export #:assertion-error
		#:get-stack-trace
                #:assertion-error-message
                #:assertion-error-result
                #:assertion-error-actual
                #:assertion-error-expected
                #:assertion-error-stack))
(in-package #:noloop.assertion-error)
