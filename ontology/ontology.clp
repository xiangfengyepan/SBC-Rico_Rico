(deftemplate Bebida
   (slot precioBebida)
)

(deftemplate Cliente
   (slot numeroComensales)
   (slot precioMaximo)
   (slot precioMinimo)
)

(deftemplate DatatypeProperty
)

(deftemplate Estilo
)

(deftemplate Ingrediente
)

(deftemplate Menu
)

(deftemplate NamedIndividual
)

(deftemplate ObjectProperty
)

(deftemplate Ontology
)

(deftemplate Plato
)

(deftemplate Postre
   (slot precio)
)

(deftemplate PrimerPlato
   (slot precio)
)

(deftemplate SegundoPlato
)

(deftemplate Temporada
)

(assert (NamedIndividual))

(assert (NamedIndividual))

(assert (NamedIndividual (precioBebida "3.20")))

(assert (NamedIndividual))

(assert (NamedIndividual (numeroComensales 120) (precioMaximo "50.0") (precioMinimo "20.0")))

(assert (NamedIndividual (precio "4.50")))

(assert (NamedIndividual (precio "8.99")))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (ObjectProperty))

(assert (Temporada))

(assert (Cliente (numeroComensales 120) (precioMaximo "50.0") (precioMinimo "20.0")))

(assert (DatatypeProperty))

(assert (DatatypeProperty))

(assert (DatatypeProperty))

(assert (DatatypeProperty))

(assert (DatatypeProperty))

(assert (Ingrediente))

(assert (Estilo))

(assert (Ontology))

(assert (PrimerPlato (precio "8.99")))

(assert (Postre (precio "4.50")))

(assert (Bebida (precioBebida "3.20")))
