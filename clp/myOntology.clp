;;; ---------------------------------------------------------
;;; clp/myOntology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/myOntology.rdf
;;; :Date 07/05/2025 20:08:32

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
    (multislot esAlcoholico
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

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot numeroComersales
        (type INTEGER)
        (create-accessor read-write))
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

(defclass Precio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Temporada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Tipo_Menu
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

    ([Asados] of Tipo_Plato
    )

    ([Baja] of Complejidad
    )

    ([Bautizo] of Evento
    )

    ([Boda] of Evento
    )

    ([Carne] of Tipo_Plato
    )

    ([Cataluna] of Localizacion
    )

    ([Cerveza] of Bebida
         (precioBebida  250)
    )

    ([Chocolate] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([Clasico] of Tipo_Menu
    )

    ([Comunion] of Evento
    )

    ([Congreso] of Evento
    )

    ([EnsaladaCesar] of Primer_Plato
         (esCaliente  "false")
         (precioPlato  350)
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

    ([Guisos] of Tipo_Plato
    )

    ([Invierno] of Temporada
    )

    ([Madrid] of Localizacion
    )

    ([Marisco] of Ingrediente
         (esOrigenVegetariano  "false")
    )

    ([Media] of Complejidad
    )

    ([Moderno] of Tipo_Menu
    )

    ([Null] of Tipo_Menu
    )

    ([Otoño] of Temporada
    )

    ([PaellaValenciana] of Segundo_Plato
         (esCaliente  "true")
         (precioPlato  600)
    )

    ([PaisVasco] of Localizacion
    )

    ([Pasta] of Tipo_Plato
    )

    ([Pepino] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([Pescado] of Tipo_Plato
    )

    ([Pollo] of Ingrediente
         (esOrigenVegetariano  "false")
    )

    ([Primavera] of Temporada
    )

    ([Queso] of Ingrediente
         (esOrigenVegetariano  "false")
    )

    ([RefrescoCola] of Bebida
         (precioBebida  150)
    )

    ([Regional] of Tipo_Menu
    )

    ([Sibarita] of Tipo_Menu
    )

    ([Sidra] of Bebida
         (precioBebida  350)
    )

    ([Sopas] of Tipo_Plato
    )

    ([Tomate] of Ingrediente
         (esOrigenVegetariano  "true")
    )

    ([TortillaPatatas] of Segundo_Plato
         (esCaliente  "true")
         (precioPlato  450)
    )

    ([Verano] of Temporada
    )

    ([VinoTinto] of Bebida
         (precioBebida  700)
    )

)
