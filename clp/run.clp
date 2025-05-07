(load "main.clp")
(load "myOntology.clp")
(load "input.clp")
(load "rules.clp")

; (watch activations)
; (watch rules)
; (watch facts)


(reset)
; (instances)
(run)


; Para listar todas las instancias de la clase Menu
(do-for-all-instances ((?m Menu))
   (printout t crlf (send ?m print) crlf)
)

(exit)