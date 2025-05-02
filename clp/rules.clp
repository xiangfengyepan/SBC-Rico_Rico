(defrule generar-menu

   ?cliente <- (object (is-a Cliente)
                 (precioMaximo ?max)
                 (precioMinimo ?min))
   ?primer <- (object (is-a Primer_Plato) (precioPlato ?precio-primer))
   ?segundo <- (object (is-a Segundo_Plato) (precioPlato ?precio-segundo))
   ?postre <- (object (is-a Postre) (precioPlato ?precio-postre))
   ?bebida <- (object (is-a Bebida) (precioBebida ?precio-bebida))
   
   =>
   (bind ?precio-total (+ ?precio-primer ?precio-segundo ?precio-postre ?precio-bebida))
   (if (and (<= ?precio-total ?max) (>= ?precio-total ?min)) then
      (make-instance [menu-generado] of Menu
         (tienePlato ?primer ?segundo ?postre)
         (tieneBebida ?bebida)
         (tienePrecio ?precio-total))
      
      (printout t "Menú generado:" crlf)
      (printout t "  Primer plato: " ?primer crlf)
      (printout t "  Segundo plato: " ?segundo crlf)
      (printout t "  Postre: " ?postre crlf)
      (printout t "  Bebida: " ?bebida crlf)
      (printout t "  Precio total: " ?precio-total crlf crlf)
   )
)