(include "pp-functions.scm")
(include "student.scm")
(include "group.scm")
(include "grouping.scm")

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


