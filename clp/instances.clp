(definstances instances
    ; Plato instances
    (plato1 of Plato
        (esCompatibleCon plato2 plato3)
        (esCompatibleConBebida bebida1 bebida2)
        (esTradicionalDe region1)
        (tieneComplejidad baja)
        (tieneIngrediente ingrediente1 ingrediente2)
        (tieneTipoPlato principal)
        (esCaliente yes)
        (precioPlato 15))
    
    (plato2 of Plato
        (esCompatibleCon plato1 plato4)
        (esCompatibleConBebida bebida3)
        (esTradicionalDe region2)
        (tieneComplejidad media)
        (tieneIngrediente ingrediente3 ingrediente4)
        (tieneTipoPlato entrante)
        (esCaliente no)
        (precioPlato 10))
    
    (plato3 of Plato
        (esCompatibleCon plato1 plato4)
        (esCompatibleConBebida bebida1 bebida4)
        (esTradicionalDe region1 region3)
        (tieneComplejidad alta)
        (tieneIngrediente ingrediente5 ingrediente6)
        (tieneTipoPlato principal)
        (esCaliente yes)
        (precioPlato 20))
    
    ; Postre instances
    (postre1 of Postre
        (esCompatibleCon plato1 plato2)
        (esCompatibleConBebida bebida4)
        (esTradicionalDe region1)
        (tieneComplejidad baja)
        (tieneIngrediente ingrediente7 ingrediente8)
        (tieneTipoPlato postre)
        (esCaliente no)
        (precioPlato 8))
    
    (postre2 of Postre
        (esCompatibleCon plato3)
        (esCompatibleConBebida bebida2 bebida3)
        (esTradicionalDe region2)
        (tieneComplejidad media)
        (tieneIngrediente ingrediente9)
        (tieneTipoPlato postre)
        (esCaliente yes)
        (precioPlato 12))
    
    ; Primer_Plato instances
    (primer1 of Primer_Plato
        (esCompatibleCon segundo1 postre1)
        (esCompatibleConBebida bebida1 bebida3)
        (esTradicionalDe region3)
        (tieneComplejidad baja)
        (tieneIngrediente ingrediente10 ingrediente11)
        (tieneTipoPlato entrada)
        (esCaliente yes)
        (precioPlato 9))
    
    (primer2 of Primer_Plato
        (esCompatibleCon segundo2 postre2)
        (esCompatibleConBebida bebida2)
        (esTradicionalDe region4)
        (tieneComplejidad media)
        (tieneIngrediente ingrediente12)
        (tieneTipoPlato entrada)
        (esCaliente no)
        (precioPlato 11))
    
    ; Segundo_Plato instances
    (segundo1 of Segundo_Plato
        (esCompatibleCon primer1 postre1)
        (esCompatibleConBebida bebida4)
        (esTradicionalDe region1)
        (tieneComplejidad alta)
        (tieneIngrediente ingrediente13 ingrediente14)
        (tieneTipoPlato principal)
        (esCaliente yes)
        (precioPlato 18))
    
    (segundo2 of Segundo_Plato
        (esCompatibleCon primer2)
        (esCompatibleConBebida bebida1 bebida3)
        (esTradicionalDe region2)
        (tieneComplejidad media)
        (tieneIngrediente ingrediente15)
        (tieneTipoPlato principal)
        (esCaliente yes)
        (precioPlato 16))
    
    ; Bebida instances
    (bebida1 of Bebida
        (precioBebida 5))
    
    (bebida2 of Bebida
        (precioBebida 3))
    
    (bebida3 of Bebida
        (precioBebida 4))
    
    (bebida4 of Bebida
        (precioBebida 6))
    
    ; Region instances (needed for esTradicionalDe)
    (region1 of USER)
    (region2 of USER)
    (region3 of USER)
    (region4 of USER)
    
    ; Ingrediente instances (needed for tieneIngrediente)
    (ingrediente1 of USER)
    (ingrediente2 of USER)
    (ingrediente3 of USER)
    (ingrediente4 of USER)
    (ingrediente5 of USER)
    (ingrediente6 of USER)
    (ingrediente7 of USER)
    (ingrediente8 of USER)
    (ingrediente9 of USER)
    (ingrediente10 of USER)
    (ingrediente11 of USER)
    (ingrediente12 of USER)
    (ingrediente13 of USER)
    (ingrediente14 of USER)
    (ingrediente15 of USER)
)