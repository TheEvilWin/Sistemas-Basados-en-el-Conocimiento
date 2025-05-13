(deffacts base-de-conocimientos

  ;; SMARTPHONES
  (smartphone (marca apple) (modelo iphone16) (color rojo) (precio 27000) (ram 8) (stock 30))
  (smartphone (marca samsung) (modelo note21) (color negro) (precio 23000) (ram 6) (stock 25))
  (smartphone (marca xiaomi) (modelo mi11) (color azul) (precio 12000) (ram 6) (stock 40))
  (smartphone (marca motorola) (modelo edge30) (color gris) (precio 15000) (ram 8) (stock 20))
  (smartphone (marca huawei) (modelo p50) (color blanco) (precio 21000) (ram 6) (stock 15))

  ;; COMPUTADORAS
  (computadora (marca apple) (modelo macbookair) (color gris) (precio 20000) (ram 8) (cpu m1) (tipo laptop) (gpu integrada) (stock 10))
  (computadora (marca lenovo) (modelo legion5) (color negro) (precio 28000) (ram 16) (cpu ryzen7) (tipo laptop) (gpu rtx3060) (stock 8))
  (computadora (marca hp) (modelo pavilion) (color blanco) (precio 18000) (ram 8) (cpu i5) (tipo laptop) (gpu integrada) (stock 12))
  (computadora (marca dell) (modelo inspiron) (color plateado) (precio 22000) (ram 12) (cpu i7) (tipo escritorio) (gpu gtx1650) (stock 7))
  (computadora (marca asus) (modelo tufdash) (color negro) (precio 25000) (ram 16) (cpu ryzen9) (tipo laptop) (gpu rtx3050) (stock 6))

  ;; ACCESORIOS
  (accesorio (marca belkin) (nombre funda) (tipo protector) (precio 500) (stock 50))
  (accesorio (marca belkin) (nombre mica) (tipo protector) (precio 200) (stock 60))
  (accesorio (marca logitech) (nombre mouse) (tipo periferico) (precio 700) (stock 40))
  (accesorio (marca razer) (nombre teclado) (tipo periferico) (precio 1500) (stock 30))
  (accesorio (marca xiaomi) (nombre cargador) (tipo energia) (precio 300) (stock 45))

  ;; CLIENTES
  (cliente (id c1) (nombre Luis) (edad 25))
  (cliente (id c2) (nombre Ana) (edad 19))
  (cliente (id c3) (nombre Pedro) (edad 31))
  (cliente (id c4) (nombre Mariana) (edad 23))
  (cliente (id c5) (nombre Jorge) (edad 28))

  ;; TARJETAS DE CREDITO 
  (tarjetacred (banco banamex)   (grupo oro)       (exp-date 01-12-25))
  (tarjetacred (banco liverpool) (grupo visa)      (exp-date 06-24-25))
  (tarjetacred (banco bbva)      (grupo platinum)  (exp-date 11-25-24))
  (tarjetacred (banco santander) (grupo mastercard)(exp-date 05-23-26))
  (tarjetacred (banco hsbc)      (grupo visa)      (exp-date 02-22-25))

  ;; VALES
  (vale (cliente-id c1) (monto 1500))
  (vale (cliente-id c2) (monto 2000))
  (vale (cliente-id c3) (monto 1000))
  (vale (cliente-id c4) (monto 500))
  (vale (cliente-id c5) (monto 1200))

  ;; ORDENES
  (orden (cliente-id c1) (categoria smartphone) (producto iphone16) (qty 30) (forma-pago contado))
  (orden (cliente-id c1) (categoria computadora) (producto macbookair) (qty 1) (forma-pago contado))
  (orden (cliente-id c3) (categoria accesorio) (producto funda) (qty 5) (forma-pago banamex))
)
