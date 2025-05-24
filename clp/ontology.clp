;;; ---------------------------------------------------------
;;; clp/ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontology/ontology.rdf
;;; :Date 24/05/2025 17:33:46

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
    (multislot tieneTipoPlato
        (type INSTANCE)
        (create-accessor read-write))
    (slot anoCreacion
        (type INTEGER)(default -9999)
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
        (type INTEGER)(default -9999)
        (create-accessor read-write))
    (slot racionesMinimalistas
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot tieneAzucar
        (type INSTANCE)
        (create-accessor read-write))
    (slot tieneCafeina
        (type INSTANCE)
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

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esTemporadaEvento
        (type INSTANCE)
        (create-accessor read-write))
    (slot numeroComersales
        (type INTEGER)(default -9999)
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
        (type INTEGER)(default -9999)
        (create-accessor read-write))
    (slot precioMinimo
        (type INTEGER)(default -9999)
        (create-accessor read-write))
    (slot tieneEdad
        (type INTEGER)(default -9999)
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
    (multislot esTemporada
        (type INSTANCE)
        (create-accessor read-write))
    (slot esOrigenVegetariano
        (type SYMBOL)(default FALSE)
        (create-accessor read-write))
    (slot esRegional
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
        (type INTEGER)(default -9999)
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
    ([EnsaladaCesar] of Primer_Plato
         (esCompatibleCon  [AguaMineral] [PaellaValenciana])
         (esTradicionalDe  [Espana] [Cataluna])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Lechuga] [Pollo])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Ensaladas])
         (anoCreacion  1920)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  350)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([GazpachoAndaluz] of Primer_Plato
         (esCompatibleCon  [PaellaValenciana] [AguaMineral])
         (esTradicionalDe  [Andalucia] [Espana])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Pepino] [Tomate])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1800)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  400)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([CremaCalabaza] of Primer_Plato
         (esCompatibleCon  [AguaMineral])
         (esTradicionalDe  [Espana])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Calabaza] [Cebolla])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1950)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  300)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([HuevosRellenos] of Primer_Plato
         (esCompatibleCon  [RefrescoCola])
         (esTradicionalDe  [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo] [Atun])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Huevos])
         (anoCreacion  1900)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  350)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([SopaCafe] of Primer_Plato
         (esCompatibleCon  [FlanCasero])
         (esTradicionalDe  [Espana])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Cafe] [Leche])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1970)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  TRUE)
         (precioComida  400)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Alta])
    )

    ([Tabule] of Primer_Plato
         (esCompatibleCon  [AguaMineral])
         (esTradicionalDe  [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Cuscus] [Menta])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Ensaladas])
         (anoCreacion  1700)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  320)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([ConsomeJerez] of Primer_Plato
         (esCompatibleCon  [TortillaPatatas])
         (esTradicionalDe  [Andalucia])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [CaldoCarne] [Jerez])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1850)
         (contieneAlcohol  TRUE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  550)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([MelonConJamon] of Primer_Plato
         (esCompatibleCon  [AguaMineral] [VinoBlanco])
         (esTradicionalDe  [Espana] [CastillaLaMancha])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Melon] [Jamon])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Ensaladas])
         (anoCreacion  1920)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  390)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([Minestrone] of Primer_Plato
         (esCompatibleCon  [AguaMineral] [TortillaPatatas])
         (esTradicionalDe  [Italia] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [Fideos] [Zanahoria])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1600)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  480)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([AjoBlanco] of Primer_Plato
         (esCompatibleCon  [AguaMineral] [TortillaPatatas])
         (esTradicionalDe  [Andalucia] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Almendra] [Ajo])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Sopas])
         (anoCreacion  1500)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  380)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([PaellaValenciana] of Segundo_Plato
         (esCompatibleCon  [GazpachoAndaluz] [VinoTinto])
         (esTradicionalDe  [Cataluna] [Valencia])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [Arroz] [Pollo] [JudiaVerde] [Garrofo])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Pasta])
         (anoCreacion  1800)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  600)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([TortillaPatatas] of Segundo_Plato
         (esCompatibleCon  [RefrescoCola] [EnsaladaCesar])
         (esTradicionalDe  [Andalucia] [Madrid])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Huevo] [Patata])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Huevos])
         (anoCreacion  1700)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  450)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([TofuTeriyaki] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [EnsaladaCesar])
         (esTradicionalDe  [Andalucia] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Tofu] [SalsaTeriyaki] [Brocoli])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Verduras])
         (anoCreacion  1990)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  500)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([PolloAsado] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [EnsaladaCesar])
         (esTradicionalDe  [Andalucia] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Pollo] [Patata] [Especias])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Carne])
         (anoCreacion  1900)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  700)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([Lasana] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [EnsaladaCesar])
         (esTradicionalDe  [Italia] [Espana])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [CarnePicada] [PastaLamina] [Tomate] [Bechamel])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Pasta])
         (anoCreacion  1300)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  TRUE)
         (precioComida  850)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([MerluzaEnSalsa] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [GazpachoAndaluz])
         (esTradicionalDe  [Galicia] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Merluza] [Ajo] [Perejil] [Guisantes])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Pescado])
         (anoCreacion  1950)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  600)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([SeitanCerveza] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [EnsaladaCesar])
         (esTradicionalDe  [Cataluna] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Seitan] [CervezaNegra] [Cebolla])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Verduras])
         (anoCreacion  2005)
         (contieneAlcohol  TRUE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  520)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([CanelonesEspinacaRicotta] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [GazpachoAndaluz])
         (esTradicionalDe  [Italia] [Espana])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Espinaca] [Ricotta] [PastaLamina] [Bechamel])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Pasta])
         (anoCreacion  1975)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  TRUE)
         (precioComida  650)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([SolomilloCafe] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [GazpachoAndaluz])
         (esTradicionalDe  [Madrid] [Espana])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Baja])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Solomillo] [Cafe] [Patata])
         (tieneProteinas  [Alta])
         (tieneTipoPlato  [Carne])
         (anoCreacion  1980)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  750)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Alta])
    )

    ([PistoHuevo] of Segundo_Plato
         (esCompatibleCon  [AguaMineral] [GazpachoAndaluz])
         (esTradicionalDe  [CastillaLaMancha] [Espana])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Pimiento] [Calabacin] [Tomate] [Huevo])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Huevos])
         (anoCreacion  1920)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  TRUE)
         (precioComida  580)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([FlanCasero] of Postre
         (esCompatibleCon  [MelonConJamon] [AguaMineral])
         (esTradicionalDe  [Espana] [Andalucia])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Huevo] [Leche] [Azucar])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1500)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  400)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([Tiramisu] of Postre
         (esCompatibleCon  [Tabule] [AguaMineral])
         (esTradicionalDe  [Italia] [Europa])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Alta])
         (tieneIngrediente  [Huevo] [Cafe] [Mascarpone] [Bizcocho])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1960)
         (contieneAlcohol  TRUE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  700)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Alta])
    )

    ([FrutaFresca] of Postre
         (esCompatibleCon  [Tabule] [AguaMineral])
         (esTradicionalDe  [Espana] [Cataluna])
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Fruta])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1000)
         (contieneAlcohol  FALSE)
         (contieneLactosa  FALSE)
         (esCaliente  FALSE)
         (precioComida  300)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([HeladoVainilla] of Postre
         (esCompatibleCon  [TortillaPatatas] [AguaMineral])
         (esTradicionalDe  [Espana] [Cataluna])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Leche] [Azucar] [Vainilla])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1850)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  450)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([YogurConMiel] of Postre
         (esCompatibleCon  [Tabule] [AguaMineral])
         (esTradicionalDe  [Murcia] [Valencia])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [Leche] [Miel])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1950)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  350)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([MousseChocolate] of Postre
         (esCompatibleCon  [TortillaPatatas] [AguaMineral])
         (esTradicionalDe  [Francia] [Europa])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Chocolate] [Leche] [Azucar])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1890)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  500)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Media])
    )

    ([PastelManzana] of Postre
         (esCompatibleCon  [MelonConJamon] [AguaMineral])
         (esTradicionalDe  [Francia] [Europa])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Manzana] [Leche] [Azucar])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1700)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  TRUE)
         (precioComida  550)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([Natillas] of Postre
         (esCompatibleCon  [GazpachoAndaluz] [AguaMineral])
         (esTradicionalDe  [Espana] [Andalucia])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Leche] [Azucar] [Huevo] [Canela])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1800)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  400)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([TartaQueso] of Postre
         (esCompatibleCon  [Tabule] [AguaMineral])
         (esTradicionalDe  [Espana] [Madrid])
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Media])
         (tieneIngrediente  [Queso] [Azucar] [Huevo])
         (tieneProteinas  [Media])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  1900)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  600)
         (racionesMinimalistas  FALSE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([MagdalenaIntegral] of Postre
         (esCompatibleCon  [PistoHuevo] [AguaMineral])
         (esTradicionalDe  [Espana] [Cataluna])
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Alta])
         (tieneComplejidad  [Baja])
         (tieneIngrediente  [HarinaIntegral] [Huevo] [Leche] [Azucar])
         (tieneProteinas  [Baja])
         (tieneTipoPlato  [Dulces])
         (anoCreacion  2000)
         (contieneAlcohol  FALSE)
         (contieneLactosa  TRUE)
         (esCaliente  FALSE)
         (precioComida  420)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([AguaMineral] of Bebida
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneProteinas  [Baja])
         (anoCreacion  1000)
         (contieneAlcohol  FALSE)
         (esCaliente  FALSE)
         (precioComida  100)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([RefrescoCola] of Bebida
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneProteinas  [Baja])
         (anoCreacion  1886)
         (contieneAlcohol  FALSE)
         (esCaliente  FALSE)
         (precioComida  150)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Alta])
    )

    ([Cerveza] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneProteinas  [Baja])
         (anoCreacion  5000)
         (contieneAlcohol  TRUE)
         (esCaliente  FALSE)
         (precioComida  250)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([Tonica] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneProteinas  [Baja])
         (anoCreacion  1858)
         (contieneAlcohol  FALSE)
         (esCaliente  FALSE)
         (precioComida  220)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Media])
    )

    ([Sidra] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneProteinas  [Baja])
         (anoCreacion  1000)
         (contieneAlcohol  TRUE)
         (esCaliente  FALSE)
         (precioComida  350)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([VinoTinto] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneProteinas  [Baja])
         (anoCreacion  6000)
         (contieneAlcohol  TRUE)
         (esCaliente  FALSE)
         (precioComida  400)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([VinoBlanco] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Baja])
         (tieneProteinas  [Baja])
         (anoCreacion  6000)
         (contieneAlcohol  TRUE)
         (esCaliente  FALSE)
         (precioComida  375)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Baja])
    )

    ([TeVerde] of Bebida
         (tieneCalorias  [Baja])
         (tieneCarbohidratos  [Baja])
         (tieneProteinas  [Baja])
         (anoCreacion  2000)
         (contieneAlcohol  FALSE)
         (esCaliente  TRUE)
         (precioComida  200)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Baja])
         (tieneCafeina  [Media])
    )

    ([ZumoNaranja] of Bebida
         (tieneCalorias  [Media])
         (tieneCarbohidratos  [Media])
         (tieneProteinas  [Baja])
         (anoCreacion  1930)
         (contieneAlcohol  FALSE)
         (esCaliente  FALSE)
         (precioComida  250)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Media])
         (tieneCafeina  [Baja])
    )

    ([RefrescoLimon] of Bebida
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneProteinas  [Baja])
         (anoCreacion  1920)
         (contieneAlcohol  FALSE)
         (esCaliente  FALSE)
         (precioComida  200)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Baja])
    )

    ([ChocolateCaliente] of Bebida
         (tieneCalorias  [Alta])
         (tieneCarbohidratos  [Alta])
         (tieneProteinas  [Baja])
         (anoCreacion  1500)
         (contieneAlcohol  FALSE)
         (esCaliente  TRUE)
         (precioComida  350)
         (racionesMinimalistas  TRUE)
         (tieneAzucar  [Alta])
         (tieneCafeina  [Media])
    )

    ([Arroz] of Ingrediente
         (esTemporada  [Verano] [Otono])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Chocolate] of Ingrediente
         (esTemporada  [Invierno] [Primavera])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Huevo] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono])
         (esOrigenVegetariano  FALSE)
         (esRegional  FALSE)
    )

    ([Lechuga] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Marisco] of Ingrediente
         (esTemporada  [Invierno] [Otono])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([Patata] of Ingrediente
         (esTemporada  [Invierno] [Otono])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Pepino] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Pollo] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  FALSE)
         (esRegional  FALSE)
    )

    ([Queso] of Ingrediente
         (esTemporada  [Invierno] [Otono])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([Tomate] of Ingrediente
         (esTemporada  [Verano] [Primavera])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Calabaza] of Ingrediente
         (esTemporada  [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Cebolla] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Atun] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  FALSE)
         (esRegional  FALSE)
    )

    ([Cafe] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Cuscus] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Menta] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([CaldoCarne] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  FALSE)
         (esRegional  FALSE)
    )

    ([Jerez] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Tofu] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([SalsaTeriyaki] of Ingrediente
         (esTemporada  [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Brocoli] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([JudiaVerde] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Garrofo] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Especias] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([CarnePicada] of Ingrediente
         (esTemporada  [Otono] [Invierno])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([PastaLamina] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Bechamel] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Merluza] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([Perejil] of Ingrediente
         (esTemporada  [Primavera] [Verano])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Guisantes] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Seitan] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([CervezaNegra] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Espinaca] of Ingrediente
         (esTemporada  [Primavera] [Otono])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Ricotta] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Solomillo] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([Pimiento] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Calabacin] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Leche] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Azucar] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Mascarpone] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Bizcocho] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Fruta] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Vainilla] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([Miel] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Manzana] of Ingrediente
         (esTemporada  [Otono])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Canela] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  FALSE)
    )

    ([HarinaIntegral] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Ajo] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Almendra] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Fideos] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Jamon] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  FALSE)
         (esRegional  TRUE)
    )

    ([Melon] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Zanahoria] of Ingrediente
         (esTemporada  [Primavera] [Verano] [Otono] [Invierno])
         (esOrigenVegetariano  TRUE)
         (esRegional  TRUE)
    )

    ([Asados] of Tipo_Plato
    )

    ([Carne] of Tipo_Plato
    )

    ([Ensaladas] of Tipo_Plato
    )

    ([Estofados] of Tipo_Plato
    )

    ([Guisos] of Tipo_Plato
    )

    ([Pasta] of Tipo_Plato
    )

    ([Pescado] of Tipo_Plato
    )

    ([Sopas] of Tipo_Plato
    )

    ([Huevos] of Tipo_Plato
    )

    ([Verduras] of Tipo_Plato
    )

    ([Dulces] of Tipo_Plato
    )

    ([Clasico] of Tipo_Menu
    )

    ([Moderno] of Tipo_Menu
    )

    ([Regional] of Tipo_Menu
    )

    ([Sibarita] of Tipo_Menu
    )

    ([Alta] of Grado
    )

    ([Media] of Grado
    )

    ([Baja] of Grado
    )

    ([Andalucia] of Localizacion
    )

    ([Cataluna] of Localizacion
    )

    ([Espana] of Localizacion
    )

    ([Italia] of Localizacion
    )

    ([Francia] of Localizacion
    )

    ([Galicia] of Localizacion
    )

    ([Madrid] of Localizacion
    )

    ([PaisVasco] of Localizacion
    )

    ([CastillaLaMancha] of Localizacion
    )

    ([Europa] of Localizacion
    )

    ([Valencia] of Localizacion
    )

    ([Murcia] of Localizacion
    )

    ([Invierno] of Temporada
    )

    ([Otono] of Temporada
    )

    ([Primavera] of Temporada
    )

    ([Verano] of Temporada
    )

)
