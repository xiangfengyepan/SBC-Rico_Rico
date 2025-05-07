(defmodule MAIN
    (export ?ALL)
)

(deffunction cls (?lines)
   (loop-for-count (?i 1 ?lines)
      (printout t crlf)))

;;; Funcion para imprimir un titulo con decoracion
(deffunction titulo (?texto)
   (cls 10)
   (printout t crlf)
   (printout t "===============================" crlf)
   (printout t "| " ?texto crlf)
   (printout t "===============================" crlf crlf))

(deffunction MAIN::saludo-inicial ()
   (titulo "Bienvenido a Rico Rico CLIPS")
   (printout t "Sistema de menus inteligente para eventos." crlf)
   (printout t "Version: 6.4.2" crlf crlf))


(defrule MAIN::inicio 
	(declare (salience 20)) 
	=> 
	(saludo-inicial)
    ; (make-instance [Invierno] of Temporada)
    ; (make-instance [Verano] of Temporada)
    ; (make-instance [Otono] of Temporada)
    ; (make-instance [Primavera] of Temporada)
	(focus entrada)
)


