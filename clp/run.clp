(load "myOntology.clp")
(load "main.clp")
(load "input.clp")
(load "rules.clp")
(load "output.clp")

; (watch activations)
; (watch rules)
; (watch facts)


(reset)

; (do-for-all-instances ((?m Plato))
;    (printout t crlf (send ?m print) crlf)
; )

; (do-for-all-instances ((?m Bebida))
;    (printout t crlf (send ?m print) crlf)
; )

(run)

; (do-for-all-instances ((?m Cliente))
;    (printout t crlf (send ?m print) crlf)
; )

; (do-for-all-instances ((?m Menu))
;    (printout t crlf (send ?m print) crlf)
; )




; Para listar todas las instancias de la clase Menu
; (do-for-all-instances ((?m Menu))
;    (printout t crlf (send ?m print) crlf)
; )

(exit)