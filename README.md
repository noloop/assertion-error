# assertion-error

### _Error pattern for assertion libraries in Common Lisp._

## Getting Started in assertion-error

### Dependencies

The assertion-error system has only one dependency, which is the [dissect](https://github.com/Shinmera/dissect) system,
I do not know if it will depend forever on this library, but for now it is necessary, since Common Lisp does not have a
standard to get the stack trace.

**Download the dissect system**

By quicklisp:

```
http://quickdocs.org/dissect/
```
or directly from github:

```
git clone https://github.com/Shinmera/dissect.git
```

### Download and load

**1 - Load assertion-error system by quicklisp**

```
(ql:quickload :assertion-error)
```

**2 - Download and load assertion-error system by github and asdf**

Download directly from github:

```
git clone https://github.com/noloop/assertion-error.git
```

and load by ASDF:

```lisp
(asdf:load-system :assertion-error)
```

_**Note: Remember to configure asdf to find your directory where you downloaded the libraries (asdf call them "systems") above, if you do not know how to make a read at: https://common-lisp.net/project/asdf/asdf/Configuring-ASDF-to-find-your-systems.html or https://lisp-lang.org/learn/writing-libraries.**_

### Create assertion with assertion-error

Use assertion-error when constructing your assertion library:

```lisp

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

```

### Catch assertion-error

Use assertion-error to build your test runner, where it can capture the errors of your assertion library which one also uses assertion-error:

```lisp
(handler-case (assert:is-t? nil)
   (assertion-error:assertion-error (c)
         (format t "~a" (assertion-error:assertion-error-actual c))))
```

## API

All generic functions below returns some information from the assertion-error condition. They have a required argument that is the assertion-error condition. Check out the [catch assertion-error example](https://github.com/noloop/assertion-error#catch-assertion-error) to understand how to use them.

condition **assertion-error**

function **(get-stack-trace)**

condition :reader **(assertion-error-message c)**

condition :reader **(assertion-error-result c)**

condition :reader **(assertion-error-actual c)**

condition :reader **(assertion-error-expected c)**

condition :reader **(assertion-error-stack c)**

