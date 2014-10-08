;state들을 입력 받음.
(display "1. state들을 입력하세요. ex) (e 0 1 2 3 4)\n")
;(define q (read))
(define q '(0 1 2 3))

;alphabet을 입력 받음.
(display "2. alphabet을 입력하세요. ex) (0 1 2)\n")
;(define alphabet (read))
(define alphabet '(0 1))

;transition function을 입력 받음.
(display "3. transition function을 입력하세요. ex) ((e [(0 0) (1 1)]) (1 [(0 3) (1 4) (2 0)]) ...)\n")
;(define tf (read))
(define tf '((0 ((0 1) (1 0))) (1 ((0 1) (1 2))) (2 ((0 1) (1 3))) (3 ((0 1) (1 0)))))

;initial state를 입력 바음.
(display "4. initial state를 입력하세요. ex) e\n")
;(define init (read))
(define init 0)

;final state들을 입력 바음.
(display "5. final state들을 입력하세요. ex) (0)\n")
;(define f (read))
(define f '(3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (search key dic)
  (if (null? dic)
    #f
    (let ((entry (car dic)))
      (if (eq? key (car entry))
        (cadr entry)
        (search key (cdr dic))))))
 
(display (search 0 tf))
(newline)
(display (search 1 tf))
(newline)
(display (search 2 tf))
(newline)
(display (search 3 tf))
(newline)
(newline)

(define (transit1 q a)
  (let ((qtf (search q tf)))
    (if qtf
      (search a qtf)
      #f)))

(display (transit1 0 0))
(display (transit1 0 1))
(display (transit1 1 0))
(display (transit1 1 1))
(display (transit1 2 0))
(display (transit1 2 1))
(display (transit1 3 0))
(display (transit1 3 1))
(newline)
(newline)

(define (transit q w)
  (if (null? w)
    q
    (if q ; dead state is represented by #f 
        (transit (transit1 q (car w)) (cdr w))
        #f)))

(display (transit 0 '(0 1 1)))
(newline)
(display (transit 1 '(0 1 1)))
(newline)
(display (transit 2 '(0 1 1)))
(newline)
(display (transit 3 '(0 1 1)))
(newline)
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (char->wanted c)
  (if (and (char<=? #\0 c) (char<=? c #\9))
    (- (char->integer c) 48)
    (string->symbol (list->string (list c)))))

(display (number? (char->wanted (string-ref "011" 0))))
(newline)
(display (number? (char->wanted (string-ref "011" 1))))
(newline)
(display (symbol? (char->wanted (string-ref "abc" 0))))
(newline)
(display (number? (char->wanted (string-ref "0ab" 0))))
(newline)

(display (char->wanted (string-ref "011" 0)))
(newline)
(display (char->wanted (string-ref "011" 1)))
(newline)
(display (char->wanted (string-ref "abc" 0)))
(newline)
(display (char->wanted (string-ref "0ab" 0)))
(newline)

(define (input->list x)
  (map char->wanted (string->list x)))

;(display (input->list (read)))
;(newline)
;(display (input->list 'abc))
;(newline)
;(display (input->list '0ab))
;(newline)
;(newline)

(define (loop)
  (display "string을 입력하세요. ex) \"120\"\n")
  (let ((result (transit init (input->list (read)))))
    (display result)
    (if (and result (member result f))
      (display "네.\n")
      (display "아니오.\n")))
  (loop))

(loop)
;(loop)
;(define (loop)
;    (display (input->list (read)))
;    (loop))
;(loop)
