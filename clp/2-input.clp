(defmodule input (import MAIN ?ALL) (export ?ALL))

(deffunction input::obtener-valor-numerico (?mensaje ?min ?max)
    (printout t ?mensaje ": ")
    (bind ?valor (read))

    (while (not (numberp ?valor)) do
        (printout t "El valor introducido no es un número válido. Intente de nuevo: ")
        (bind ?valor (read))
    )

    (while (or 
            (and (neq ?min nil) (< ?valor ?min)) 
            (and (neq ?max nil) (> ?valor ?max))) 
        do
        (printout t "El valor introducido no es válido.")
        (if (neq ?min nil) then (printout t " Debe ser mayor o igual que " ?min "."))
        (if (neq ?max nil) then (printout t " Debe ser menor o igual que " ?max "."))
        (printout t crlf)
        (bind ?valor (read))
    )

    (printout t crlf)
    (return ?valor)
)

(deffunction input::obtener-rango (?mensaje-min ?mensaje-max ?limite-min ?limite-max)
    (bind ?min nil)
    (bind ?max nil)
    (while (or (eq ?min nil) (eq ?max nil) (> ?min ?max)) do
        (bind ?min (input::obtener-valor-numerico ?mensaje-min ?limite-min ?limite-max))
        (bind ?max (input::obtener-valor-numerico ?mensaje-max ?limite-min ?limite-max))
        (if (> ?min ?max) then
            (printout t "El valor mínimo no puede ser mayor que el máximo. Intente de nuevo." crlf)
        )
    )
    (return (create$ ?min ?max))
)

(deffunction input::seleccion-una-opcion (?question $?opciones)
    (printout t ?question)
    (printout t " Las opciones son: " $?opciones crlf)
    (bind ?response (read))
    (while (not (member$ ?response $?opciones)) do 
        (printout t "La respuesta introducida no forma parte de las opciones. Intente de nuevo" crlf)
        (bind ?response (read))
    )
    (return ?response)
)

(deffunction input::obtener-temporada (?numero)
    (bind ?temporada 
        (if (eq ?numero 0) then (make-instance Invierno of Temporada)
        else (if (eq ?numero 1) then (make-instance Primavera of Temporada)
        else (if (eq ?numero 2) then (make-instance Otono of Temporada)
        else (if (eq ?numero 3) then (make-instance Verano of Temporada)
        else nil)))))
    (return ?temporada)
)

(deffunction input::instanciacion-persona ()
    (bind ?rango (input::obtener-rango "Introduzca el precio mínimo" "Introduzca el precio máximo" 0 nil))
    (bind ?precio-min (nth$ 1 ?rango))
    (bind ?precio-max (nth$ 2 ?rango))
    (bind ?esVegetariano (input::seleccion-una-opcion "Eres vegetariano?: " TRUE FALSE))
    (bind ?esAlcoholico (input::seleccion-una-opcion "Eres alcolico?: " TRUE FALSE))

    (bind ?temporada (obtener-temporada (input::seleccion-una-opcion "En que temporada quieres celebrar el evento? (0:Primavera , 1:Verano, 2:Otoño, 3:Invierno): " 0 1 2 3)))

    (bind ?preferencia (input::seleccion-una-opcion "Si tiene alguna preferencia introduzcala, en caso contrario elija 'Null': " 
        Null Clasico Moderno Regional Sibarita))


    (make-instance cliente1 of Cliente 
        (precioMinimo ?precio-min) 
        (precioMaximo ?precio-max)  
        (prefiereEstilo ?preferencia) 
        (esVegetariano ?esVegetariano) 
        (esAlcoholico ?esAlcoholico)
    )
)

(defrule input::crear-cliente
    => 
    (printout t "Ahora vamos a hacerte algunas preguntas para poder recomendarte unos buenos menús" crlf crlf)
    (input::instanciacion-persona)
)


(defrule input::done => (focus analisis))
