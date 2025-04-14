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
   (multislot compatible-con)
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
