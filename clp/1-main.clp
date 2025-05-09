(defmodule MAIN (export ?ALL))

(load "ontology.clp")
(load "2-input.clp")
(load "3-analisis.clp")
(load "4-sintesis.clp")
(load "5-output.clp")

(defrule MAIN::start
    => 
    (loop-for-count (?i 1 10) (printout t crlf))
    (printout t crlf)
    (printout t "================================" crlf)
    (printout t "| Bienvenido a Rico Rico CLIPS |" crlf)
    (printout t "================================" crlf crlf)
    (printout t "Sistema de menus inteligente para eventos." crlf)

    (focus input)
)

(reset)
(run)
(exit)