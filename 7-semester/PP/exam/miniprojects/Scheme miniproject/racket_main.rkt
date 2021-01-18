#lang R5RS

; Open file and read to create list of students
(define student-file (open-input-file "all-students.lsp"))
(define student-list (read student-file))

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
    (cond   ((equal? string "male") #t)
            ((equal? string "female") #t)
            #f
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
            #t
    )
)