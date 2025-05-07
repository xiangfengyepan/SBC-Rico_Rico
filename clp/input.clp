(defmodule entrada
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule MAIN::inicio 
	(declare (salience 20)) 
	=> 
	(printout t "Super Galactic polynomial diet maker et al yayos solver" crlf)
    ; (make-instance [Invierno] of Temporada)
    ; (make-instance [Verano] of Temporada)
    ; (make-instance [Otono] of Temporada)
    ; (make-instance [Primavera] of Temporada)
	(focus entrada)
)


(defrule entrada::crear_anciano
	(declare (salience 10))
	=> 
	(printout t "Ahora vamos a hacerte una pregunta para poder recomendarte una buena dieta" crlf crlf)
	(instanciacion_persona)
	; (focus procesado)
)

(deffunction entrada::instanciacion_persona ()
    ; preguntamos datos biologicos de la persona
    (bind ?precio_max (obtener_precio_max))
    (bind ?sexo (obtener_sexo))
    
    ;Sobre su estado actual
    (bind ?estilo (seleccion_una_opcion "Introduzca su estilo de vida usando el número correspondiente (0:Sedentaria , 1:Normal, 2:Activo): " 0 1 2))
    (bind ?temporada (seleccion_una_opcion "Introduzca la temporada del año" Invierno Primavera Otono Verano))

    ;Sobre preferencias y restricciones
    (bind ?preferencia (seleccion_una_opcion "Si tiene alguna preferencia introduzcala, en caso contrario eliga 'No': " No Vegana Vegetariana Mediterranea Proteica Pescado Carne))


    ;Hay que cambiar los nombres, pero eso cuando esté la ontología puesta
    (make-instance cliente1 of Cliente (Estilo ?estilo) (Temporada ?temporada)) 
)

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


(deffunction entrada::obtener_precio_max ()
    (printout t "Introduzca la precio maximo ")
    (bind ?precio_max (read))
    (while (or (< ?precio_max 0)  (> ?precio_max 1000)) do
            (printout t "El valor introducido no es válido.") 
            (bind ?precio_max (read))
    )
    (printout t crlf)
    (return ?precio_max)
)