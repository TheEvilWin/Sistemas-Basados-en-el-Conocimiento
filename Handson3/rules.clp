;; 1. Descuento en accesorio por comprar iPhone16 con Banamex
(defrule combo-iphone16-banamex-accesorio
  (orden (producto iphone16) (forma-pago tarjeta) (tarjeta-banco banamex)) ; Verifica si se ha comprado un iPhone16 y el pago es con Banamex
  (orden (categoria accesorio) (producto ?nombre)) ; Verifica si la orden contiene un accesorio
  (not (combo-iphone16-anunciado)) ; Asegura que la oferta no haya sido anunciada previamente
  =>
  (assert (combo-iphone16-anunciado)) ; Marca la oferta como anunciada
  (printout t "OFERTA: iPhone16 con Banamex + accesorio '" ?nombre "' → descuento del 15%" crlf)) 

;; 2. Note21 con Liverpool y accesorio Belkin
(defrule combo-note21-liverpool-belkin
  (orden (producto note21) (forma-pago tarjeta) (tarjeta-banco liverpool)) ; Verifica si se ha comprado un Note21 con tarjeta Liverpool
  (orden (producto ?nombre)) ; Verifica si hay un producto en la orden
  (accesorio (nombre ?nombre) (marca belkin)) ; Verifica si el accesorio es de la marca Belkin
  (not (combo-note21-belkin-anunciado)) ; Asegura que la oferta no haya sido anunciada previamente
  =>
  (assert (combo-note21-belkin-anunciado)) ; Marca la oferta como anunciada
  (printout t "OFERTA: Note21 con Liverpool + accesorio Belkin '" ?nombre "' → descuento del 10%" crlf)) 

;; 3. MacBookAir + iPhone16 al contado
(defrule oferta-vales-combo
  (orden (producto iphone16) (forma-pago contado)) ; Verifica si se compró el iPhone16 al contado
  (orden (producto macbookair) (forma-pago contado)) ; Verifica si se compró el MacBookAir al contado
  =>
  (printout t "BONO: Recibes vales por comprar MacBookAir + iPhone16 al contado" crlf))

;; 4. Recomendación para MacBookAir
(defrule recomienda-adaptadores
  (orden (producto macbookair)) ; Verifica si se compró un MacBookAir
  (not (recom-macbook-anunciada)) ; Asegura que la recomendación no haya sido anunciada previamente
  =>
  (assert (recom-macbook-anunciada)) ; Marca la recomendación como anunciada
  (printout t "RECOMENDACION: Compra adaptadores para tu MacBookAir" crlf)) 

;; 5. Descuento por comprar 5 fundas
(defrule descuento-fundas
  (orden (producto funda) (qty ?q)) ; Verifica si se compraron fundas y obtiene la cantidad
  (test (>= ?q 5)) ; Verifica si la cantidad de fundas compradas es mayor o igual a 5
  =>
  (printout t "DESCUENTO: 20% por comprar 5 o más fundas" crlf)) 

;; 6. Cliente mayorista
(defrule clasificar-mayorista
  (orden (cliente-id ?id) (qty ?q)) ; Verifica el ID del cliente y la cantidad de productos comprados
  (test (> ?q 10)) ; Si el cliente compra más de 10 productos, es clasificado como mayorista
  =>
  (printout t "CLIENTE: " ?id " es mayorista" crlf)) 

;; 7. Cliente menudista
(defrule clasificar-menudista
  (orden (cliente-id ?id) (qty ?q)) ; Verifica el ID del cliente y la cantidad de productos comprados
  (test (<= ?q 10)) ; Si el cliente compra 10 o menos productos, es clasificado como menudista
  =>
  (printout t "CLIENTE: " ?id " es menudista" crlf)) 

;; 8. Descuento mayorista en smartphone
(defrule descuento-mayorista-smartphone
  (orden (categoria smartphone) (qty ?q)) ; Verifica si se ha comprado un smartphone y obtiene la cantidad
  (test (> ?q 10)) ; Si la cantidad es mayor a 10, se aplica un descuento mayorista
  =>
  (printout t "DESCUENTO: 10% por ser mayorista en smartphone" crlf)) 

;; 9. Combo laptop + mouse
(defrule combo-laptop-mouse
  (orden (categoria computadora) (producto ?pc)) ; Verifica si se compró una computadora y obtiene el modelo
  (computadora (modelo ?pc) (tipo laptop)) ; Verifica si la computadora es una laptop
  (orden (producto mouse)) ; Verifica si se compró un mouse
  (not (combo-laptop-mouse-anunciado)) ; Asegura que la oferta no haya sido anunciada previamente
  =>
  (assert (combo-laptop-mouse-anunciado)) ; Marca la oferta como anunciada
  (printout t "DESCUENTO: 15% en mouse por combo con laptop" crlf)) 

;; 10. Oferta accesorios Belkin
(defrule oferta-belkin
  (orden (producto ?nombre)) ; Verifica si se compró un producto
  (accesorio (nombre ?nombre) (marca belkin)) ; Verifica si el accesorio es de la marca Belkin
  (not (oferta-belkin-anunciada)) ; Asegura que la oferta no haya sido anunciada previamente
  =>
  (assert (oferta-belkin-anunciada)) ; Marca la oferta como anunciada
  (printout t "OFERTA: 10% en accesorio Belkin '" ?nombre "'" crlf)) 

;; 11. Promoción estudiante
(defrule promo-estudiantil
  (orden (cliente-id ?id)) ; Verifica el ID del cliente
  (cliente (id ?id) (edad ?e)) ; Verifica la edad del cliente
  (test (< ?e 25)) ; Aplica solo si el cliente tiene menos de 25 años
  (not (promo-estudiantil-anunciada)) ; Asegura que la promoción no haya sido anunciada previamente
  =>
  (assert (promo-estudiantil-anunciada)) ; Marca la promoción como anunciada
  (printout t "PROMOCION: Descuento estudiante para menores de 25" crlf)) 

;; 12. Alerta por stock bajo en smartphone
(defrule alerta-stock-bajo-smartphone
  (smartphone (modelo ?m) (stock ?s)) ; Verifica el stock de smartphones por modelo
  (test (< ?s 5)) ; Si el stock es menor que 5, genera una alerta
  =>
  (printout t "ALERTA: Stock bajo para " ?m crlf)) 

;; 13. Actualizar stock smartphone
(defrule actualizar-stock-smartphone
  ?o <- (orden (categoria smartphone) (producto ?modelo) (qty ?q)) ; Verifica la orden y obtiene el modelo y la cantidad
  ?p <- (smartphone (modelo ?modelo) (stock ?s)) ; Verifica el stock disponible del smartphone
  (test (>= ?s ?q)) ; Verifica que haya suficiente stock
  =>
  (retract ?p) ; Elimina el hecho del stock anterior
  (assert (smartphone (modelo ?modelo) (stock (- ?s ?q)))) ; Actualiza el stock
  (retract ?o) ; Elimina la orden
  (printout t "STOCK: " ?modelo " actualizado a " (- ?s ?q) crlf)) 

;; 14. Actualizar stock computadora
(defrule actualizar-stock-computadora
  ?o <- (orden (categoria computadora) (producto ?modelo) (qty ?q)) ; Verifica la orden y obtiene el modelo y la cantidad
  ?p <- (computadora (modelo ?modelo) (stock ?s)) ; Verifica el stock disponible de la computadora
  (test (>= ?s ?q)) ; Verifica que haya suficiente stock
  =>
  (retract ?p) ; Elimina el hecho del stock anterior
  (assert (computadora (modelo ?modelo) (stock (- ?s ?q)))) ; Actualiza el stock
  (retract ?o) ; Elimina la orden
  (printout t "STOCK: " ?modelo " actualizado a " (- ?s ?q) crlf)) 

;; 15. Actualizar stock accesorio
(defrule actualizar-stock-accesorio
  ?o <- (orden (categoria accesorio) (producto ?nombre) (qty ?q)) ; Verifica la orden y obtiene el nombre y la cantidad
  ?p <- (accesorio (nombre ?nombre) (stock ?s)) ; Verifica el stock disponible del accesorio
  (test (>= ?s ?q)) ; Verifica que haya suficiente stock
  =>
  (retract ?p) ; Elimina el hecho del stock anterior
  (assert (accesorio (nombre ?nombre) (stock (- ?s ?q)))) ; Actualiza el stock
  (retract ?o) ; Elimina la orden
  (printout t "STOCK: Accesorio " ?nombre " actualizado a " (- ?s ?q) crlf)) 

;; 16. Cupon por pagar con BBVA
(defrule cupon-bbva
  (orden (forma-pago tarjeta) (tarjeta-banco bbva)) ; Verifica si se pagó con tarjeta BBVA
  (not (cupon-bbva-anunciado)) ; Asegura que el cupón no haya sido anunciado previamente
  =>
  (assert (cupon-bbva-anunciado)) ; Marca el cupón como anunciado
  (printout t "CUPON: $300 por pagar con tarjeta BBVA" crlf)) 

;; 17. Descuento por pagar con vales
(defrule descuento-por-vale
  (orden (forma-pago vales)) ; Verifica si se pagó con vales
  =>
  (printout t "DESCUENTO: 5% por usar vales" crlf)) ; Aplica el descuento por vales

;; 18. Oferta de MSI por compra grande
(defrule aplica-msi
  (orden (producto ?prod) (qty ?q)) ; Verifica la orden y obtiene el producto y la cantidad
  (or 
    (smartphone (modelo ?prod) (precio ?precio)) ; Verifica si el producto es un smartphone
    (computadora (modelo ?prod) (precio ?precio)) ; Verifica si el producto es una computadora
    (accesorio (nombre ?prod) (precio ?precio))) ; Verifica si el producto es un accesorio
  (test (and (numberp ?precio) (> (* ?q ?precio) 10000))) ; Si el precio total de la compra es mayor a $10,000, aplica la oferta
  =>
  (printout t "OFERTA: Meses sin intereses por compra mayor a $10,000" crlf)) 

;; 19. Cliente frecuente
(defrule cliente-frecuente
  (cliente (id ?id) (nombre ?n)) ; Verifica si el cliente existe
  (orden (cliente-id ?id)) ; Verifica si el cliente tiene una orden registrada
  =>
  (printout t "RECOMPENSA: Cliente frecuente (" ?n ")" crlf)) 

;; 20. Descuento por comprar mouse y teclado juntos
(defrule combo-mouse-teclado
  (orden (producto mouse)) ; Verifica si se compró un mouse
  (orden (producto teclado)) ; Verifica si se compró un teclado
  (not (anuncio-combo-mouse-teclado)) ; Asegura que la oferta no haya sido anunciada previamente
  =>
  (assert (anuncio-combo-mouse-teclado)) ; Marca la oferta como anunciada
  (printout t "COMBO: 10% de descuento por comprar mouse y teclado juntos" crlf)) 

;; 21. Seguro extra por pagar accesorio con tarjeta
(defrule seguro-accesorio
  (orden (categoria accesorio) (forma-pago tarjeta)) ; Verifica si se compró un accesorio con tarjeta
  (not (anuncio-seguro)) ; Asegura que la oferta de seguro no haya sido anunciada previamente
  =>
  (assert (anuncio-seguro)) ; Marca la oferta como anunciada
  (printout t "OFERTA: Puedes agregar un seguro al accesorio por pagar con tarjeta" crlf)) 
