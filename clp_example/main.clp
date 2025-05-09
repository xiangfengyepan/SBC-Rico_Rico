(load "template.clp")
(load "utils.clp")
(load "rules.clp")
(load "facts.clp")
(load "instancias/primeros-platos.clp")
(load "instancias/segundos-platos.clp")
(load "instancias/postres.clp")
(load "instancias/bebidas.clp")


; (watch activations)
; (watch rules)
; (watch facts)

(saludo-inicial)
(reset)

; (facts)

(run-con-info)
(seleccionar-tres-menus 20 25)

(exit)


