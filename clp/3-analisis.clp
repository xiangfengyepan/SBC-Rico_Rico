(defmodule analisis (import MAIN ?ALL) (export ?ALL))

(defrule menor
    (object (is-a Cliente) (tieneEdad ?edad))
    ?ingrediente <- (object (is-a Comida) (contieneAlcohol TRUE))
    (test (< ?edad 18))
    =>
    (send ?ingrediente delete)
)

(defrule vegetarian
    (object (is-a Cliente) (esVegetariano TRUE))
    ?ingrediente <- (object (is-a Ingrediente) (esOrigenVegetariano FALSE))
    =>
    (send ?ingrediente delete)
)

(defrule alcoholico
    (object (is-a Cliente) (esAlcoholico FALSE))
    ?ingrediente <- (object (is-a Comida) (contieneAlcohol TRUE))
    =>
    (send ?ingrediente delete)
)

(defrule lactosa
    (object (is-a Cliente) (esIntoleranteLactosa TRUE))
    ?ingrediente <- (object (is-a Comida) (contieneLactosa TRUE))
    =>
    (send ?ingrediente delete)
)

(defrule deporte-bajo-primer
    (object (is-a Cliente) (haceDeporte [Baja]))
    ?plato <- (object (is-a Primer_Plato) (tieneAzucar  [Alta]))
    =>
    (send ?plato delete)
)

(defrule deporte-bajo-segundo
    (object (is-a Cliente) (haceDeporte [Baja]))
    ?plato <- (object (is-a Segundo_Plato) (tieneAzucar  [Alta]))
    =>
    (send ?plato delete)
)

(defrule deporte-medio-primer
    (object (is-a Cliente) (haceDeporte [Media]))
    ?plato <- (object (is-a Primer_Plato) (tieneProteinas [Baja]) (tieneAzucar  [Baja]))
    =>
    (send ?plato delete)
)

(defrule deporte-medio-segundo
    (object (is-a Cliente) (haceDeporte [Media]))
    ?plato <- (object (is-a Segundo_Plato) (tieneProteinas [Baja]) (tieneAzucar  [Baja]))
    =>
    (send ?plato delete)
)


(defrule deporte-alto-proteinas
    (object (is-a Cliente) (haceDeporte [Alta]))
    ?plato <- (object (is-a Plato) (tieneProteinas [Baja]) (tieneCarbohidratos  [Baja]))
    =>
    (send ?plato delete)
)

(defrule deporte-alto-azucar
    (object (is-a Cliente) (haceDeporte [Alta]))
    ?plato <- (object (is-a Plato) (tieneAzucar  [Baja]) (tieneProteinas [Baja]))

    =>
    (send ?plato delete)
)


(defrule menu-clasico
    (object (is-a Cliente) (prefiereEstilo [Clasico]))
    ?plato <- (object (is-a Plato) (anoCreacion ?creacion))
    (test (< 2000 ?creacion))
    =>
    (send ?plato delete)
)

(defrule menu-moderno
    (object (is-a Cliente) (prefiereEstilo [Moderno]))
    ?plato <- (object (is-a Plato) (anoCreacion ?creacion))
    (test (< ?creacion 1900))
    =>
    (send ?plato delete)
)

(defrule menu-regional
    (object (is-a Cliente) (prefiereEstilo [Regional]))
    ?plato <- (object (is-a Plato) (tieneIngrediente $?ingredientes))
    =>
    ; if plato.ingredientes.filter(ing => not ing.esRegional).length > 1
    (bind ?no-regional (find-all-instances ((?i Ingrediente)) (and (member$ ?i $?ingredientes) (not ?i:esRegional))))
    (if (> (length$ ?no-regional) 1) then (send ?plato delete))
)

(defrule menu-sibarita
    (object (is-a Cliente) (prefiereEstilo [Sibarita]))
    ?plato <- (object (is-a Plato) (racionesMinimalistas FALSE))
    =>
    (send ?plato delete)
)

(defrule temporada
    (object (is-a Evento) (esTemporadaEvento ?temporadaEvento))
    ?plato <- (object (is-a Plato) (tieneIngrediente $?ingredientes))
    =>
    ; if plato.ingredientes.filter(ing => not ing.temporadas.includes(temporadaEvento)).length > 1
    (bind ?no-temporada 
        (find-all-instances ((?i Ingrediente)) 
            (and 
                (member$ ?i $?ingredientes)
                (> (length$ ?i:esTemporada) 0)
                (not (member$ ?temporadaEvento ?i:esTemporada))
            )
        )
    )
    (if (> (length$ ?no-temporada) 2) then (send ?plato delete))
)

(defrule complejidad-alta
    (object (is-a Evento) (numeroComersales ?numeroComersales))
    ?ingrediente <- (object (is-a Comida) (tieneComplejidad [Alta]))
    (test (> ?numeroComersales 10))
    =>
    (send ?ingrediente delete)
)

(defrule complejidad-media
    (object (is-a Evento) (numeroComersales ?numeroComersales))
    ?ingrediente <- (object (is-a Comida) (tieneComplejidad [Media]))
    (test (> ?numeroComersales 50))
    =>
    (send ?ingrediente delete)
)

; Bautizo, Familiar, Bautizo => evento con niños => No Alcohol
(defrule evento-con-menores
    (or (object (is-a Familiar)) (object (is-a Comunion))  (object (is-a Bautizo)))
    ?comida <- (object (is-a Comida) (contieneAlcohol TRUE))
    =>
    (send ?comida delete)
)

; Boda => evvitar comida casual 
(defrule boda
    (object (is-a Boda))
    ?comida <- (object (is-a Comida) (precioComida ?precio))
    (test (< ?precio 300))
    =>
    (send ?comida delete)
)

(defrule eventos-simples
    (object (is-a Evento) (numeroComersales ?numeroComersales))
    (or (object (is-a Familiar)) (object (is-a Congreso)))
    ?ing <- (object (is-a Comida) (tieneComplejidad [Alta]))
    (test (> ?numeroComersales 4))
    =>
    (send ?ing delete)
)

(defrule analisis::done => (focus sintesis))
