(defmodule analisis (import MAIN ?ALL) (export ?ALL))

(defrule vegetarian
    (object (is-a Cliente) (esVegetariano TRUE))
    ?ingrediente <- (object (is-a Ingrediente) (esOrigenVegetariano FALSE))
    =>
    (send ?ingrediente delete)
)

(defrule lactosa
    (object (is-a Cliente) (esIntoleranteLactosa TRUE))
    ?ingrediente <- (object (is-a Comida) (contieneLactosa FALSE))
    =>
    (send ?ingrediente delete)
)

(defrule alcohol
    (object (is-a Cliente) (esAlcoholico FALSE))
    ?ingrediente <- (object (is-a Comida) (contieneAlcohol TRUE))
    =>
    (send ?ingrediente delete)
)

(defrule deporte-medio
    (object (is-a Cliente) (haceDeporte [Media]))
    ?ingrediente <- (object (is-a Comida) (tieneProteinas [Baja]))
    =>
    (send ?ingrediente delete)
)

(defrule deporte-alto
    (object (is-a Cliente) (haceDeporte [Alto]))
    ?ingrediente <- (object (is-a Comida) (tieneProteinas ?proteinas))
    (test (or (eq ?proteinas [Baja]) (eq ?proteinas [Media])))
    =>
    (send ?ingrediente delete)
)

(defrule analisis::done => (focus sintesis))
