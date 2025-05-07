(defmodule entrada
    (import MAIN ?ALL)
    (export ?ALL)
)

; Nueva función que obtiene un valor numérico general
(deffunction entrada::obtener_valor_numerico (?mensaje)
    (printout t ?mensaje ": ")
    (bind ?valor (read))
    (while (not (numberp ?valor)) do
        (printout t "El valor introducido no es un número válido. Intente de nuevo: ")
        (bind ?valor (read))
    )
    (printout t crlf)
    (return ?valor)
)

; Función para obtener el precio máximo usando la nueva función generalizada
(deffunction entrada::obtener_precio_max ()
    (bind ?precio_max (entrada::obtener_valor_numerico "Introduzca el precio máximo"))
    (while (or (< ?precio_max 0)  (> ?precio_max 1000)) do
            (printout t "El valor introducido no es válido. Debe estar entre 0 y 1000." crlf)
            (bind ?precio_max (entrada::obtener_valor_numerico "Introduzca el precio máximo"))
    )
    (return ?precio_max)
)

; Función para seleccionar una opción de una lista de opciones
(deffunction entrada::seleccion_una_opcion (?question $?opcions)
    (printout t ?question)
    (printout t " Las opciones son: " $?opcions crlf)
    (bind ?response (read))
    (while (not (member$ ?response $?opcions)) do 
        (printout t "La respuesta introducida no forma parte de las opciones. Por favor, elija otra vez." crlf)
        (bind ?response (read))
    )
    (return ?response)
)

; Función para instanciar la persona con sus datos
(deffunction entrada::instanciacion_persona ()
    ; Preguntamos el precio máximo
    (bind ?precio_max (entrada::obtener_precio_max))
    
    ; Sobre su estado actual (estilo de vida)
    (bind ?estilo (entrada::seleccion_una_opcion "Introduzca su estilo de vida usando el número correspondiente (0:Sedentaria , 1:Normal, 2:Activo): " 0 1 2))
    (bind ?temporada (entrada::seleccion_una_opcion "Introduzca la temporada del año" Invierno Primavera Otono Verano))

    ; Sobre preferencias y restricciones
    (bind ?preferencia (entrada::seleccion_una_opcion "Si tiene alguna preferencia introduzcala, en caso contrario elija 'No': " No Vegana Vegetariana Mediterranea Proteica Pescado Carne))

    ; Creación de la instancia Cliente
    (make-instance cliente1 of Cliente (Estilo ?estilo) (Temporada ?temporada)) 
)

; Regla que activa el proceso de crear un cliente
(defrule entrada::crear_anciano
    (declare (salience 10))
    => 
    (printout t "Ahora vamos a hacerte una pregunta para poder recomendarte una buena dieta" crlf crlf)
    (entrada::instanciacion_persona)
)
