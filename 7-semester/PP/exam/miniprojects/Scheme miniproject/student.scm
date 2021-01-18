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