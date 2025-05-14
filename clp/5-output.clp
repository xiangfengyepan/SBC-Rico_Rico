(defmodule output (import MAIN ?ALL) (export ?ALL))


(deffunction output::rep-str (?count ?char)
    (if (<= ?count 0) then ""
        else (str-cat ?char (rep-str (- ?count 1) ?char))
    )
)

(deffunction output::format-money (?value)
    (return (format nil "%.2f€" (/ ?value 100)))
)

(deffunction center-text (?texto ?ancho)
    (bind ?longitud-texto (str-length ?texto))
    (if (<= ?ancho ?longitud-texto) then
        (printout t ?texto crlf)
    else
        (bind ?espacios-totales (- ?ancho ?longitud-texto))
        (bind ?espacios-izq (div ?espacios-totales 2))
        (if (neq (* 2 ?espacios-izq) ?espacios-totales) then
            (bind ?espacios-izq (+ ?espacios-izq 1))
        )
        (bind ?espacios-der (- ?espacios-totales ?espacios-izq))
        (bind ?texto-centrado (str-cat (output::rep-str ?espacios-izq " ") ?texto (output::rep-str ?espacios-der " ")))
        (printout t ?texto-centrado)
    )
)

(deffunction print-list-with-bullets (?title ?items ?indent ?bullet)
    (printout t ?indent "├─◦ " ?title ":" crlf)
    (if (> (length$ ?items) 0) then
        (progn
            (bind ?i 1)
            (while (<= ?i (length$ ?items)) do
                (printout t ?indent "│    " ?bullet (nth$ ?i ?items) crlf)
                (bind ?i (+ ?i 1))
            )
        )
        else (printout t ?indent "│    " ?bullet "Ningún elemento especificado" crlf)
    )
)

(deffunction output::ordenar-por-precio (?lista)
    (bind ?ordenada ?lista)
    (bind ?n (length$ ?ordenada))
    (while (> ?n 1) do
        (bind ?i 1)
        (while (< ?i ?n) do
            (bind ?a (nth$ ?i ?ordenada))
            (bind ?b (nth$ (+ ?i 1) ?ordenada))

            (bind ?precio-a (send ?a get-precioMenu))
            (bind ?precio-b (send ?b get-precioMenu))

            (if (> ?precio-a ?precio-b) then
                (bind ?ordenada (replace$ ?ordenada ?i (+ ?i 1) ?b ?a)))
            (bind ?i (+ ?i 1))
        )
        (bind ?n (- ?n 1))
    )
    (return ?ordenada)
)

(deffunction output::imprimir-plato (?comida)
    (bind ?nombre (instance-name ?comida))
    (bind ?clase (class ?comida))
    (bind ?titulo (str-cat ?nombre " (" ?clase ")"))
    (bind ?longitud-titulo (str-length ?titulo))
    
    (printout t crlf)

    (bind ?box-width 37)
    (printout t "   ┌" (rep-str ?box-width "─") "┐" crlf)

    (printout t "   │" (center-text ?titulo ?box-width) "│" crlf)  
    (printout t "   └─────────────────────────────────────┘" crlf)
    
    (bind ?ingredientes (send ?comida get-tieneIngrediente))
    (print-list-with-bullets "Ingredientes" ?ingredientes "     " "◦ ")

    (bind ?tiene-tipo (send ?comida get-tieneTipoComida))
    (print-list-with-bullets "Tipo de Comida" ?tiene-tipo "     " "◦ ")
    
    (bind ?compatibles (send ?comida get-esCompatibleCon))
    (print-list-with-bullets "Compatible con" ?compatibles "     " "◦ ")

    (printout t "     ├─◦ Alcohol: " (send ?comida get-contieneAlcohol) crlf)
    (printout t "     ├─◦ Lactosa: " (send ?comida get-contieneLactosa) crlf)
    (printout t "     ├─◦ Calorias: " (send ?comida get-tieneCalorias) crlf)
    (printout t "     ├─◦ Carbohidratos: " (send ?comida get-tieneCarbohidratos) crlf)
    (printout t "     ├─◦ Proteinas: " (send ?comida get-tieneProteinas) crlf)
    
    (printout t "     ├─◦ Origen: " (send ?comida get-esTradicionalDe) crlf)
    (printout t "     ├─◦ Complejidad: " (send ?comida get-tieneComplejidad) crlf)
    (printout t "     ├─◦ Temperatura: " 
        (if (eq (send ?comida get-esCaliente) TRUE) 
            then "Caliente" 
            else "Frío") 
        crlf)
    (printout t "     └─◦ Precio: " (format-money (send ?comida get-precioComida)) crlf)
)


(deffunction output::imprimir-menu (?menu)
    (bind ?platos (send ?menu get-tienePlato))
    (bind ?i 1)
    (while (<= ?i (length$ ?platos)) do
        (bind ?plato (nth$ ?i ?platos))
        (printout t "  ")
        (output::imprimir-plato (nth$ ?i ?platos))
        (bind ?i (+ ?i 1))
    )
    (bind ?bebida (send ?menu get-tieneBebida))
    (output::imprimir-plato ?bebida)

)

(deffunction print-menu-box (?menu ?type)
    (bind ?price-text (str-cat ?type " (" (format-money (send ?menu get-precioMenu)) ")"))
    (bind ?box-width 46)
    
    (printout t crlf)
    (printout t "┏" (rep-str ?box-width "━") "┓" crlf)
    (printout t "┃" (center-text ?price-text ?box-width) "┃" crlf)
    (printout t "┗" (rep-str ?box-width "━") "┛" crlf)
    
    (output::imprimir-menu ?menu)
)

(deffunction print-preferencia-cliente (?cliente)
    (bind ?box-width 46)

    (printout t "┏" (output::rep-str ?box-width "━") "┓" crlf)

    (bind ?title "PREFERENCIAS DEL CLIENTE")
    (printout t "┃" (output::center-text ?title ?box-width) "┃" crlf)

    (printout t "┣" (output::rep-str ?box-width "━") "┫" crlf)


    (printout t "┃" (output::center-text (str-cat "Es Alcoholico: " (send ?cliente get-esAlcoholico))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Es Vegetariano: " (send ?cliente get-esVegetariano))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Es Intolerante a la lactosa: " (send ?cliente get-esIntoleranteLactosa))  ?box-width) "┃" crlf)

    (printout t "┃" (output::center-text (str-cat "Grado de deporte: " (send ?cliente get-haceDeporte))  ?box-width) "┃" crlf)

    (printout t "┃" (output::center-text (str-cat "Prefiere Estilo: " (send ?cliente get-prefiereEstilo))  ?box-width) "┃" crlf)

    (bind ?evento (send ?cliente get-prefiereEvento))
    (printout t "┃" (output::center-text (str-cat "Evento: " (instance-name ?evento) 
        " de " (send ?evento get-numeroComersales) " personas en " (send ?evento get-esTemporadaEvento))  ?box-width) "┃" crlf)

    (bind ?price-text (str-cat "Rango de precios: " (format-money (send ?cliente get-precioMinimo)) " - " (format-money (send ?cliente get-precioMaximo))))
    (printout t "┃" (output::center-text ?price-text ?box-width) "┃" crlf)
    (printout t "┗" (output::rep-str ?box-width "━") "┛" crlf crlf)
)

(defrule output::mostrar-tres-menus-por-precio
    (declare (salience 10))
    ?cliente <- (object (is-a Cliente))
    =>
    (printout t crlf)

    (bind ?min (send ?cliente get-precioMinimo))
    (bind ?max (send ?cliente get-precioMaximo))
    (print-preferencia-cliente ?cliente)

    (bind ?todos-menus (find-all-instances ((?m Menu)) TRUE))

    (if (>= (length$ ?todos-menus) 1) then
        (bind ?ordenados (output::ordenar-por-precio ?todos-menus))
        (bind ?menu-barato (nth$ 1 ?ordenados))
        (bind ?menu-medio (nth$ (div (+ 1 (length$ ?ordenados)) 2) ?ordenados))
        (bind ?menu-caro (nth$ (length$ ?ordenados) ?ordenados))

        (print-menu-box ?menu-barato "MENÚ ECONÓMICO")
        (print-menu-box ?menu-medio "MENÚ INTERMEDIO")
        (print-menu-box ?menu-caro "MENÚ PREMIUM")
    else
        (printout t "  ⚠ No hay suficientes menús en el rango especificado" crlf crlf)
    )
)