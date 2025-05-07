(defmodule entrada
    (import MAIN ?ALL)
    (export ?ALL)
)

(deffunction entrada::obtener_valor_numerico (?mensaje ?min ?max)
    (printout t ?mensaje ": ")
    (bind ?valor (read))

    (while (not (numberp ?valor)) do
        (printout t "El valor introducido no es un numero valido. Intente de nuevo: ")
        (bind ?valor (read))
    )

    (while (or 
            (and (neq ?min nil) (< ?valor ?min)) 
            (and (neq ?max nil) (> ?valor ?max))) 
        do
        (printout t "El valor introducido no es valido.")
        (if (neq ?min nil) then (printout t " Debe ser mayor o igual que " ?min "."))
        (if (neq ?max nil) then (printout t " Debe ser menor o igual que " ?max "."))
        (printout t crlf)
        (bind ?valor (read))
    )

    (printout t crlf)
    (return ?valor)
)
(deffunction entrada::obtener_rango (?mensaje-min ?mensaje-max ?limite-min ?limite-max)
    (bind ?min nil)
    (bind ?max nil)
    (while (or (eq ?min nil) (eq ?max nil) (> ?min ?max)) do
        (bind ?min (entrada::obtener_valor_numerico ?mensaje-min ?limite-min ?limite-max))
        (bind ?max (entrada::obtener_valor_numerico ?mensaje-max ?limite-min ?limite-max))
        (if (> ?min ?max) then
            (printout t "El valor minimo no puede ser mayor que el maximo. Intente de nuevo." crlf)
        )
    )
    (return (create$ ?min ?max))
)

(deffunction entrada::seleccion_una_opcion (?question $?opcions)
    (printout t ?question)
    (printout t " Las opciones son: " $?opcions crlf)
    (bind ?response (read))
    (while (not (member$ ?response $?opcions)) do 
        (printout t "La respuesta introducida no forma parte de las opciones. Intente de nuevo" crlf)
        (bind ?response (read))
    )
    (return ?response)
)

(deffunction entrada::obtener_temporada (?numero)
    (bind ?temporada 
        (if (eq ?numero 0) then (make-instance Invierno of Temporada)
        else (if (eq ?numero 1) then (make-instance Primavera of Temporada)
        else (if (eq ?numero 2) then (make-instance Otono of Temporada)
        else (if (eq ?numero 3) then (make-instance Verano of Temporada)
        else nil)))))
    (return ?temporada)
)

; Funcion para instanciar la persona con sus datos
(deffunction entrada::instanciacion_persona ()
    ; Preguntamos el precio maximo
    (bind ?rango (entrada::obtener_rango "Introduzca el precio minimo" "Introduzca el precio maximo" 0 nil))
    (bind ?precio_min (nth$ 1 ?rango))
    (bind ?precio_max (nth$ 2 ?rango))

    
    (bind ?esVegetariano (entrada::seleccion_una_opcion "Eres vegetariano?: " true false))
    (bind ?esAlcoholico (entrada::seleccion_una_opcion "Eres alcolico?: " true false))

    (bind ?temporada (obtener_temporada (entrada::seleccion_una_opcion "En que temporada quieres celebrar el evento? (0:Primavera , 1:Verano, 2:Otoño, 3:Invierno): " 0 1 2 3)))


    ; Sobre preferencias y restricciones
    (bind ?preferencia (entrada::seleccion_una_opcion "Si tiene alguna preferencia introduzcala, en caso contrario elija 'Null': " 
        Null Clasico Moderno, Regional Sibarita))

    ; Creacion de la instancia Cliente
    (make-instance cliente1 of Cliente 
        (precioMinimo ?precio_min) 
        (precioMaximo ?precio_max)  
        (prefiereEstilo ?preferencia) 
        (esVegetariano ?esVegetariano) 
        (esAlcoholico ?esAlcoholico)) 

)

; Regla que activa el proceso de crear un cliente
(defrule entrada::crear_anciano
    (declare (salience 10))
    => 
    (printout t "Ahora vamos a hacerte una pregunta para poder recomendarte una buena dieta" crlf crlf)
    (entrada::instanciacion_persona)
)