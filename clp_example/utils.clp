;;; ================================
;;; Archivo: utils.clp
;;; Funciones utiles para CLIPS
;;; ================================

;;; ================================
;;; FUNCIONES DE INTERFAZ Y SALIDA
;;; ================================

;;; Funcion para "limpiar" la pantalla (simulacion)
(deffunction cls ()
   (loop-for-count (?i 1 50)
      (printout t crlf)))

;;; Funcion para imprimir un titulo con decoracion
(deffunction titulo (?texto)
   (printout t crlf)
   (printout t "===============================" crlf)
   (printout t "| " ?texto crlf)
   (printout t "===============================" crlf crlf))

;;; Funcion para pausar (esperar Enter)
(deffunction read-line (?text)
   (printout t ?text crlf)
   (readline))

;;; Funcion para imprimir un menu numerado
(deffunction imprimir-lista (?titulo $?items)
   (printout t crlf ?titulo crlf)
   (loop-for-count (?i 1 (length$ ?items))
      (printout t ?i ". " (nth$ ?i ?items) crlf)))

;;; Funcion para imprimir una linea separadora
(deffunction linea ()
   (printout t "-------------------------------" crlf))

;;; Funcion para imprimir una enter
(deffunction endl ()
   (printout t crlf))

;;; Mensaje de bienvenida
(deffunction saludo-inicial ()
   (cls)
   (titulo "Bienvenido a Rico Rico CLIPS")
   (printout t "Sistema de menus inteligente para eventos." crlf)
   (printout t "Version: 6.4.2" crlf crlf))


;;; ================================
;;; FUNCIONES DE DEPURACIoN
;;; ================================

;;; Funcion para activar depuracion de hechos y reglas
(deffunction debug-on ()
   (watch facts)
   (watch rules)
   (printout t "Depuracion activada." crlf))

;;; Funcion para desactivar depuracion
(deffunction debug-off ()
   (unwatch facts)
   (unwatch rules)
   (printout t "Depuracion desactivada." crlf))


;;; ================================
;;; FUNCIONES DE UTILIDAD GENERAL
;;; ================================

(deffunction contar-hechos ()
   (bind ?nPlatos 0)
   (bind ?nBebidas 0)
   (bind ?nPreferencias 0)
   (bind ?nMenus 0)

   ;; Contar platos
   (do-for-all-facts ((?p plato)) TRUE
      (bind ?nPlatos (+ ?nPlatos 1)))

   ;; Contar bebidas
   (do-for-all-facts ((?b bebida)) TRUE
      (bind ?nBebidas (+ ?nBebidas 1)))

   ;; Contar preferencias
   (do-for-all-facts ((?pr preferencias)) TRUE
      (bind ?nPreferencias (+ ?nPreferencias 1)))

   ;; Contar menus
   (do-for-all-facts ((?m menu)) TRUE
      (bind ?nMenus (+ ?nMenus 1)))

   ;; Imprimir resultados
   (printout t "Numero de hechos por tipo:" crlf)
   (printout t "- Platos: " ?nPlatos crlf)
   (printout t "- Bebidas: " ?nBebidas crlf)
   (printout t "- Preferencias: " ?nPreferencias crlf)
   (printout t "- Menus: " ?nMenus crlf)
)

(deffunction run-con-info ()
   ;; Mostrar el estado inicial del sistema
   (printout t ">>> Estado inicial del sistema:" crlf)
   (contar-hechos)
   (run)
   ;; Mostrar el estado despues de ejecutar el run
   (printout t crlf ">>> Estado despues del ciclo de inferencia:" crlf)
   (contar-hechos)
)


(deffunction seleccionar-tres-menus (?precio-barato ?precio-caro)
   (bind ?barato nil)
   (bind ?medio nil)
   (bind ?caro nil)

   ;; Recorrer todos los menus y clasificarlos segun los precios proporcionados
   (do-for-all-facts ((?m menu)) TRUE
      (bind ?precio (fact-slot-value ?m precio-total))

      ;; Si el precio es menor que el precio barato y aun no se ha encontrado uno barato
      (if (and (< ?precio ?precio-barato) (eq ?barato nil)) then
         (bind ?barato ?m))

      ;; Si el precio esta en el rango medio y aun no se ha encontrado uno medio
      (if (and (>= ?precio ?precio-barato) (<= ?precio ?precio-caro) (eq ?medio nil)) then
         (bind ?medio ?m))

      ;; Si el precio es mayor que el precio medio y aun no se ha encontrado uno caro
      (if (and (> ?precio ?precio-caro) (eq ?caro nil)) then
         (bind ?caro ?m)))

   ;; Mostrar resultados
   (printout t "Menu Barato: " ?barato crlf)
   (printout t "Menu Medio: " ?medio crlf)
   (printout t "Menu Caro: " ?caro crlf)
)














