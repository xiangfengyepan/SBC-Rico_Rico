;; DEFINICIONES DE PLATOS
(deftemplate plato
   (slot nombre)
   (slot tipo) ;; primero, segundo, postre
   (slot temporada) ;; todo, verano, invierno, etc.
   (slot estilo) ;; clasico, moderno, regional, sibarita
   (slot vegetariano) ;; sí / no
   (slot precio)
   (multislot  ingredientes) ;; lista de ingredientes
)

;; DEFINICIONES DE BEBIDAS
(deftemplate bebida
   (slot nombre)
   (multislot compatible-con) ;; lista de platos
   (slot precio)
)

;; DEFINICIONES DE PREFERENCIAS DEL USUARIO
(deftemplate preferencias
   (slot evento)
   (slot temporada)
   (slot comensales)
   (slot estilo)
   (slot vegetariano)
   (slot precio-min)
   (slot precio-max)
)

;; DEFINICIÓN DEL MENÚ SELECCIONADO
(deftemplate menu
   (slot nombre)
   (slot primero)
   (slot segundo)
   (slot postre)
   (slot bebida)
   (slot precio-total)
)


;; EJEMPLOS DE PLATOS
(deffacts platos-ejemplo
   (plato (nombre "Ensalada de queso") (tipo primero) (temporada todo) (estilo clasico) (vegetariano sí) (precio 5) (ingredientes queso lechuga nueces))
   (plato (nombre "Solomillo al vino") (tipo segundo) (temporada todo) (estilo sibarita) (vegetariano no) (precio 15) (ingredientes carne vino))
   (plato (nombre "Tarta de chocolate") (tipo postre) (temporada todo) (estilo clasico) (vegetariano sí) (precio 6) (ingredientes chocolate nata))
   (plato (nombre "Gazpacho") (tipo primero) (temporada verano) (estilo regional) (vegetariano sí) (precio 4) (ingredientes tomate pepino aceite))
   (plato (nombre "Bacalao al pil pil") (tipo segundo) (temporada todo) (estilo regional) (vegetariano no) (precio 12) (ingredientes bacalao aceite ajo))
)

;; EJEMPLOS DE BEBIDAS
(deffacts bebidas-ejemplo
   (bebida (nombre "Vino tinto") (compatible-con "Solomillo al vino" "Bacalao al pil pil") (precio 4))
   (bebida (nombre "Agua mineral") (compatible-con "todos") (precio 1))
)

;; EJEMPLO DE PREFERENCIAS DEL USUARIO
(deffacts preferencias-usuario
   (preferencias
      (evento familiar)
      (temporada verano)
      (comensales 50)
      (estilo clasico)
      (vegetariano sí)
      (precio-min 10)
      (precio-max 25)
   )
)

(defrule generar-menu
   ?prefs <- (preferencias
               (temporada ?temp)
               (estilo ?est)
               (vegetariano ?veg)
               (precio-min ?min)
               (precio-max ?max))
   ?p1 <- (plato (nombre ?n1) (tipo primero) (temporada ?t1) (estilo ?est) (vegetariano ?veg) (precio ?pp1))
   (test (or (eq ?t1 ?temp) (eq ?t1 todo)))
   ?p2 <- (plato (nombre ?n2) (tipo segundo) (temporada ?t2) (estilo ?est) (vegetariano ?veg) (precio ?pp2))
   (test (or (eq ?t2 ?temp) (eq ?t2 todo)))
   ?p3 <- (plato (nombre ?n3) (tipo postre) (temporada ?t3) (estilo ?est) (vegetariano ?veg) (precio ?pp3))
   (test (or (eq ?t3 ?temp) (eq ?t3 todo)))
   ?b <- (bebida (nombre ?bnom) (compatible-con ?compatibles) (precio ?pb))
   (test (or (member$ ?n1 (create$ todos)) (member$ ?n1 ?compatibles)))
   (test (or (member$ ?n2 (create$ todos)) (member$ ?n2 ?compatibles)))
   (test (or (member$ ?n3 (create$ todos)) (member$ ?n3 ?compatibles)))
   (test (<= (+ ?pp1 ?pp2 ?pp3 ?pb) ?max))
   (test (>= (+ ?pp1 ?pp2 ?pp3 ?pb) ?min))
   =>
   (bind ?precio-total (+ ?pp1 ?pp2 ?pp3 ?pb))
   (assert (menu (nombre "Opción personalizada")
                 (primero ?n1)
                 (segundo ?n2)
                 (postre ?n3)
                 (bebida ?bnom)
                 (precio-total ?precio-total)))
   (printout t "Menú generado: " ?n1 ", " ?n2 ", " ?n3 ", bebida: " ?bnom ", precio: " ?precio-total crlf)
)

