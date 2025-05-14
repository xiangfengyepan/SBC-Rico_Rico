;;; ---------------------------------------------------------
;;; clp/ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/ontology.rdf
;;; :Date 14/05/2025 09:07:41

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esTemporadaEvento
        (type INSTANCE)
        (create-accessor read-write))
    (slot numeroComersales
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

(defclass Comida
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot esCompatibleCon
        (type INSTANCE)
        (create-accessor read-write))
    (multislot esTradicionalDe
        (type INSTANCE)
        (create-accessor read-write))
    (slot tieneCalorias
        (type INSTANCE)
        (create-accessor read-write))
    (slot tieneCarbohidratos
        (type INSTANCE)
        (create-accessor read-write))
    (slot tieneComplejidad
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneIngrediente
        (type INSTANCE)
        (create-accessor read-write))
    (slot tieneProteinas
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneTipoComida
        (type INSTANCE)
        (create-accessor read-write))
    (slot contieneAlcohol
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot contieneLactosa
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot esCaliente
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot precioComida
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Bebida
    (is-a Comida)
    (role concrete)
    (pattern-match reactive)
)

(defclass Plato
    (is-a Comida)
    (role concrete)
    (pattern-match reactive)
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

(defclass Cliente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot haceDeporte
        (type INSTANCE)
        (create-accessor read-write))
    (slot prefiereEstilo
        (type INSTANCE)
        (create-accessor read-write))
    (slot prefiereEvento
        (type INSTANCE)
        (create-accessor read-write))
    (slot esAlcoholico
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot esIntoleranteLactosa
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot esVegetariano
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot precioMaximo
        (type INTEGER)
        (create-accessor read-write))
    (slot precioMinimo
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Grado
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esTemporada
        (type INSTANCE)
        (create-accessor read-write))
    (slot esOrigenVegetariano
        (type SYMBOL)(default FALSE)
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
    (slot tieneBebida
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tienePlato
        (type INSTANCE)
        (create-accessor read-write))
    (slot precioMenu
        (type INTEGER)
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

(defclass Tipo_Bebida
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
         (precioComida  100)
    )

    ([Alta] of Grado
    )

    ([Andalucia] of Localizacion
    )

    ([Arroz] of Ingrediente
         (esOrigenVegetariano  TRUE)
    )

    ([Asados] of Tipo_Plato
    )

    ([Baja] of Grado
    )

    ([Carne] of Tipo_Plato
    )

    ([Cataluna] of Localizacion
    )

    ([Cerveza] of Bebida
         (precioComida  250)
    )

    ([Chocolate] of Ingrediente
         (esOrigenVegetariano  TRUE)
    )

    ([Clasico] of Tipo_Menu
    )

    ([EnsaladaCesar] of Primer_Plato
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Lechuga] [Pollo])
         (tieneTipoComida  [Ensaladas])
         (precioComida  350)
    )

    ([Ensaladas] of Tipo_Plato
    )

    ([España] of Localizacion
    )

    ([Estofados] of Tipo_Plato
    )

    ([FlanCasero] of Postre
         (esCompatibleCon  [PaellaValenciana])
         (esTradicionalDe  [Andalucia])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo])
         (esCaliente  FALSE)
         (precioComida  400)
    )

    ([Galicia] of Localizacion
    )

    ([GazpachoAndaluz] of Primer_Plato
         (esCompatibleCon  [PaellaValenciana])
         (esTradicionalDe  [Andalucia])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Pepino] [Tomate])
         (esCaliente  TRUE)
         (precioComida  400)
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
         (esOrigenVegetariano  FALSE)
    )

    ([Media] of Grado
    )

    ([Moderno] of Tipo_Menu
    )

    ([Otoño] of Temporada
    )

    ([PaellaValenciana] of Segundo_Plato
         (esCompatibleCon  [GazpachoAndaluz])
         (esTradicionalDe  [Cataluna])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [Arroz])
         (esCaliente  TRUE)
         (precioComida  600)
    )

    ([PaisVasco] of Localizacion
    )

    ([Pasta] of Tipo_Plato
    )

    ([Patata] of Ingrediente
    )

    ([Pepino] of Ingrediente
         (esOrigenVegetariano  TRUE)
    )

    ([Pescado] of Tipo_Plato
    )

    ([Pollo] of Ingrediente
         (esOrigenVegetariano  FALSE)
    )

    ([Primavera] of Temporada
    )

    ([Queso] of Ingrediente
         (esOrigenVegetariano  FALSE)
    )

    ([RefrescoCola] of Bebida
         (precioComida  150)
    )

    ([Leche] of Bebida
         (contieneLactosa  TRUE)
    )

    ([Regional] of Tipo_Menu
    )

    ([Sibarita] of Tipo_Menu
    )

    ([Sidra] of Bebida
         (precioComida  350)
    )

    ([Sopas] of Tipo_Plato
    )

    ([Tomate] of Ingrediente
         (esOrigenVegetariano  TRUE)
    )

    ([TortillaPatatas] of Segundo_Plato
         (esTradicionalDe  [España])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo] [Patata])
         (esCaliente  TRUE)
         (precioComida  450)
    )

    ([Verano] of Temporada
    )

    ([VinoTinto] of Bebida
         (precioComida  700)
    )

)
