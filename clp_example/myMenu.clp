;;; ---------------------------------------------------------
;;; clp_example/myMenu.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/myMenu.rdf
;;; :Date 01/05/2025 17:19:43

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
    (multislot precio
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tieneIngrediente
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Postre
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass PrimerPlato
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass SegundoPlato
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Bebida
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot precioBebida
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Cliente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot numeroComensales
        (type INSTANCE)
        (create-accessor read-write))
    (multislot precioMaximo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot precioMinimo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefiereEstilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prohibeIngrediente
        (type INSTANCE)
        (create-accessor read-write))
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
    (multislot usaIngredienteDeTemporada
        (type INSTANCE)
        (create-accessor read-write))
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
)

(defclass Temporada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(definstances instances
    ([ClienteEjemplo] of Cliente
         (numeroComensales  "120")
         (precioMaximo  "50.0")
         (precioMinimo  "20.0")
         (prefiereEstilo  [Moderno])
         (prohibeIngrediente  [Tomate])
    )

    ([Macarrones] of PrimerPlato
         (precio  "8.99")
    )

    ([Moderno] of Estilo
    )

    ([TartaDeQueso] of Postre
         (precio  "4.50")
    )

    ([Tomate] of Ingrediente
    )

    ([Verano] of Temporada
    )

    ([VinoTinto] of Bebida
         (precioBebida  "3.20")
    )

)
