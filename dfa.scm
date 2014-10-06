;state들을 입력 받음.
(display "1. state들을 입력하세요. ex) (e 0 1 2 3 4)\n")
(define q (read))

;alphabet을 입력 받음.
(display "2. alphabet을 입력하세요. ex) (0 1 2)\n")
(define alphabet (read))

;transition function을 입력 받음.
(display "3. transition function을 입력하세요. ex) ((e 0 0) (e 1 1) (1 2 0) ...)\n")
;(display "3. transition function을 입력하세요. ex) ((e ((0 0) (1 1))) (1 ((0 3) (1 4) (2 0))) ...)\n")
(define tf (read))

;initial state를 입력 바음.
(display "4. initial state를 입력하세요. ex) e\n")
(define state (read))

;final state들을 입력 바음.
(display "5. final state들을 입력하세요. ex) (0)\n")
(define f (read))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display "string을 입력하세요. ex) 120\n")
(define input (read))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;tf를 미리 작업해놓을까? 어떤 ds를 사용하지
;;((state1 ((a1 q1) (a2 q2) (a3 q3) ... )) (state2 ((a1 q1) (a2 q2) ...)))
;;(define (transit str)
;;  (if (empty? str)
;;      state
;;      (if (not (in (car str) q))
;;          'deadstate
;;          (begin (set! state next)
;;                 (transit (cdr str))))))
;;              
;;(if (in (transit input) f)
;;    (display "네.\n")
;;    (display "아니오.\n"))
