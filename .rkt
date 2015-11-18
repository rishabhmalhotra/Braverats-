(define Musician 0)
(define Princess 1)
(define Spy 2)
(define Assassin 3)
(define Ambassador 4)
(define Wizard 5)
(define General 6)
(define Prince 7)

;; Design Recipe:

;; Pupose:
;; (braverats A B) consumes two natural numbers and produces the winner 
;; of the battle as a symbol (capital ’A or ’B) or the symbol capital ’X to
;; indicate that the round of battle is “on hold”.

;; Contract:
;; braverats: Nat Nat -> Sym

;; Examples:
(check-expect (braverats 1 7) 'A)
(check-expect (braverats 1 5) 'B)


(define (braverats A B)
  
  (cond
    [(= A Musician)
     (cond
       [(= B Wizard) 'B]
       [else 'X])]
   
    [(= A Princess) 
     (cond
       [(or (= B Princess) (= B Musician)) 'X]
       [(or (= B General) (= B Wizard) (= B Ambassador) (= B Spy)) 'B]
       [else 'A])]
    
    [(= A Spy)
     (cond
       [(and (>= B Ambassador) (<= B Prince)) 'B]
       [(or (= B Assassin) (= B Princess)) 'A]
       [else 'X])]
    
    [(= A Assassin)
     (cond
       [(or (= B Prince) (= B Ambassador) (= B Spy) (= B Princess)) 'B]
       [(or (= B General) (= B Ambassador)) 'A]
       [else 'X])]
    
    [(= A Ambassador)
     (cond
       [(or (= B Prince) (= B General) (= B Wizard) (= B Assassin)) 'B]
       [(or (= B Spy) (= B Princess)) 'A]
       [else 'X])]
    
    [(= A Wizard)
     (cond
       [(or (= B Prince) (= B General)) 'B]
       [(= B Wizard) 'X]
       [else 'A])]

    [(= A General)
     (cond
       [(or (= B Prince) (= B Assassin)) 'B]
       [(or (= B General) (= B Musician)) 'X]
       [else 'A])]
   
    [(= A Prince)
     (cond
       [(or (= B Prince) (= B Musician)) 'X]
       [(= B Princess) 'B]
       [else 'A])]))

;;Tests:
(check-expect (braverats 0 5) 'B)
(check-expect (braverats 0 4) 'X)
(check-expect (braverats 1 7) 'A)
(check-expect (braverats 1 0) 'X)
(check-expect (braverats 2 7) 'B)
(check-expect (braverats 2 3) 'A)
(check-expect (braverats 2 2) 'X)
(check-expect (braverats 3 7) 'B)
(check-expect (braverats 3 6) 'A)
(check-expect (braverats 4 5) 'B)
(check-expect (braverats 4 2) 'A)
(check-expect (braverats 5 7) 'B)
(check-expect (braverats 5 5) 'X)
(check-expect (braverats 5 1) 'A)
(check-expect (braverats 6 7) 'B)
(check-expect (braverats 6 4) 'A)
(check-expect (braverats 7 7) 'X)
(check-expect (braverats 7 6) 'A)
(check-expect (braverats 7 1) 'B)
