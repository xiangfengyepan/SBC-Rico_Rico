(defmodule sintesis (import MAIN ?ALL) (export ?ALL))

(defrule eliminar-platos-incompletos
    ?plato <- (object (is-a Plato) (tieneIngrediente $? ?ingrediente $?))
    (not (object (is-a Ingrediente) (name ?ingrediente)))
    =>
    (send ?plato delete)
)

(defrule generar-menus
    ?primer <- (object (is-a Primer_Plato) (precioComida ?precio-primer))
    ?segundo <- (object (is-a Segundo_Plato) (precioComida ?precio-segundo))
    ?postre <- (object (is-a Postre) (precioComida ?precio-postre))
    ?bebida <- (object (is-a Bebida) (precioComida ?precio-bebida))

    ; Only generate if it does not already exists
    (not (object (is-a Menu)
        (tienePlato ?primer ?segundo ?postre)
        (tieneBebida ?bebida)))

    =>

    (bind ?precio-total (+ ?precio-primer ?precio-segundo ?precio-postre ?precio-bebida))

    (make-instance of Menu
        (tienePlato ?primer ?segundo ?postre)
        (tieneBebida ?bebida)
        (precioMenu ?precio-total))
)

(defrule limitar-precio-menu
    ?cliente <- (object (is-a Cliente)
        (precioMaximo ?max)
        (precioMinimo ?min))
    =>
    ; TODO
    ; (and (>= (send ?m get-precioMenu) ?min)
    ;                          (<= (send ?m get-precioMenu) ?max))
)

(defrule sintesis::done => (focus output))
