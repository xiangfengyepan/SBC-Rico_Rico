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

(defrule generar-menu
   ?prefs <- (preferencias
               (evento ?event)
               (temporada ?temp)
               (comensales ?comersal)
               (estilo ?est)
               (vegetariano ?veg)
               (precio-min ?min)
               (precio-max ?max))
   
    ?p1 <- (plato (nombre ?n1) (tipo primero) (temporada ?temp | todo) (estilo ?est) (vegetariano ?veg) (precio ?pp1) (ingredientes $?ing1))
    ?p2 <- (plato (nombre ?n2) (tipo segundo) (temporada ?temp | todo) (estilo ?est) (vegetariano ?veg) (precio ?pp2) (ingredientes $?ing2))
    ?p3 <- (plato (nombre ?n3) (tipo postre)  (temporada ?temp | todo) (estilo ?est) (vegetariano ?veg) (precio ?pp3) (ingredientes $?ing3))

   
   ;; Bebida con lista de compatibilidad
   ?b <- (bebida (nombre ?bnom) (compatible-con $?compatibles) (precio ?pb))

   ;; Comprobación de la compatibilidad entre los platos y la bebida
   (test (or (member$ ?n1 ?compatibles) (member$ "todos" ?compatibles)))
   (test (or (member$ ?n2 ?compatibles) (member$ "todos" ?compatibles)))
   (test (or (member$ ?n3 ?compatibles) (member$ "todos" ?compatibles)))

   ;; Comprobación del rango de precios
   (test (<= (+ ?pp1 ?pp2 ?pp3 ?pb) ?max))
   (test (>= (+ ?pp1 ?pp2 ?pp3 ?pb) ?min))

   =>
   (bind ?precio-total (+ ?pp1 ?pp2 ?pp3 ?pb))

   ;; Asignación de menú
   (assert (menu (nombre "Opción personalizada")
                 (primero ?n1)
                 (segundo ?n2)
                 (postre ?n3)
                 (bebida ?bnom)
                 (precio-total ?precio-total)))
   
   ;; Imprimir el menú generado
   (printout t "Menu generado: " ?n1 ", " ?n2 ", " ?n3 ", bebida: " ?bnom ", precio: " ?precio-total crlf)
)


(defrule siempre-imprimir
   =>
   (printout t "Esta regla siempre se ejecuta." crlf)
)