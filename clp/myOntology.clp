;;; ---------------------------------------------------------
;;; clp/myOntology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/myOntology.rdf
;;; :Date 01/05/2025 21:54:49

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

(defclass Comunion
    (is-a Familiar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Boda
    (is-a Comunion)
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
    ([AguaMineral] of Bebida
         (precioBebida  100)
    )

    ([Alta] of Complejidad
    )

    ([Andalucia] of Localizacion
    )

    ([Arroz] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([Baja] of Complejidad
    )

    ([Carne] of Tipo_Plato
    )

    ([Cataluna] of Localizacion
    )

    ([Cerveza] of Bebida
         (precioBebida  250)
    )

    ([ClienteEjemplo] of Cliente
         (esAlcohólico  "true")
         (precioMinimo  100)
         (precioMaximo  2000)
    )

    ([ClienteVegetariano] of Cliente
         (esVegetariano  "true")
         (precioMinimo  1000)
         (precioMaximo  20000)

    )

    ([CongresoExample] of Congreso
         (numeroComersales  100)
    )

    ([Estofados] of Tipo_Plato
    )

    ([FlanCasero] of Postre
         (esCaliente  "false")
         (precioPlato  400)
    )

    ([Galicia] of Localizacion
    )

    ([GazpachoAndaluz] of Primer_Plato
         (esCaliente  "true")
         (precioPlato  400)
    )

    ([Marisco] of Ingrediente
         (esOrigenVegetariano  "false")
    )

    ([Media] of Complejidad
    )

    ([PaellaValenciana] of Segundo_Plato
         (esCaliente  "true")
         (precioPlato  600)
    )

    ([Pasta] of Tipo_Plato
    )

    ([Pepino] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([Pescado] of Tipo_Plato
    )

    ([Sopas] of Tipo_Plato
    )

    ([Tomate] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([VinoTinto] of Bebida
         (precioBebida  700)
    )

)
