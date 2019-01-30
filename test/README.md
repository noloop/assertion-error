# assertion-error Test

## How to test assertion-error?

It's quite simple, in REPL:

```lisp
(asdf:test-system :assertion-error)
```

If "T" is returned because it passed, if "nil" is returned because it failed. The test is still pretty simple and trite.