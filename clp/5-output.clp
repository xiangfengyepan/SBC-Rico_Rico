; Definimos el módulo output, que importa todo desde MAIN y exporta todo para otros módulos
(defmodule output (import MAIN ?ALL) (export ?ALL))

; Función que repite un carácter ?count veces y lo concatena en una cadena
(deffunction output::rep-str (?count ?char)
    (if (<= ?count 0) then ""
        else (str-cat ?char (rep-str (- ?count 1) ?char))
    )
)

; Función que convierte un valor en centavos a formato monetario con símbolo €
(deffunction output::format-money (?value)
    (return (format nil "%.2f€" (/ ?value 100)))
)

; Función que centra un texto dentro de un ancho dado
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

; Imprime una lista con viñetas bajo un título, con indentación y símbolo personalizado
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

; Imprime un atributo con título
(deffunction print-item (?title ?item ?indent)
    (printout t ?indent "├─◦ " ?title ": ")
    (if (or (eq ?item nil) (eq ?item [nil]) (eq ?item -9999)) then
        (printout t "Ningún elemento especificado" crlf)
    else
        (printout t ?item crlf)
    )
)

; Mezcla dos listas de instancias de comida según su precio (función de ordenamiento merge)
(deffunction output::merge-por-precio (?izq ?der)
  (bind ?resultado (create$))
  (while (or (> (length$ ?izq) 0) (> (length$ ?der) 0)) do
    (if (not (> (length$ ?izq) 0)) then
      (bind ?resultado (create$ ?resultado ?der))
      (bind ?der (create$))
    else
      (if (not (> (length$ ?der) 0)) then
        (bind ?resultado (create$ ?resultado ?izq))
        (bind ?izq (create$))
      else
        (bind ?a (nth$ 1 ?izq))
        (bind ?b (nth$ 1 ?der))
        (bind ?precio-a (send ?a get-precioMenu))
        (bind ?precio-b (send ?b get-precioMenu))

        (if (<= ?precio-a ?precio-b) then
          (bind ?resultado (create$ ?resultado ?a))
          (bind ?izq (rest$ ?izq))
        else
          (bind ?resultado (create$ ?resultado ?b))
          (bind ?der (rest$ ?der))
        )
      )
    )
  )
  (return ?resultado)
)

; Ordena una lista de menús por precio usando mergesort
(deffunction output::ordenar-por-precio (?lista)
  (if (<= (length$ ?lista) 1) then
    (return ?lista)
  )
  (bind ?medio (div (length$ ?lista) 2))
  (bind ?izq (subseq$ ?lista 1 ?medio))
  (bind ?der (subseq$ ?lista (+ ?medio 1) (length$ ?lista)))
  (bind ?ordenada-izq (output::ordenar-por-precio ?izq))
  (bind ?ordenada-der (output::ordenar-por-precio ?der))
  (return (output::merge-por-precio ?ordenada-izq ?ordenada-der))
)

; Imprime todos los atributos detallados de una instancia de comida (plato o bebida)
(deffunction output::imprimir-comida (?comida)
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

    (bind ?tiene-tipo (send ?comida get-tieneTipoPlato))
    (print-list-with-bullets "Tipo de Comida" ?tiene-tipo "     " "◦ ")
    
    (bind ?compatibles (send ?comida get-esCompatibleCon))
    (print-list-with-bullets "Compatible con" ?compatibles "     " "◦ ")

    (print-item "Ano de Creacion" (send ?comida get-anoCreacion) "     ")
    (print-item "Son raciones minimalistas" (send ?comida get-racionesMinimalistas) "     ")
    (print-item "Contiene Alcohol" (send ?comida get-contieneAlcohol) "     ")
    (print-item "Contiene Lactosa" (send ?comida get-contieneLactosa) "     ")
    (print-item "Contiene Calorias" (send ?comida get-tieneCalorias) "     ")
    (print-item "Contiene Carbohidratos" (send ?comida get-tieneCarbohidratos) "     ")
    (print-item "Contiene Proteinas" (send ?comida get-tieneProteinas) "     ")

    (print-list-with-bullets "Origen" (send ?comida get-esTradicionalDe) "     " "◦ ")
    (print-item "Complejidad" (send ?comida get-tieneComplejidad) "     ")
    (print-item "Temperatura" 
        (if (eq (send ?comida get-esCaliente) TRUE) 
            then "Caliente" 
            else "Frío") "     ")

    (print-item "Precio" (format-money (send ?comida get-precioComida)) "     ")
)

; Imprime un menú con todos sus platos y bebida
(deffunction output::imprimir-menu (?menu)
    (bind ?platos (send ?menu get-tienePlato))
    (bind ?i 1)
    (while (<= ?i (length$ ?platos)) do
        (bind ?plato (nth$ ?i ?platos))
        (printout t "  ")
        (output::imprimir-comida (nth$ ?i ?platos))
        (bind ?i (+ ?i 1))
    )
    (bind ?bebida (send ?menu get-tieneBebida))
    (output::imprimir-comida ?bebida)
)

; Imprime una caja con el tipo de menú(economico, intermedio o premium) y su precio, luego su contenido
(deffunction print-menu-box (?menu ?type)
    (bind ?price-text (str-cat ?type " (" (format-money (send ?menu get-precioMenu)) ")"))
    (bind ?box-width 46)
    
    (printout t crlf)
    (printout t "┏" (rep-str ?box-width "━") "┓" crlf)
    (printout t "┃" (center-text ?price-text ?box-width) "┃" crlf)
    (printout t "┗" (rep-str ?box-width "━") "┛" crlf)
    
    (output::imprimir-menu ?menu)
)

; Imprime preferencias del cliente en una caja
(deffunction print-preferencia-cliente (?cliente)
    (bind ?box-width 46)

    (printout t "┏" (output::rep-str ?box-width "━") "┓" crlf)
    (bind ?title "PREFERENCIAS DEL CLIENTE")
    (printout t "┃" (output::center-text ?title ?box-width) "┃" crlf)
    (printout t "┣" (output::rep-str ?box-width "━") "┫" crlf)

    ; Atributos del cliente
    (printout t "┃" (output::center-text (str-cat "Edad: " (send ?cliente get-tieneEdad))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Es Alcoholico: " (send ?cliente get-esAlcoholico))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Es Vegetariano: " (send ?cliente get-esVegetariano))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Es Intolerante a la lactosa: " (send ?cliente get-esIntoleranteLactosa))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Grado de deporte: " (send ?cliente get-haceDeporte))  ?box-width) "┃" crlf)
    (printout t "┃" (output::center-text (str-cat "Prefiere Estilo: " (send ?cliente get-prefiereEstilo))  ?box-width) "┃" crlf)

    ; Evento preferido del cliente
    (bind ?evento (send ?cliente get-prefiereEvento))
    (printout t "┃" (output::center-text (str-cat "Evento: " (instance-name ?evento) 
        " de " (send ?evento get-numeroComersales) " personas en " (send ?evento get-esTemporadaEvento))  ?box-width) "┃" crlf)

    ; Rango de precios
    (bind ?price-text (str-cat "Rango de precios: " (format-money (send ?cliente get-precioMinimo)) " - " (format-money (send ?cliente get-precioMaximo))))
    (printout t "┃" (output::center-text ?price-text ?box-width) "┃" crlf)
    (printout t "┗" (output::rep-str ?box-width "━") "┛" crlf crlf)
)

; Regla que activa la visualización de los tres menús más relevantes por precio
(defrule output::mostrar-tres-menus-por-precio
    (declare (salience 10))
    ?cliente <- (object (is-a Cliente))
    =>
    (printout t crlf)

    ; Mostrar datos del cliente
    (print-preferencia-cliente ?cliente)

    ; Buscar todos los menús y los ordena con mergesort
    (bind ?todos-menus (find-all-instances ((?m Menu)) TRUE))
    (bind ?box-width 46)
    (printout t "┏" (rep-str ?box-width "━") "┓" crlf)
    (printout t "┃" (center-text (str-cat "Numero de menus encontrados: " (length$ ?todos-menus)) ?box-width) "┃" crlf)
    (printout t "┗" (rep-str ?box-width "━") "┛" crlf)

    ; Si hay suficientes menús, mostrar económico, intermedio y premium
    (if (>= (length$ ?todos-menus) 3) then
        (bind ?ordenados (output::ordenar-por-precio ?todos-menus))
        (bind ?menu-barato (nth$ 1 ?ordenados))
        (bind ?menu-medio (nth$ (div (+ 1 (length$ ?ordenados)) 2) ?ordenados))
        (bind ?menu-caro (nth$ (length$ ?ordenados) ?ordenados))

        (print-menu-box ?menu-barato "MENÚ ECONÓMICO")
        (print-menu-box ?menu-medio "MENÚ INTERMEDIO")
        (print-menu-box ?menu-caro "MENÚ PREMIUM")

        ; Si hay menos de 3 menús, mostrar los que haya disponibles
        else (if (>= (length$ ?todos-menus) 1) then
                (if (>= (length$ ?todos-menus) 1) then
                    (bind ?menu1 (nth$ 1 ?todos-menus))
                    (print-menu-box ?menu1 "MENÚ 1"))
                (if (>= (length$ ?todos-menus) 2) then
                    (bind ?menu2 (nth$ 2 ?todos-menus))
                    (print-menu-box ?menu2 "MENÚ 2"))
        else
            (printout t "  ⚠ No hay suficientes menús en el rango especificado" crlf crlf)
        )
    )
)
