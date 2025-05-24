;; Definición del módulo principal llamado MAIN, y se exportan todas sus funciones/reglas
(defmodule MAIN (export ?ALL))

;; Se cargan los archivos necesarios que contienen definiciones y reglas:
(load "ontology.clp")       ;; Carga la ontología (estructura de conocimiento base)
(load "2-input.clp")        ;; Carga el modulo para el prompt de la entrada de datos del cliente
(load "3-analisis.clp")     ;; Carga las reglas para el análisis de los datos segun los datos del cliente ingresados
(load "4-sintesis.clp")     ;; Carga las reglas para la síntesis (creacion) de los menus
(load "5-output.clp")       ;; Carga el modulo mostar los menus resultados en la salida

(defrule MAIN::start
    =>                             ;; No tiene condiciones, se ejecuta al inicio automáticamente
    ;; Imprime un encabezado de bienvenida al sistema
    (loop-for-count (?i 1 10) (printout t crlf)) ;; linias en blanco para presentacion
    (printout t crlf)
    (printout t "================================" crlf)
    (printout t "| Bienvenido a Rico Rico CLIPS |" crlf)
    (printout t "================================" crlf crlf)
    (printout t "Sistema de menus inteligente para eventos." crlf)

    ;; Cambia al módulo de entrada para recibir información del cliente
    (focus input)
)

;; Inicializa el sistema (borra hechos anteriores y activa reglas)
(reset)
;; Ejecuta la regla MAIN::start
(run)

(exit)
