# assertion-error

## Error pattern for assertion libraries in Common Lisp.

### Getting Started in assertion-error

#### Capture assertion-error
```lisp
(handler-case (is-t? nil)
    (assertion-error (c) 
       (format t "result: ~a" (result c))))
```
#### Create assertion with assertion-error
```lisp
(defun is-t? (actual)
  (assertion (equal t actual) actual t 'equal))

(defun is-nil? (actual)
  (assertion (equal nil actual) actual nil 'equal))

(defun assertion (result actual expected operator)
  (unless result
    (error 'assertion-error
           :message (concatenate 'string (string actual) " " (string operator) " " (string expected))
           :result result
           :actual actual
           :expected expected
           :stack (get-stack-trace))))
```
## API

**condition 'assertion-error ...**
**function (get-stack-trace)**

