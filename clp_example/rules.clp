(defrule generar-menu
   ?prefs <- (preferencias
               (evento $?event)
               (temporada $?temp)
               (comensales ?comensal)
               (estilo $?est)
               (vegetariano ?veg)
               (precio-min ?min)
               (precio-max ?max))

   ;; Platos compatibles
   ?p1 <- (plato (nombre ?n1)
                 (tipo $?t1)
                 (temporada ?tp1)
                 (estilo ?es1)
                 (vegetariano ?v1)
                 (precio ?pp1)
                 (ingredientes $?ing1))

   ?p2 <- (plato (nombre ?n2)
                 (tipo $?t2)
                 (temporada ?tp2)
                 (estilo ?es2)
                 (vegetariano ?v2)
                 (precio ?pp2)
                 (ingredientes $?ing2))

   ?p3 <- (plato (nombre ?n3)
                 (tipo $?t3)
                 (temporada ?tp3)
                 (estilo ?es3)
                 (vegetariano ?v3)
                 (precio ?pp3)
                 (ingredientes $?ing3))

   ;; Tipos correctos
   (test (member$ primero ?t1))
   (test (member$ segundo ?t2))
   (test (member$ postre ?t3))

   ;; Vegerationo
   ;compreba si es preferncia es vegatariono (si/no) entoces los patos tambien
   (test (or (eq ?veg no)
             (and (eq ?veg si) (eq ?v1 si) (eq ?v2 si) (eq ?v3 si))))

   ;; Temporada y estilo vs preferencias
   (test (or (eq ?tp1 todo) (member$ ?tp1 ?temp)))
   (test (or (eq ?tp2 todo) (member$ ?tp2 ?temp)))
   (test (or (eq ?tp3 todo) (member$ ?tp3 ?temp)))

   (test (member$ ?es1 ?est))
   (test (member$ ?es2 ?est))
   (test (member$ ?es3 ?est))

   ;; Bebida compatible con platos
   ?b <- (bebida (nombre ?bnom)
                 (no-compatible-con $?no-compatibles)
                 (precio ?pb))

   (test (not (member$ ?n1 ?no-compatibles)))
   (test (not (member$ ?n2 ?no-compatibles)))
   (test (not (member$ ?n3 ?no-compatibles)))

   ;; Rango de precios total
   (test (<= (+ ?pp1 ?pp2 ?pp3 ?pb) ?max))
   (test (>= (+ ?pp1 ?pp2 ?pp3 ?pb) ?min))

   =>
   (bind ?precio-total (+ ?pp1 ?pp2 ?pp3 ?pb))

   (assert (menu (nombre "Opcion personalizada")
                 (primero ?n1)
                 (segundo ?n2)
                 (postre ?n3)
                 (bebida ?bnom)
                 (precio-total ?precio-total)))

   ;; Imprimir el menu generado
   ; (printout t "Menu generado: " ?n1 ", " ?n2 ", " ?n3 ", bebida: " ?bnom ", precio: " ?precio-total crlf)
)


(defrule siempre-imprimir
   =>
   (printout t "Esta regla siempre se ejecuta." crlf)
)