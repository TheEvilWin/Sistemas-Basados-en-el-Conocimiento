(deftemplate smartphone
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot ram)
  (slot stock))

(deftemplate computadora
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot ram)
  (slot cpu)
  (slot tipo) ;; tipo: laptop / escritorio
  (slot gpu)
  (slot stock))

(deftemplate accesorio
  (slot marca)
  (slot nombre)
  (slot tipo) ;; tipo: protector / periferico / energia
  (slot precio)
  (slot stock))

(deftemplate cliente
  (slot id)
  (slot nombre)
  (slot edad))

(deftemplate orden
  (slot cliente-id)
  (slot categoria) ;; smartphone / computadora / accesorio
  (slot producto)
  (slot qty)
  (slot forma-pago)) ;; contado / tarjeta / vales

(deftemplate tarjetacred
  (slot banco)
  (slot grupo)
  (slot exp-date))

(deftemplate vale
  (slot cliente-id)
  (slot monto))

(deftemplate orden
  (slot cliente-id)
  (slot categoria)       ;; smartphone / computadora / accesorio
  (slot producto)        ;; modelo o nombre
  (slot qty)
  (slot forma-pago)      ;; contado / tarjeta / vales
  (slot tarjeta-banco))  ;; solo si es tarjeta
