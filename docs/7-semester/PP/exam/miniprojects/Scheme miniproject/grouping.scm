(define (remove-item-from-list lst index)
    (cond   ((not (list? lst))                              (error "not a list"))
            ((not (and (>= index 0) (> (length lst) index))) (error (string-append "index out of bounds - " (number->string index))))
            (else
                (append 
                    (reverse (list-tail (reverse lst) (- (length lst) index)))
                    (list-tail lst (+ index 1))
                )
            )
    )
)


(define (make-random-grouping-part students random-student remaining-group-size res group-number)
    (cond   ((= remaining-group-size 0)     (cons students res))
            (else   (make-random-grouping-part 
                        (remove-item-from-list students random-student)
                        (if (= (length students) 1) 0 (random 0 (- (length students) 1)))
                        (- remaining-group-size 1)
                        (cons (cons group-number (list-ref students random-student)) res)
                        group-number
                    )
            )
    )
)

(define (random-grouping-helper students remaining-group-sizes group-number res)
    (cond   ((null? remaining-group-sizes)  res)
            (else   (let    ((students-and-res   
                                (make-random-grouping-part 
                                    students
                                    (random 0 (length students))
                                    (car remaining-group-sizes)
                                    '()
                                    group-number
                                )
                            )) 
                            (random-grouping-helper 
                                (car students-and-res)
                                (cdr remaining-group-sizes)
                                (+ group-number 1)
                                (append res (cdr students-and-res))
                            )
                    )   
            )
    )
)

(define (random-grouping students group-sizes)
    (cond   ((not (student-list? students))     (error "not a student list"))
            ((not (integer-list? group-sizes))  (error "not an integer list"))
            ((not (equal?   (length students) 
                            (reduce-right + group-sizes)
            ))                                  (error "group-sized does not add up to number of students"))
            (else   (random-grouping-helper
                        students
                        group-sizes
                        1
                        '()
                    )
            ) 
    )
)

(define (grouping? grouping) 
    (cond   ((not (list? grouping))     #f)
            (else (grouping?-helper grouping))
    )
)

(define (grouping?-helper grouping) 
    (cond   ((null? grouping)                           #t)
            ((not (list? (car grouping)))               #f) 
            ((not (integer? (car (car grouping))))      #f)
            ((not (student? (cdr (car grouping))))      #f)
            (else (grouping?-helper (cdr grouping)))
    )
)

(define (get-group grouping number)
    (if (grouping? grouping)
        (create-group number 
            (map    
                    (lambda (element) (cdr element))
                    (filter (lambda (element) 
                        (= (car element) number))
                        grouping
                    )
            )
        )
        (error "not a grouping")
    )
)

(define (get-group-count grouping)
    (get-group-count-helper grouping '())
)

(define (get-group-count-helper grouping groups-seen)
    (cond   ((null? grouping) (length groups-seen))
            (else   (get-group-count-helper 
                    (cdr grouping) 
                    (if (find-in-list   (lambda (element) 
                                            (= element (car (car grouping)))
                                        ) 
                                        groups-seen
                        )
                        groups-seen
                        (cons (car (car grouping)) groups-seen)
                    )
                )
            )
    )
)
