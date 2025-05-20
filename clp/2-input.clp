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
        (if (eq ?numero 0) then [Invierno]
        else (if (eq ?numero 1) then [Primavera]
        else (if (eq ?numero 2) then [Otono]
        else (if (eq ?numero 3) then [Verano]
        else nil))))
    )
    (return ?temporada)
)

(deffunction input::obtener-evento (?numero)
    (bind ?evento 
        (if (eq ?numero 0) then (make-instance Bautizo of Bautizo)
        else (if (eq ?numero 1) then (make-instance Boda of Boda)
        else (if (eq ?numero 2) then (make-instance Comunion of Comunion)
        else (if (eq ?numero 3) then (make-instance Congreso of Congreso)
        else nil))))
    )
    (return ?evento)
)

(deffunction input::obtener-grado (?numero)
    (bind ?grado 
        (if (eq ?numero 2) then [Alto]
        else (if (eq ?numero 1) then [Medio]
        else (if (eq ?numero 0) then [Bajo]
        else nil)))
    )
    (return ?grado)
)

(deffunction input::obtener-estilo (?numero)
    (bind ?grado 
        (if (eq ?numero 0) then [Clasico]
        else (if (eq ?numero 1) then [Moderno]
        else (if (eq ?numero 2) then [Regional]
        else (if (eq ?numero 2) then [Sibarita]
        else nil))))
    )
    (return ?grado)
)

(deffunction input::obtener-booleano (?letra)
    (bind ?booleano 
        (if (eq ?letra t) then TRUE
        else (if (eq ?letra f) then FALSE
        else nil))
    )
    (return ?booleano)
)

(deffunction input::instanciacion-persona ()

    (bind ?edad (input::obtener-valor-numerico "Introduzca su edad" 0 100))

    (bind ?rango (input::obtener-rango "Introduzca el precio mínimo" "Introduzca el precio máximo" 0 nil))
    (bind ?precio-min (nth$ 1 ?rango))
    (bind ?precio-max (nth$ 2 ?rango))
    
    ; Preferencias
    (bind ?esVegetariano (obtener-booleano (input::seleccion-una-opcion "Eres vegetariano? (t: TRUE f: FALSE): " t f)))
    (bind ?esAlcoholico (obtener-booleano (input::seleccion-una-opcion "Eres alcolico? (t: TRUE f: FALSE): " t f)))
    (bind ?esIntoleranteLactosa (obtener-booleano (input::seleccion-una-opcion "Eres intolerante a la lactosa? (t: TRUE f: FALSE): " t f)))

    (bind ?haceDeporte (input::obtener-grado (input::seleccion-una-opcion "Haces deporte? (0:Bajo 1:Medio 2:Alto ): " 0 1 2)))

    (bind ?preferencia (input::obtener-estilo (input::seleccion-una-opcion "Si tiene alguna preferencia introduzcala (0:Clasico 1:Moderno 2:Regional 3:Sibarita), en caso contrario elija '-1': " -1 0 1 2 3)))

    ; Evento
    (bind ?temporada (obtener-temporada (input::seleccion-una-opcion "En que temporada quieres celebrar el evento? (0:Primavera , 1:Verano, 2:Otoño, 3:Invierno): " 0 1 2 3)))
    (bind ?tipoEvento (input::obtener-evento (input::seleccion-una-opcion "Que tipo de evento quiere de las siguentes opciones (0:Bautizo 1:Boda 2:Comunion 3:Congreso):" 0 1 2 3)))
    (bind ?nComersales (input::obtener-valor-numerico "Introduzca el numero de comersales" 0 nil))
    (send ?tipoEvento put-numeroComersales ?nComersales)
    (send ?tipoEvento put-esTemporadaEvento ?temporada)

    (make-instance cliente1 of Cliente 
        (precioMinimo ?precio-min) 
        (precioMaximo ?precio-max)  
        (prefiereEstilo ?preferencia) 
        (esVegetariano ?esVegetariano) 
        (esAlcoholico ?esAlcoholico)
        (esIntoleranteLactosa ?esIntoleranteLactosa)
        (haceDeporte ?haceDeporte) 
        (prefiereEvento ?tipoEvento)
        (tieneEdad ?edad)
    )
)

(defrule input::crear-cliente
    => 
    (printout t "Ahora vamos a hacerte algunas preguntas para poder recomendarte unos buenos menús" crlf crlf)
    (input::instanciacion-persona)
)


(defrule input::done => (focus analisis))
