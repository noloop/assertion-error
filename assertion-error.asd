;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defsystem :assertion-error
  :author "noloop <noloop@zoho.com>"
  :maintainer "noloop <noloop@zoho.com>"
  :license "GNU General Public License v3.0"
  :version "0.0.0"
  :homepage "https://github.com/noloop/assertion-error"
  :bug-tracker "https://github.com/noloop/assertion-error/issues"
  :source-control (:git "git@github.com:noloop/assertion-error.git")
  :description "Error pattern for assertion libraries."
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "file1" :depends-on ("package"))
                 (:file "file2" :depends-on ("package" "file1")))))
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op "assertion-error/test"))))

(defsystem :assertion-error/test
  :author "noloop <noloop@zoho.com>"
  :maintainer "noloop <noloop@zoho.com>"
  :license "GNU General Public License v3.0"
  :description "assertion-error Test."
  :depends-on (:assertion-error)
  :components ((:module "test"
                :components
                ((:file "test-run"))))
  :perform (test-op (o c) ())))
