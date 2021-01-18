#lang racket



; Student
(define (create-student studynumber name gender nationality age)
    (list studynumber name gender nationality age))

(define (get-id student)
    (list-ref student 0))

(define (get-name student)
    (list-ref student 1))

(define (get-gender student)
    (list-ref student 2))
    
(define (get-nationality student)  
    (list-ref student 3))
    
(define (get-age student)
    (list-ref student 4))

(define (gender? string)
    (cond   ((equal? string "male")     #t)
            ((equal? string "female")   #t)
            (else                       #f)
    )
)

(define (student? student)
    (cond   ((not (list? student))                      #f)
            ((not (= (length student) 5))               #f)
            ((not (string? (get-id student)))           #f)
            ((not (string? (get-name student)))         #f)
            ((not (string? (get-gender student)))       #f)
            ((not (string? (get-nationality student)))  #f)
            ((not (integer? (get-age student)))         #f)
            (else                                       #t)
    )
)

(define (student-list? students)
    (cond 
        ((not (list? students)) #f)
        ((null? students)       #f)
        (else (student-list?-loop students))
    )
)

(define (student-list?-loop students)
    (cond 
        ((null? students)                   #t)
        ((not (student? (car students)))    #f)
        (else (student-list?-loop (cdr students)))
    )
)


; Open file and read to create list of students
(define student-file (open-input-file "all-students.lsp"))
(define student-list (read student-file))

; Lazy definition of integer list: empty list is also integer list
(define (integer-list? lst)
    (cond   ((null? lst)                #t)
            ((not (integer? (car lst))) #f)
            (else integer-list? (cdr lst))
    )
)

(define (remove-item-from-list lst index)
    (cond   ((not (list? lst))                              #f)
            ((not (and (> index 0) (> (length lst) index))) #f)
            (else
                (append 
                    (reverse (list-tail (reverse lst) (- (length lst) index)))
                    (list-tail lst (+ index 1))
                )
            )
    )
)


(define (make-random-group students random-student remaining-group-size res group-number)
    (cond   ((= remaining-group-size 0)     res)
            (else   (make-random-group 
                        (remove-item-from-list students random-student)
                        (random 0 (- (length students) 1))
                        ((- remaining-group-size 1))
                        (append res (cons group-number (list-ref students random-student)))
                        (group-number)
                    )
            )
    )
)


