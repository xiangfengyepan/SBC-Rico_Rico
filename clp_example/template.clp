;; DEFINICIONES DE PLATOS
(deftemplate plato
   (slot nombre)
   (multislot tipo) ;; primero, segundo, postre
   (slot temporada) ;; todo, verano, invierno, etc.
   (slot estilo) ;; clasico, moderno, regional, sibarita
   (slot vegetariano) ;; si / no
   (slot precio)
   (multislot ingredientes)
)

;; DEFINICIONES DE BEBIDAS
(deftemplate bebida
   (slot nombre)
   (multislot no-compatible-con)
   (slot precio)
)

;; DEFINICIONES DE PREFERENCIAS DEL USUARIO
(deftemplate preferencias
   (multislot evento)
   (multislot temporada)
   (slot comensales) ; numero de comersales
   (multislot estilo)
   (slot vegetariano) ; si no
   (slot precio-min)
   (slot precio-max)
)

;; DEFINICIoN DEL MENu SELECCIONADO
(deftemplate menu
   (slot nombre)
   (slot primero)
   (slot segundo)
   (slot postre)
   (slot bebida)
   (slot precio-total)
)
