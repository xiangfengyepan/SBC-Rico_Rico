(defrule generar-menu
   ?prefs <- (Cliente
               (prefiereEstilo _)
               (prohibeIngrediente _)
               (esAlcohólico _)
               (esVegetariano _)
               (precioMaximo ?cpmax)
               (precioMinimo ?cpmin))


   ;; Platos compatibles
   ?p1 <- (Plato (esCompatibleCon _)
                 (esCompatibleConBebida _)
                 (esTradicionalDe _)
                 (tieneComplejidad _)
                 (tieneIngrediente _)
                 (esCaliente _)
                 (precioPlato ?pp1))

   ?p2 <- (Plato (esCompatibleCon _)
                 (esCompatibleConBebida _)
                 (esTradicionalDe _)
                 (tieneComplejidad _)
                 (tieneIngrediente _)
                 (esCaliente _)
                 (precioPlato ?pp2))

   ?p3 <- (Plato (esCompatibleCon _)
                 (esCompatibleConBebida _)
                 (esTradicionalDe _)
                 (tieneComplejidad _)
                 (tieneIngrediente _)
                 (esCaliente _)
                 (precioPlato ?pp3))

   ;; Tipos correctos
   (test (member$ primero ?t1))
   (test (member$ segundo ?t2))
   (test (member$ postre ?t3))


   ;; Rango de precios total
   (test (<= (+ ?pp1 ?pp2 ?pp3) ?cpmax))
   (test (>= (+ ?pp1 ?pp2 ?pp3) ?cpmin))

   =>
   (bind ?precio-total (+ ?pp1 ?pp2 ?pp3))

   (assert (Menu (tieneBebida _)
                 (tienePlato _)
                 (tienePrecio _)))

   ;; Imprimir el menú generado
   ; (printout t "Menu generado: " ?n1 ", " ?n2 ", " ?n3 ", bebida: " ?bnom ", precio: " ?precio-total crlf)
)


(defrule siempre-imprimir
   =>
   (printout t "Esta regla siempre se ejecuta." crlf)
)