;;; ================================
;;; Archivo: utils.clp
;;; Funciones útiles para CLIPS
;;; ================================

;;; ================================
;;; FUNCIONES DE INTERFAZ Y SALIDA
;;; ================================

;;; Función para "limpiar" la pantalla (simulación)
(deffunction cls ()
   (loop-for-count (?i 1 50)
      (printout t crlf)))

;;; Función para imprimir un título con decoración
(deffunction titulo (?texto)
   (printout t crlf)
   (printout t "===============================" crlf)
   (printout t "| " ?texto crlf)
   (printout t "===============================" crlf crlf))

;;; Función para pausar (esperar Enter)
(deffunction read-line (?text)
   (printout t ?text crlf)
   (readline))

;;; Función para imprimir un menú numerado
(deffunction imprimir-lista (?titulo $?items)
   (printout t crlf ?titulo crlf)
   (loop-for-count (?i 1 (length$ ?items))
      (printout t ?i ". " (nth$ ?i ?items) crlf)))

;;; Función para imprimir una línea separadora
(deffunction linea ()
   (printout t "-------------------------------" crlf))

;;; Función para imprimir una enter
(deffunction endl ()
   (printout t crlf))

;;; Mensaje de bienvenida
(deffunction saludo-inicial ()
   (cls)
   (titulo "Bienvenido a Rico Rico CLIPS")
   (printout t "Sistema de menús inteligente para eventos." crlf)
   (printout t "Versión: 6.4.2" crlf crlf))


;;; ================================
;;; FUNCIONES DE DEPURACIÓN
;;; ================================

;;; Función para activar depuración de hechos y reglas
(deffunction debug-on ()
   (watch facts)
   (watch rules)
   (printout t "Depuración activada." crlf))

;;; Función para desactivar depuración
(deffunction debug-off ()
   (unwatch facts)
   (unwatch rules)
   (printout t "Depuración desactivada." crlf))


;;; ================================
;;; FUNCIONES DE UTILIDAD GENERAL
;;; ================================














