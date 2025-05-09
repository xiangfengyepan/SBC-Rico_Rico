(defmodule analisis (import MAIN ?ALL) (export ?ALL))

(defrule vegetarian-only
    ?ingrediente <- (object (is-a Ingrediente) (esOrigenVegetariano "false"))
    =>
    (send ?ingrediente delete)
)

(defrule analisis::done => (focus sintesis))
