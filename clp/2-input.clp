;; Definición del módulo "input", el cual importa y exporta todo desde el módulo MAIN
(defmodule input (import MAIN ?ALL) (export ?ALL))

;; Función para obtener un número válido dentro de un rango especificado
(deffunction input::obtener-valor-numerico (?mensaje ?min ?max)
    (printout t ?mensaje ": ") ;; Muestra el mensaje de solicitud
    (bind ?valor (read))       ;; Lee el valor ingresado

    ;; Valida si es un número, si no, vuelve a pedirlo
    (while (not (numberp ?valor)) do
        (printout t "El valor introducido no es un número válido. Intente de nuevo: ")
        (bind ?valor (read))
    )

    ;; Verifica que el número esté dentro del rango
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

;; Función para obtener un rango de valores (mínimo y máximo)
(deffunction input::obtener-rango (?mensaje-min ?mensaje-max ?limite-min ?limite-max)
    (bind ?min nil)
    (bind ?max nil)
    ;; Solicita hasta que el rango esta dentor del interval [limite-min, limite-max]
    (while (or (eq ?min nil) (eq ?max nil) (> ?min ?max)) do
        (bind ?min (input::obtener-valor-numerico ?mensaje-min ?limite-min ?limite-max))
        (bind ?max (input::obtener-valor-numerico ?mensaje-max ?limite-min ?limite-max))
        (if (> ?min ?max) then
            (printout t "El valor mínimo no puede ser mayor que el máximo. Intente de nuevo." crlf)
        )
    )
    (return (create$ ?min ?max)) ;; Devuelve una lista con los dos valores
)

;; Función para seleccionar una opción de una lista
(deffunction input::seleccion-una-opcion (?question $?opciones)
    (printout t ?question)
    (printout t " Las opciones son: " $?opciones crlf)
    (bind ?response (read))
    ;; Valida que la respuesta esté dentro de las opciones
    (while (not (member$ ?response $?opciones)) do 
        (printout t "La respuesta introducida no forma parte de las opciones. Intente de nuevo" crlf)
        (bind ?response (read))
    )
    (return ?response)
)

;; Convierte un número en su correspondiente temporada
(deffunction input::obtener-temporada (?numero)
    (bind ?temporada 
        (if (eq ?numero 0) then [Invierno]
        else (if (eq ?numero 1) then [Primavera]
        else (if (eq ?numero 2) then [Otono]
        else (if (eq ?numero 3) then [Verano]
        else nil)))))
    
    (return ?temporada)
)

;; Convierte un número en una instancia de tipo de evento
(deffunction input::obtener-evento (?numero)
    (bind ?evento 
        (if (eq ?numero 0) then (make-instance Bautizo of Bautizo)
        else (if (eq ?numero 1) then (make-instance Boda of Boda)
        else (if (eq ?numero 2) then (make-instance Comunion of Comunion)
        else (if (eq ?numero 3) then (make-instance Congreso of Congreso)
        else nil)))))
    
    (return ?evento)
)

;; Convierte un número en un grado (bajo, medio, alto)
(deffunction input::obtener-grado (?numero)
    (bind ?grado 
        (if (eq ?numero 2) then [Alta]
        else (if (eq ?numero 1) then [Media]
        else (if (eq ?numero 0) then [Baja]
        else nil)))
    )
    (return ?grado)
)

;; Convierte un número en un estilo (clásico, moderno, etc.)
(deffunction input::obtener-estilo (?numero)
    (bind ?grado 
        (if (eq ?numero 0) then [Clasico]
        else (if (eq ?numero 1) then [Moderno]
        else (if (eq ?numero 2) then [Regional]
        else (if (eq ?numero 3) then [Sibarita]
        else nil)))))
    
    (return ?grado)
)

;; Convierte la letra 't' o 'f' en valores booleanos TRUE o FALSE
(deffunction input::obtener-booleano (?letra)
    (bind ?booleano 
        (if (eq ?letra t) then TRUE
        else (if (eq ?letra f) then FALSE
        else nil)))
    
    (return ?booleano)
)

;; Función principal que solicita todos los datos necesarios del usuario y crea un cliente
(deffunction input::instanciacion-persona ()
    ;; Solicita la edad del usuario
    (bind ?edad (input::obtener-valor-numerico "Introduzca su edad" 0 100))

    ;; Solicita el rango de precio
    (bind ?rango (input::obtener-rango "Introduzca el precio mínimo" "Introduzca el precio máximo" 0 nil))
    (bind ?precio-min (nth$ 1 ?rango))
    (bind ?precio-max (nth$ 2 ?rango))
    
    ;; Solicita restricciones y preferencias alimentarias
    (bind ?esVegetariano (obtener-booleano (input::seleccion-una-opcion "Eres vegetariano? (t: TRUE f: FALSE): " t f)))
    (bind ?esAlcoholico (obtener-booleano (input::seleccion-una-opcion "Eres alcolico? (t: TRUE f: FALSE): " t f)))
    (bind ?esIntoleranteLactosa (obtener-booleano (input::seleccion-una-opcion "Eres intolerante a la lactosa? (t: TRUE f: FALSE): " t f)))

    ;; Solicita nivel de actividad física y estilo preferido
    (bind ?haceDeporte (input::obtener-grado (input::seleccion-una-opcion "Haces deporte? (0:Bajo 1:Media 2:Alto ): " 0 1 2)))
    (bind ?preferencia (input::obtener-estilo (input::seleccion-una-opcion "Si tiene alguna preferencia introduzcala (0:Clasico 1:Moderno 2:Regional 3:Sibarita), en caso contrario elija -1: " -1 0 1 2 3)))

    ;; Solicita tipo de evento, temporada y número de comensales
    (bind ?tipoEvento (input::obtener-evento (input::seleccion-una-opcion "Que tipo de evento quiere de las siguentes opciones (0:Bautizo 1:Boda 2:Comunion 3:Congreso)" 0 1 2 3)))
    (bind ?temporada (obtener-temporada (input::seleccion-una-opcion "En que temporada quieres celebrar el evento? (0:Primavera , 1:Verano, 2:Otoño, 3:Invierno): " 0 1 2 3)))
    (bind ?nComersales (input::obtener-valor-numerico "Introduzca el numero de comersales" 1 nil))

    ;; Asigna los datos al evento
    (send ?tipoEvento put-numeroComersales ?nComersales)
    (send ?tipoEvento put-esTemporadaEvento ?temporada)

    ;; Crea una instancia de cliente con todos los datos recogidos
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

;; Regla que activa el proceso de recolección de datos del cliente
(defrule input::crear-cliente
    => 
    (printout t "Ahora vamos a hacerte algunas preguntas para poder recomendarte unos buenos menús" crlf crlf)
    (input::instanciacion-persona)
)

;; Una vez terminada la entrada, pasa al módulo de análisis
(defrule input::done 
    => 
    (focus analisis)
)
