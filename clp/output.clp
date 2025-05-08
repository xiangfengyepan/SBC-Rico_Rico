(defmodule output
    (import MAIN ?ALL)
    (export ?ALL)
)

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
        else (printout t " Ningún elemento especificado" crlf)
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

            (bind ?precio-a (send ?a get-tienePrecio))
            (bind ?precio-b (send ?b get-tienePrecio))

            (if (> ?precio-a ?precio-b) then
                (bind ?ordenada (replace$ ?ordenada ?i (+ ?i 1) ?b ?a)))
            (bind ?i (+ ?i 1))
        )
        (bind ?n (- ?n 1))
    )
    (return ?ordenada)
)

(deffunction output::imprimir-plato (?plato)
    (bind ?nombre (instance-name ?plato))
    (bind ?clase (class ?plato))
    (bind ?titulo (str-cat ?nombre " (" ?clase ")"))
    (bind ?longitud-titulo (str-length ?titulo))
    
    (printout t crlf)

    (bind ?box-width 37)
    (printout t "   ┌" (rep-str ?box-width "─") "┐" crlf)

    (printout t "   │" (center-text ?titulo ?box-width) "│" crlf)  
    (printout t "   └─────────────────────────────────────┘" crlf)
    
    (bind ?ingredientes (send ?plato get-tieneIngrediente))
    (print-list-with-bullets "Ingredientes" ?ingredientes "     " "◦")
    
    (bind ?tiene-tipo (send ?plato get-tieneTipoPlato))
    (print-list-with-bullets "Tipo de Plato" ?tiene-tipo "     " "◦")
    
    (bind ?compatibles (send ?plato get-esCompatibleCon))
    (print-list-with-bullets "Compatible con" ?compatibles "     " "◦")
    
    (bind ?bebidas (send ?plato get-esCompatibleConBebida))
    (print-list-with-bullets "Bebidas recomendadas" ?bebidas "     " "◦")
    
    (printout t "     ├─◦ Origen: " (send ?plato get-esTradicionalDe) crlf)
    (printout t "     ├─◦ Complejidad: " (send ?plato get-tieneComplejidad) crlf)
    (printout t "     ├─◦ Temperatura: " (if (send ?plato get-esCaliente) then "Caliente" else "Frío") crlf)
    (printout t "     └─◦ Precio: " (format-money (send ?plato get-precioPlato)) crlf)
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
)

(deffunction print-menu-box (?menu ?type)
    (bind ?price-text (str-cat ?type " (" (format-money (send ?menu get-tienePrecio)) ")"))
    (bind ?box-width 46)
    
    (printout t crlf)
    (printout t "┏" (rep-str ?box-width "━") "┓" crlf)
    (printout t "┃" (center-text ?price-text ?box-width) "┃" crlf)
    (printout t "┗" (rep-str ?box-width "━") "┛" crlf)
    
    (output::imprimir-menu ?menu)
)

(deffunction print-preferencia-cliente (?num-min ?num-max)
    (bind ?box-width 46)

    (printout t "┏" (output::rep-str ?box-width "━") "┓" crlf)

    (bind ?title "PREFERENCIAS DEL CLIENTE")
    (printout t "┃" (output::center-text ?title ?box-width) "┃" crlf)

    (printout t "┣" (output::rep-str ?box-width "━") "┫" crlf)

    (bind ?price-text (str-cat "Rango de precios: " (format-money ?num-min) " - " (format-money ?num-max)))
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
    (print-preferencia-cliente ?min ?max)

    (bind ?todos-menus (find-all-instances ((?m Menu))
                        (and (>= (send ?m get-tienePrecio) ?min)
                             (<= (send ?m get-tienePrecio) ?max))))

    (if (>= (length$ ?todos-menus) 3) then
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