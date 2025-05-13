;; Cargar los templates de los objetos
(load "templates.clp")

;; Cargar hechos de productos, clientes, tarjetas, vales, etc.
(load "facts.clp")

;; Cargar reglas de negocio
(load "rules.clp")

;; Inicializar la memoria de trabajo
(reset)

;; Imprime los facts
(facts)

;; Ejecutar el motor de inferencia
(run)
