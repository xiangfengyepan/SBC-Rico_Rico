(deffacts hechos-iniciales
   (plato (nombre "Gazpacho") (tipo primero) (temporada verano) (estilo clasico) (vegetariano si) (precio 4) (ingredientes tomate pepino aceite))
   (plato (nombre "Ensalada de queso") (tipo primero) (temporada todo) (estilo clasico) (vegetariano si) (precio 5) (ingredientes queso lechuga nueces))
   (plato (nombre "Tofu salteado") (tipo segundo) (temporada verano) (estilo clasico) (vegetariano si) (precio 7) (ingredientes tofu verduras soja))
   (plato (nombre "Tarta de chocolate") (tipo postre) (temporada todo) (estilo clasico) (vegetariano si) (precio 6) (ingredientes chocolate nata))
   (bebida (nombre "Vino tinto") (no-compatible-con "Solomillo al vino" "Bacalao al pil pil") (precio 4))
   (bebida (nombre "Agua mineral") (no-compatible-con "Gazpacho" "Ensalada de queso" "Tarta de chocolate" "Tofu salteado") (precio 1))
   (preferencias
         (evento familiar)
         (temporada verano)
         (comensales 50)
         (estilo clasico)
         (vegetariano si)
         (precio-min 10)
         (precio-max 20000))
)

(deffacts primeros-platos
   (plato (nombre "Salmorejo cordobés") (tipo primero) (temporada verano) (estilo regional) (vegetariano si) (precio 5) (ingredientes tomate pan ajo aceite))
   (plato (nombre "Crema de calabaza") (tipo primero) (temporada invierno) (estilo clasico) (vegetariano si) (precio 6) (ingredientes calabaza cebolla nata))
   (plato (nombre "Ensalada de quinoa") (tipo primero) (temporada todo) (estilo moderno) (vegetariano si) (precio 7) (ingredientes quinoa tomate pepino aguacate))
)


(deffacts segundos-platos
   (plato (nombre "Paella de verduras") (tipo segundo) (temporada todo) (estilo regional) (vegetariano si) (precio 10) (ingredientes arroz pimiento judia verde tomate))
   (plato (nombre "Moussaka vegetariana") (tipo segundo) (temporada todo) (estilo moderno) (vegetariano si) (precio 8) (ingredientes berenjena tomate queso bechamel))
   (plato (nombre "Hamburguesa vegana") (tipo segundo) (temporada todo) (estilo moderno) (vegetariano si) (precio 9) (ingredientes soja lechuga tomate pan))
)


(deffacts postres
   (plato (nombre "Tarta de chocolate") (tipo postre) (temporada todo) (estilo clasico) (vegetariano si) (precio 6) (ingredientes chocolate nata))
   (plato (nombre "Macedonia de frutas") (tipo postre) (temporada verano) (estilo clasico) (vegetariano si) (precio 4) (ingredientes manzana melón piña naranja))
   (plato (nombre "Flan de coco") (tipo postre) (temporada todo) (estilo clasico) (vegetariano si) (precio 5) (ingredientes huevo coco leche condensada))
   (plato (nombre "Coulant de chocolate") (tipo postre) (temporada invierno) (estilo sibarita) (vegetariano si) (precio 7) (ingredientes chocolate mantequilla harina))
)


(deffacts bebidas
   (bebida (nombre "Cerveza artesanal") (no-compatible-con "Hamburguesa vegana" "Moussaka vegetariana") (precio 3))
   (bebida (nombre "Zumo natural") (no-compatible-con "Macedonia de frutas" "Ensalada de quinoa" "Salmorejo cordobés") (precio 2))
   (bebida (nombre "Cava") (no-compatible-con "Coulant de chocolate" "Tarta de chocolate") (precio 5))
)


(deffacts preferencias-evento
   (preferencias
         (evento boda)
         (temporada verano)
         (comensales 100)
         (estilo moderno)
         (vegetariano si)
         (precio-min 15)
         (precio-max 5000))
)
