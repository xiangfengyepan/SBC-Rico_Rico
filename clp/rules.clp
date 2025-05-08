(deffunction cumple-precio (?precio ?min ?max)
   (and 
      (or (eq ?min -1) (>= ?precio ?min))
      (or (eq ?max -1) (<= ?precio ?max))
   )
)

(defrule generar-menu
   ?cliente <- (object (is-a Cliente)
                 (precioMaximo ?max)
                 (precioMinimo ?min))

   ?primer <- (object (is-a Primer_Plato) (precioPlato ?precio-primer))
   ?segundo <- (object (is-a Segundo_Plato) (precioPlato ?precio-segundo))
   ?postre <- (object (is-a Postre) (precioPlato ?precio-postre))
   ?bebida <- (object (is-a Bebida) (precioBebida ?precio-bebida))

   (not (object (is-a Menu)
                (tienePlato ?primer ?segundo ?postre)
                (tieneBebida ?bebida)))
                
   =>
   (bind ?precio-total (+ ?precio-primer ?precio-segundo ?precio-postre ?precio-bebida))

   (if (cumple-precio ?precio-total ?min ?max) then
      (make-instance of Menu
         (tienePlato ?primer ?segundo ?postre)
         (tieneBebida ?bebida)
         (tienePrecio ?precio-total))
   )
)