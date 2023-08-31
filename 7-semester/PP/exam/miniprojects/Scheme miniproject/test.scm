(include "main.scm")

(define stud1 
    (create-student "1" "Stud1-name" "male" "Dansk" 24))

(define stud2 
    (create-student "2" "Stud2-name" "male" "Swedish" 22))

(define group1
    (create-group 1 (list stud1 stud2)))

(define r-grouping
    (random-grouping student-list '(20 20 20 20 20 20 20 20 20 5 5 5 5))
)