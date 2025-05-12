;;; ---------------------------------------------------------
;;; clp/ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/ontology.rdf
;;; :Date 12/05/2025 16:55:52

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
    (slot tieneComplejidad
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneIngrediente
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneTipoPlato
        (type INSTANCE)
        (create-accessor read-write))
    (slot esCaliente
        (type SYMBOL)
        (create-accessor read-write))
    (slot precioPlato
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
    (slot precioBebida
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
    (slot esAlcoholico
        (type SYMBOL)
        (create-accessor read-write))
    (slot esVegetariano
        (type SYMBOL)
        (create-accessor read-write))
    (slot precioMaximo
        (type INTEGER)
        (create-accessor read-write))
    (slot precioMinimo
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
    (slot numeroComersales
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esTemporada
        (type INSTANCE)
        (create-accessor read-write))
    (slot esOrigenVegetariano
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
    (slot tienePrecio
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
         (esCompatibleConBebida  [AguaMineral])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Lechuga] [Pollo])
         (tieneTipoPlato  [Ensaladas])
         (precioPlato  350)
    )

    ([Ensaladas] of Tipo_Plato
    )

    ([España] of Localizacion
    )

    ([Estofados] of Tipo_Plato
    )

    ([FlanCasero] of Postre
         (esCompatibleCon  [PaellaValenciana])
         (esCompatibleConBebida  [VinoTinto])
         (esTradicionalDe  [Andalucia])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo])
         (esCaliente  "false")
         (precioPlato  400)
    )

    ([Galicia] of Localizacion
    )

    ([GazpachoAndaluz] of Primer_Plato
         (esCompatibleCon  [PaellaValenciana])
         (esCompatibleConBebida  [VinoTinto])
         (esTradicionalDe  [Andalucia])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Pepino] [Tomate])
         (esCaliente  "true")
         (precioPlato  400)
    )

    ([Guisos] of Tipo_Plato
    )

    ([Huevo] of Ingrediente
    )

    ([Invierno] of Temporada
    )

    ([Lechuga] of Ingrediente
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

    ([Otoño] of Temporada
    )

    ([PaellaValenciana] of Segundo_Plato
         (esCompatibleCon  [GazpachoAndaluz])
         (esCompatibleConBebida  [Cerveza])
         (esTradicionalDe  [Cataluna])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [Arroz])
         (esCaliente  "true")
         (precioPlato  600)
    )

    ([PaisVasco] of Localizacion
    )

    ([Pasta] of Tipo_Plato
    )

    ([Patata] of Ingrediente
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
         (esCompatibleConBebida  [VinoTinto])
         (esTradicionalDe  [España])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo] [Patata])
         (esCaliente  "true")
         (precioPlato  450)
    )

    ([Verano] of Temporada
    )

    ([VinoTinto] of Bebida
         (precioBebida  700)
    )

)
