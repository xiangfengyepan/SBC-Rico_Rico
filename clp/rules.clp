(defrule generar-menu
   ;; Customer preferences
   ?cliente <- (Cliente
                 (prefiereEstilo $?estilo)
                 (esVegetariano ?veg)
                 (precioMaximo ?max)
                 (precioMinimo ?min))
   
   ;; Event information
   ?evento <- (Evento
               (numeroComersales ?comensales))
   
   ;; Current season
   ?temporada-actual <- (Temporada)

   ;; First course
   ?primer <- (Primer_Plato
               (nombre ?nombre-primer)
               (esTradicionalDe $?regiones-primer)
               (tieneComplejidad ?complejidad-primer)
               (tieneIngrediente $?ingredientes-primer)
               (tieneTipoPlato $?tipo-primer)
               (esCaliente ?caliente-primer)
               (precioPlato ?precio-primer)
               (esCompatibleCon $?compatibles-primer)
               (esCompatibleConBebida $?bebidas-compatibles-primer))
   
   ;; Second course
   ?segundo <- (Segundo_Plato
                (nombre ?nombre-segundo)
                (esTradicionalDe $?regiones-segundo)
                (tieneComplejidad ?complejidad-segundo)
                (tieneIngrediente $?ingredientes-segundo)
                (tieneTipoPlato $?tipo-segundo)
                (esCaliente ?caliente-segundo)
                (precioPlato ?precio-segundo)
                (esCompatibleCon $?compatibles-segundo)
                (esCompatibleConBebida $?bebidas-compatibles-segundo))
   
   ;; Dessert
   ?postre <- (Postre
               (nombre ?nombre-postre)
               (esTradicionalDe $?regiones-postre)
               (tieneComplejidad ?complejidad-postre)
               (tieneIngrediente $?ingredientes-postre)
               (tieneTipoPlato $?tipo-postre)
               (esCaliente ?caliente-postre)
               (precioPlato ?precio-postre)
               (esCompatibleCon $?compatibles-postre)
               (esCompatibleConBebida $?bebidas-compatibles-postre))
   
   ;; Drink compatible with all courses
   ?bebida <- (Bebida
               (nombre ?nombre-bebida)
               (precioBebida ?precio-bebida))
   
   ;; Check vegetarian preference
   (test (or (eq ?veg no)
             (and (eq ?veg si)
                  (member$ (create$ si) (find-all-slots ?ingredientes-primer esOrigenVegetariano))
                  (member$ (create$ si) (find-all-slots ?ingredientes-segundo esOrigenVegetariano))
                  (member$ (create$ si) (find-all-slots ?ingredientes-postre esOrigenVegetariano)))))
   
   ;; Check compatibility between courses
   (test (member$ ?nombre-segundo ?compatibles-primer))
   (test (member$ ?nombre-postre ?compatibles-segundo))
   
   ;; Check drink compatibility
   (test (member$ ?nombre-bebida ?bebidas-compatibles-primer))
   (test (member$ ?nombre-bebida ?bebidas-compatibles-segundo))
   (test (member$ ?nombre-bebida ?bebidas-compatibles-postre))
   
   ;; Check price range
   (bind ?precio-total (+ ?precio-primer ?precio-segundo ?precio-postre ?precio-bebida))
   (test (<= ?precio-total ?max))
   (test (>= ?precio-total ?min))
   
   ;; Check preferred style
   (test (intersection$ ?estilo (find-all-slots (list ?primer ?segundo ?postre) tieneEstilo)))
   
   =>
   (assert (Menu
            (nombre "Menú personalizado")
            (tienePlato ?primer ?segundo ?postre)
            (tieneBebida ?bebida)
            (tienePrecio ?precio-total)))
   
   (printout t "Menú generado:" crlf)
   (printout t "  Primer plato: " ?nombre-primer crlf)
   (printout t "  Segundo plato: " ?nombre-segundo crlf)
   (printout t "  Postre: " ?nombre-postre crlf)
   (printout t "  Bebida: " ?nombre-bebida crlf)
   (printout t "  Precio total: " ?precio-total crlf crlf)
   
)

;; Helper function to get slot values from multiple instances
(deffunction find-all-slots (?instances ?slot)
   (bind ?result (create$))
   (foreach ?instance ?instances
      (bind ?values (send ?instance get-?slot))
      (foreach ?value ?values
         (bind ?result (create$ ?result ?value))))
   (return ?result))