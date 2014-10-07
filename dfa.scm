;state들을 입력 받음.
(display "1. state들을 입력하세요. ex) (e 0 1 2 3 4)\n")
;(define q (read))

;alphabet을 입력 받음.
(display "2. alphabet을 입력하세요. ex) (0 1 2)\n")
;(define alphabet (read))

;transition function을 입력 받음.
(display "3. transition function을 입력하세요. ex) ((e ((0 0) (1 1))) (1 ((0 3) (1 4) (2 0))) ...)\n")
;(define tf (read))

;initial state를 입력 바음.
(display "4. initial state를 입력하세요. ex) e\n")
;(define init (read))

;final state들을 입력 바음.
(display "5. final state들을 입력하세요. ex) (0)\n")
;(define f (read))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (search key dic)
  (if (null? dic)
    #f
    (let ((entry (car dic)))
      (if (eq? key (car entry))
        (cadr entry)
        (search key (cdr dic))))))
 
(define (transit1 q a)
  (let ((qtf (search q tf)))
    (if qtf
      (search a (cdr qtf))
      #f)))

(define (transit q w)
  (if (null? w)
    q
    (if q ; dead state is represented by #f 
        (transit (transit1 q (car w)) (cdr w))
        #f)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (char->wanted c)
  (if (or (char<=? #\0 c) (char<=? c #\9))
    (- (char->integer c) 48)
    ((string->symbol (list->string (list c))))))

(define (input->list in)
;  (map char->wanted
       (string->list (if (number? in)
                       (number->string in)
                       (symbol->string in))))

;(define (loop)
;  (display "string을 입력하세요. ex) 120\n")
;  (let ((result (transit init (input->list (read)))))
;    (if (and result (in result f))
;      (display "네.\n")
;      (display "아니오.\n")))
;  (loop))

;(loop)
(define (loop)
    (display (input->list (read)))
    (loop))
(loop)
