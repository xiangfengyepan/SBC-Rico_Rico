(defmodule analisis (import MAIN ?ALL) (export ?ALL))

(defrule vegetarian-only
    (object (is-a Cliente) (esVegetariano TRUE))
    ?ingrediente <- (object (is-a Ingrediente) (esOrigenVegetariano FALSE))
    =>
    (send ?ingrediente delete)
)

(defrule analisis::done => (focus sintesis))
