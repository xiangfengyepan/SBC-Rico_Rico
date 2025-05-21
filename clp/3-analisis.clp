(defmodule analisis (import MAIN ?ALL) (export ?ALL))

(defrule vegetarian
    (object (is-a Cliente) (esVegetariano TRUE))
    ?ingrediente <- (object (is-a Ingrediente) (esOrigenVegetariano FALSE))
    =>
    (send ?ingrediente delete)
)

(defrule alcohol
    (object (is-a Cliente) (esAlcoholico FALSE))
    ?ingrediente <- (object (is-a Comida) (contieneAlcohol TRUE))
    =>
    (send ?ingrediente delete)
)

(defrule lactosa
    (object (is-a Cliente) (esIntoleranteLactosa TRUE))
    ?ingrediente <- (object (is-a Comida) (contieneLactosa FALSE))
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

(defrule menu-clasico
    (object (is-a Cliente) (prefiereEstilo [Clasico]))
    ; plato.año_creacion < 2000
    =>
    ; (send ?plato delete)
)

(defrule menu-moderno
    (object (is-a Cliente) (prefiereEstilo [Moderno]))
    ; plato.año_creacion > 2015
    =>
    ; (send ?plato delete)
)

(defrule menu-regional
    (object (is-a Cliente) (prefiereEstilo [Moderno]))
    ; number of ingredientes no regional de plato > 1
    =>
    ; (send ?plato delete)
)

(defrule menu-sibarita
    (object (is-a Cliente) (prefiereEstilo [Moderno]))
    ; plato.raciones_minimalistas = true
    =>
    ; (send ?plato delete)
)

(defrule temporada
    (object (is-a Evento) (esTemporadaEvento ?temporadaEvento))
    ?ingrediente <- (object (is-a Ingrediente) (esTemporada ?temporadaIng))
    ; temporadaEvento not in temporadaIng
    =>
    (send ?ingrediente delete)
)

(defrule analisis::done => (focus sintesis))
