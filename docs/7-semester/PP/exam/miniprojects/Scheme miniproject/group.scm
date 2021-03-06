; Holds all student data in group for memory/ease of programming trade off
(define (create-group id students)
    (cond   ((not (number? id))                 (error "id not a number"))
            ((not (student-list? students))     (error "students not a student list"))
            (else (cons id students))
    )
)

(define (group? group)
    (cond   ((not (pair? group))                #f)
            ((not (integer? (car group)))       #f)
            ((not (student-list? (cdr group)))  #f)
            (else                               #t)
    )
)

(define (get-group-number group)
    (if (group? group) 
        (car group) 
        (error "not a group"))
)

(define (get-students-from-group group)
    (if (group? group) 
        (cdr group) 
        (error "not a group"))
)
