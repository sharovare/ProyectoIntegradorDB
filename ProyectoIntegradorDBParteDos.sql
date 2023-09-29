CREATE TABLE Categoria(
id INTEGER PRIMARY KEY,
nombre TEXT);

CREATE TABLE Producto(
id INTEGER PRIMARY KEY,
nombre TEXT,
marca TEXT,
precio_unitario INTEGER,
categoria_id INTEGER,
FOREIGN KEY(categoria_id) REFERENCES Categoria(id));

CREATE TABLE Sucursal(
id INTEGER PRIMARY KEY,
nombre TEXT,
direccion TEXT);

CREATE TABLE Cliente(
id INTEGER PRIMARY KEY,
nombre TEXT,
telefono INTEGER);

CREATE TABLE Orden(
id INTEGER PRIMARY KEY,
fecha INTEGER,
total INTEGER,
cliente_id INTEGER,
sucursal_id INTEGER,
FOREIGN KEY(cliente_id) REFERENCES Cliente(id),
FOREIGN KEY(sucursal_id) REFERENCES Sucursal(id));

CREATE TABLE Item(
id INTEGER PRIMARY KEY,
cantidad INTEGER,
monto_venta INTEGER,
orden_id INTEGER,
producto_id INTEGER,
FOREIGN KEY(orden_id) REFERENCES Orden(id),
FOREIGN KEY(producto_id) REFERENCES Producto(id));

CREATE TABLE Stock(
id INTEGER PRIMARY KEY,
sucursal_id INTEGER NOT NULL,
producto_id INTEGER NOT NULL,
cantidad INTEGER,
UNIQUE (sucursal_id, producto_id)
FOREIGN KEY(sucursal_id) REFERENCES Sucursal(id),
FOREIGN KEY(producto_id) REFERENCES Producto(id));