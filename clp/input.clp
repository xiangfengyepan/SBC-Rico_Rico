(defmodule input
    (import MAIN ?ALL)
    (export ?ALL)
)

(deffunction input::obtener_valor_numerico (?mensaje ?min ?max)
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
(deffunction input::obtener_rango (?mensaje-min ?mensaje-max ?limite-min ?limite-max)
    (bind ?min nil)
    (bind ?max nil)
    (while (or (eq ?min nil) (eq ?max nil) (> ?min ?max)) do
        (bind ?min (input::obtener_valor_numerico ?mensaje-min ?limite-min ?limite-max))
        (bind ?max (input::obtener_valor_numerico ?mensaje-max ?limite-min ?limite-max))
        (if (> ?min ?max) then
            (printout t "El valor minimo no puede ser mayor que el maximo. Intente de nuevo." crlf)
        )
    )
    (return (create$ ?min ?max))
)

(deffunction input::seleccion_una_opcion (?question $?opcions)
    (printout t ?question)
    (printout t " Las opciones son: " $?opcions crlf)
    (bind ?response (read))
    (while (not (member$ ?response $?opcions)) do 
        (printout t "La respuesta introducida no forma parte de las opciones. Intente de nuevo" crlf)
        (bind ?response (read))
    )
    (return ?response)
)

(deffunction input::obtener_temporada (?numero)
    (bind ?temporada 
        (if (eq ?numero 0) then (make-instance Invierno of Temporada)
        else (if (eq ?numero 1) then (make-instance Primavera of Temporada)
        else (if (eq ?numero 2) then (make-instance Otono of Temporada)
        else (if (eq ?numero 3) then (make-instance Verano of Temporada)
        else nil)))))
    (return ?temporada)
)

(deffunction input::instanciacion_persona ()
    (bind ?rango (input::obtener_rango "Introduzca el precio minimo" "Introduzca el precio maximo" 0 nil))
    (bind ?precio_min (nth$ 1 ?rango))
    (bind ?precio_max (nth$ 2 ?rango))

    
    ; (bind ?esVegetariano (input::seleccion_una_opcion "Eres vegetariano?: " true false))
    ; (bind ?esAlcoholico (input::seleccion_una_opcion "Eres alcolico?: " true false))

    ; (bind ?temporada (obtener_temporada (input::seleccion_una_opcion "En que temporada quieres celebrar el evento? (0:Primavera , 1:Verano, 2:Otoño, 3:Invierno): " 0 1 2 3)))

    ; (bind ?preferencia (input::seleccion_una_opcion "Si tiene alguna preferencia introduzcala, en caso contrario elija 'Null': " 
    ;     Null Clasico Moderno Regional Sibarita))

    (make-instance cliente1 of Cliente 
        (precioMinimo ?precio_min) 
        (precioMaximo ?precio_max)  
        ; (prefiereEstilo ?preferencia) 
        ; (esVegetariano ?esVegetariano) 
        ; (esAlcoholico ?esAlcoholico)
    )

)

(defrule input::crear_cliente
    (declare (salience 10))
    => 
    (printout t "Ahora vamos a hacerte algunas preguntas para poder recomendarte unos buenos menu" crlf crlf)
    (input::instanciacion_persona)

    ; TODO
    ; Menú 1 - Combinación tradicional andaluza
    (make-instance menu1 of Menu
        (tieneBebida [VinoTinto])  ; Bebida compatible con los platos
        (tienePlato (create$ [GazpachoAndaluz] [PaellaValenciana] [FlanCasero]))
        (tienePrecio (+ (send [GazpachoAndaluz] get-precioPlato)
                    (send [PaellaValenciana] get-precioPlato)
                    (send [FlanCasero] get-precioPlato)
                    (send [VinoTinto] get-precioBebida)))  ; Total: 400+600+400+700 = 2100
    )
    ; Menú 2 - Opción más ligera
    (make-instance menu2 of Menu
        (tieneBebida [AguaMineral])  ; Bebida refrescante
        (tienePlato (create$ [EnsaladaCesar] [TortillaPatatas] [FlanCasero]))
        (tienePrecio (+ (send [EnsaladaCesar] get-precioPlato)
                    (send [TortillaPatatas] get-precioPlato)
                    (send [FlanCasero] get-precioPlato)
                    (send [AguaMineral] get-precioBebida)))  ; Total: 350+450+400+100 = 1300
    )

    ; Menú 3 - Opción mediterránea
    (make-instance menu3 of Menu
        (tieneBebida [Cerveza])  ; Bebida típica con paella
        (tienePlato (create$ [GazpachoAndaluz] [PaellaValenciana] [FlanCasero]))
        (tienePrecio (+ (send [GazpachoAndaluz] get-precioPlato)
                    (send [PaellaValenciana] get-precioPlato)
                    (send [FlanCasero] get-precioPlato)
                    (send [Cerveza] get-precioBebida)))  ; Total: 400+600+400+250 = 1650

    )

    ; Menú 4 - Opción económica
    (make-instance menu4 of Menu
        (tieneBebida [RefrescoCola])  ; Bebida económica
        (tienePlato (create$ [EnsaladaCesar] [TortillaPatatas] [FlanCasero]))
        (tienePrecio (+ (send [EnsaladaCesar] get-precioPlato)
                    (send [TortillaPatatas] get-precioPlato)
                    (send [FlanCasero] get-precioPlato)
                    (send [RefrescoCola] get-precioBebida)))  ; Total: 350+450+400+150 = 1350
    )
    ; Menú 5 - Opción premium
    (make-instance menu5 of Menu
        (tieneBebida [Sidra])  ; Bebida especial
        (tienePlato (create$ [GazpachoAndaluz] [PaellaValenciana] [FlanCasero]))
        (tienePrecio (+ (send [GazpachoAndaluz] get-precioPlato)
                    (send [PaellaValenciana] get-precioPlato)
                    (send [FlanCasero] get-precioPlato)
                    (send [Sidra] get-precioBebida)))  ; Total: 400+600+400+350 = 1750
    )


    ; ;; Crear un menú 2 (Menú intermedio)
    ; (make-instance menu2 of Menu
    ;     (tieneBebida (create$ Sidra))  ;; Bebida: Sidra (precio 350)
    ;     (tienePlato (create$ GazpachoAndaluz))  ;; Primer Plato: Gazpacho Andaluz (precio 400)
    ;     (tienePlato (create$ PaellaValenciana))  ;; Segundo Plato: Paella Valenciana (precio 600)
    ;     (tienePlato (create$ FlanCasero))  ;; Postre: Flan Casero (precio 400)
    ;     (tienePrecio (create$ (+ 400 600 350 400))))  ;; Precio total: 400 + 600 + 350 + 400 = 1750


    ; ;; Crear un menú 3 (Menú premium)
    ; (make-instance menu3 of Menu
    ;     (tieneBebida (create$ VinoTinto))  ;; Bebida: Vino Tinto (precio 700)
    ;     (tienePlato (create$ TortillaPatatas))  ;; Primer Plato: Tortilla de Patatas (precio 450)
    ;     (tienePlato (create$ PaellaValenciana))  ;; Segundo Plato: Paella Valenciana (precio 600)
    ;     (tienePlato (create$ FlanCasero))  ;; Postre: Flan Casero (precio 400)
    ;     (tienePrecio (create$ (+ 450 600 700 400))))  ;; Precio total: 450 + 600 + 700 + 400 = 2150


    (focus output)
)