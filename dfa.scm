;state들을 입력 받음.
(display "1. state들을 입력하세요. ex) (e 0 1 2 3 4)\n")
(define q (read))

;alphabet을 입력 받음.
(display "2. alphabet을 입력하세요. ex) (0 1 2)\n")
(define alphabet (read))

;transition function을 입력 받음.
;(display "3. transition function을 입력하세요. ex) ((e 0 0) (e 1 1) (1 2 0) ...)\n")
(display "3. transition function을 입력하세요. ex) ((e ((0 0) (1 1))) (1 ((0 3) (1 4) (2 0))) ...)\n")
(define tf (read))

;initial state를 입력 바음.
(display "4. initial state를 입력하세요. ex) e\n")
(define init (read))

;final state들을 입력 바음.
(display "5. final state들을 입력하세요. ex) (0)\n")
(define f (read))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display "string을 입력하세요. ex) 120\n")
(define input (read))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;tf를 미리 작업해놓을까? 어떤 ds를 사용하지
;;((state1 ((a1 q1) (a2 q2) (a3 q3) ... )) (state2 ((a1 q1) (a2 q2) ...)))
;;
(define (search key dic)
  (if (null? dic)
    #f
    (let ((entry (car dic)))
      (if (eq? key (car entry))
        (cadr entry)
        (search key (cdr dic))))))
  
;(define (search1 q tf_)
;  (if (null? tf_)
;    #f
;    (let ((tf_elem (car tf_)))
;        (if (eq? q (car tf_elem))
;            (cadr tf_elem)
;            (search1 q (cdr tf_))))))

;(define (search2 a qtf)
;  (if (null? qtf)
;    #f
;    (let ((qtf_elem (car qtf)))
;        (if (eq? a (car qtf_elem))
;            (cadr qtf_elem)
;            (search2 a (cdr qtf))))))
;;
(define (transit1 q a)
  (let ((qtf (search q tf)))
    (if qtf
      (search a (cdr qtf))
      #f)))
;;
;;
(define (transit curr str)
  (if (empty? str)
    curr
    (let ((next (transit1 curr (car str))))
      (if next
        (transit next (cdr str))
        'deadstate))))
;;              
;(define (transit curr str)
;  (if (empty? str)
;    curr
;    (let ((next (transit1 curr (car str))))
;      (if next
;        (transit next (cdr str))
;        'deadstate))))
;;
;;(if (in (transit init input) f)
;;    (display "네.\n")
;;    (display "아니오.\n"))
