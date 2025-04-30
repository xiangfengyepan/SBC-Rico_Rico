;;; ---------------------------------------------------------
;;; clp/ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/myOntology.rdf
;;; :Date 30/04/2025 09:38:20

(defclass Menu
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot tieneBebida
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tienePlato
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tienePrecio
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Clásico
    (is-a Menu)
    (role concrete)
    (pattern-match reactive)
)

(defclass Moderno
    (is-a Menu)
    (role concrete)
    (pattern-match reactive)
)

(defclass Regional
    (is-a Menu)
    (role concrete)
    (pattern-match reactive)
)

(defclass Sibarita
    (is-a Menu)
    (role concrete)
    (pattern-match reactive)
)

(defclass Temporada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Invierno
    (is-a Temporada)
    (role concrete)
    (pattern-match reactive)
)

(defclass Otoño
    (is-a Temporada)
    (role concrete)
    (pattern-match reactive)
)

(defclass Primavera
    (is-a Temporada)
    (role concrete)
    (pattern-match reactive)
)

(defclass Verano
    (is-a Temporada)
    (role concrete)
    (pattern-match reactive)
)

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot numeroComersales
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Congreso
    (is-a Evento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Familiar
    (is-a Evento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Bautizo
    (is-a Familiar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Boda
    (is-a Familiar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Comunion
    (is-a Familiar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Plato
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot esCompatibleCon
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esCompatibleConBebida
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esTradicionalDe
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneComplejidad
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneIngrediente
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneTipoPlato
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esCaliente
        (type SYMBOL)
        (create-accessor read-write))
    (multislot precioPlato
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Postre
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Primer_Plato
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Segundo_Plato
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Bebida
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot precioBebida
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Cliente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot prefiereEstilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prohibeIngrediente
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esAlcohólico
        (type SYMBOL)
        (create-accessor read-write))
    (multislot esVegetariano
        (type SYMBOL)
        (create-accessor read-write))
    (multislot precioMaximo
        (type INTEGER)
        (create-accessor read-write))
    (multislot precioMinimo
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Complejidad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Estilo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot esTemporada
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esOrigenVegetariano
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Localizacion
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Precio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Tipo_Plato
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(definstances instances
    ([ClienteEjemplo] of Cliente
         (precioMaximo  "500")
         (precioMinimo  "200")
         (prefiereEstilo  [Moderno])
         (prohibeIngrediente  [Tomate])
    )

    ([Macarrones] of Primer_Plato
         (precioPlato  "899")
    )

    ([Moderno] of Estilo
    )

    ([TartaDeQueso] of Postre
         (precioPlato  "450")
    )

    ([Tomate] of Ingrediente
    )

    ([Verano] of Temporada
    )

    ([VinoTinto] of Bebida
         (precioBebida  "320")
    )
)
