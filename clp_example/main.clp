(load "template.clp")
(load "utils.clp")
(load "rules.clp")
(load "facts.clp")
(load "primeros-platos.clp")
(load "segundos-platos.clp")
(load "postres.clp")
(load "bebidas.clp")


; (watch activations)
; (watch rules)
; (watch facts)

(saludo-inicial)
(reset)

; (facts)

(run-con-info)
(seleccionar-tres-menus 20 25)

(exit)


