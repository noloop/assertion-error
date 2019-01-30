# assertion-error

### Error pattern for assertion libraries in Common Lisp.

## Getting Started in assertion-error

### Installation

The assertion-error system has only one dependency, which is the [dissect](https://github.com/Shinmera/dissect) system, I do not know if it will depend forever on this library, but for now it is necessary, since Common Lisp does not have a standard to get the stack trace.

**1 - Download the dissect system**

By quicklisp:

```
http://quickdocs.org/dissect/
```
or directly from github:

```
git clone https://github.com/Shinmera/dissect.git
```

**2 - Download assertion-error system**

By quicklisp:

```
IN PROGRESS...
```

or directly from github:

```
git clone https://github.com/noloop/assertion-error.git
```

**3 - Install assertion-error**

By quicklisp:

```
IN PROGRESS...
```

or directly from asdf:

```lisp
(asdf:load-system :assertion-error)
```

_**Note: Remember to configure asdf to find your directory where you downloaded the libraries (asdf call them "systems") above, if you do not know how to make a read at: https://lisp-lang.org/learn/writing-libraries.**_

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

**condition assertion-error**

**function (get-stack-trace)**

**generic function (assertion-error-message)**

**generic function (assertion-error-result)**

**generic function (assertion-error-actual)**

**generic function (assertion-error-expected)**

**generic function (assertion-error-stack)**

