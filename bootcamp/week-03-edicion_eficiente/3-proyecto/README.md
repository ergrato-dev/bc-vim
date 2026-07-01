# 🎯 Proyecto Semana 03: Transforma Datos Crudos en un Reporte Markdown

## 📋 Descripción

En este proyecto integrador, transformarás un archivo de datos sin procesar (CSV con datos de ventas) en un reporte markdown profesional formateado. Usarás exclusivamente técnicas de esta semana: Visual block, `.` (dot), `:s`/`:%s`, `:g`, `:r !` y marcas.

---

## 🎯 Objetivos

Al completar este proyecto, habrás demostrado que puedes:

- ✅ Usar Visual block (Ctrl-v) + I/A para formatear columnas
- ✅ Usar `.` para repetir cambios sistemáticamente
- ✅ Usar `:s` y `:%s` para limpiar y normalizar datos
- ✅ Usar `:r !` para insertar metadatos y fecha del sistema
- ✅ Usar marcas para navegar entre secciones del reporte
- ✅ Documentar el flujo de trabajo paso a paso

---

## 📦 Requisitos Funcionales

### RF-01: Datos de Entrada (0%)

Se proporciona un archivo CSV con datos de ventas sin procesar.

### RF-02: Transformaciones Requeridas (60%)

El reporte final debe incluir:

| # | Transformación | Técnica esperada |
|---|---------------|-----------------|
| 1 | Limpiar espacios extra en los datos | `:%s/\s\+$//` o similar |
| 2 | Convertir separadores de coma a pipes | `:%s/,/ \| /g` |
| 3 | Alinear columnas con pipes al inicio y final | `Ctrl-v` + `I` y `A` |
| 4 | Insertar cabecera de tabla con separadores | `yy p` + `:s/[^\|]/-/g` |
| 5 | Insertar título del reporte y fecha | `:r !date` |
| 6 | Insertar totales o resumen | `:r !wc -l` o `Ctrl-v g Ctrl-a` |
| 7 | Dar formato consistente a todo el reporte | `.` para repetir patrones |
| 8 | Navegar con marcas durante el proceso | `ma`, `mb`, etc. |

### RF-03: Reporte Final (20%)

El archivo resultante debe ser un markdown válido con:
- Título y fecha de generación
- Tabla de datos formateada y alineada
- Sección de resumen o totales
- Sin espacios extra, líneas vacías innecesarias ni artefactos

### RF-04: Documentación del Flujo (20%)

Crea un archivo `flujo-de-trabajo.md` documentando cada paso con el comando exacto usado.

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md              # Este archivo
├── starter/
│   └── ventas.csv         # Datos crudos de ventas
└── (tu entregable)
    ├── reporte-ventas.md  # Reporte final formateado
    └── flujo-de-trabajo.md # Documentación del proceso
```

---

## 📝 Archivo de Entrada: `starter/ventas.csv`

```csv
producto , categoria , precio , unidades , total , fecha
 Laptop Pro , Electronica , 1200.00 , 5 , 6000.00 , 2024-01-15
Monitor 4K , Electronica , 450.00 , 12 , 5400.00 , 2024-01-16
Teclado Mecanico , Accesorios , 85.50 , 30 , 2565.00 , 2024-01-17
Mouse Inalambrico , Accesorios , 45.00 , 45 , 2025.00 , 2024-01-18
Auriculares BT , Audio , 95.00 , 20 , 1900.00 , 2024-01-19
Camara Web HD , Electronica , 75.00 , 15 , 1125.00 , 2024-01-20
 Hub USB-C , Accesorios , 35.00 , 50 , 1750.00 , 2024-01-21
Disco SSD 1TB , Almacenamiento , 110.00 , 8 , 880.00 , 2024-01-22
Memoria RAM 16GB , Componentes , 65.00 , 10 , 650.00 , 2024-01-23
 Cable HDMI 2m , Accesorios , 12.00 , 60 , 720.00 , 2024-01-24
```

---

## 📝 Instrucciones

### Paso 1: Crear Copia de Trabajo

```bash
cp starter/ventas.csv ~/proyecto-semana03-ventas.csv
nvim ~/proyecto-semana03-ventas.csv
```

### Paso 2: Limpiar los Datos

Antes de formatear, normaliza el CSV:

```text
1. Elimina espacios alrededor de comas:
   :%s/\s*,\s*/,/g

2. Elimina espacios al inicio de línea:
   :%s/^\s\+//

3. Elimina espacios al final de línea:
   :%s/\s\+$//

4. Verifica: los datos deben verse limpios y consistentes.
```

### Paso 3: Crear Estructura del Reporte

```text
1. gg            → inicio del archivo
2. O             → nueva línea arriba
3. # Reporte de Ventas + Esc
4. o             → nueva línea abajo
5. **Generado:**  + Esc
6. A             → final de línea
7. :r !date "+%Y-%m-%d %H:%M"  → inserta la fecha

8. o ESC         → línea vacía
9. o             → nueva línea
10. Escribe: "## Datos de Ventas" + Esc

Ahora el archivo tiene:
# Reporte de Ventas
**Generado:** 2024-01-15 10:30

## Datos de Ventas
[datos CSV limpios]
```

### Paso 4: Formatear la Tabla

```text
1. Convierte comas a " | ":
   :%s/,/ | /g

2. Añade "| " al inicio de cada línea de datos (no cabecera):
   Ve a la primera línea de datos (debajo de la cabecera CSV)
   Ctrl-v hasta seleccionar todas las líneas de datos
   I → Insert mode
   |  → pipe y espacio
   Esc

3. Añade " |" al final de cada línea de datos:
   Ctrl-v selecciona mismo bloque
   $ → extiende al final de cada línea
   A → Insert mode al final
    | → espacio y pipe
   Esc

4. Crea separador de cabecera:
   Ve a la línea de cabecera (producto | categoria | ...)
   yy → copia
   p  → pega debajo
   En la línea copiada:
   :s/[^|]/-/g → reemplaza todo lo que no sea | por -

5. La cabecera debe empezar con "| " también:
   I |  Esc
   A  | Esc
```

### Paso 5: Añadir Resumen

```text
1. G            → final del archivo
2. o            → nueva línea
3. Escribe: "## Resumen" Esc
4. o            → nueva línea

5. :r !wc -l ~/proyecto-semana03-ventas.csv
   → inserta conteo de líneas

6. O usa el archivo actual:
   :r !echo "Total de productos: $(wc -l < /dev/stdin)"

7. Crea una sección de totales manualmente si quieres practicar.
```

### Paso 6: Guardar como Reporte Final

```text
:w ~/proyecto-semana03-reporte.md
```

### Paso 7: Documentar el Flujo

Crea `~/proyecto-semana03-flujo.md`:

```markdown
# Flujo de Trabajo - Proyecto Semana 03

## Limpieza de datos
| Paso | Comando | Descripción |
|------|---------|-------------|
| 1 | :%s/\s*,\s*/,/g | Eliminar espacios alrededor de comas |
| ... | ... | ... |

## Formateo de tabla
| Paso | Comando | Descripción |
|------|---------|-------------|
| ... | ... | ... |

## Inserción de metadatos
| Paso | Comando | Descripción |
|------|---------|-------------|
| ... | ... | ... |
```

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Transformaciones** (60%) | |
| Datos limpios sin espacios extra | 15 |
| Tabla correctamente formateada con pipes | 20 |
| Cabecera con separadores | 10 |
| Título y fecha insertados | 10 |
| Sección de resumen | 5 |
| **Reporte final** (20%) | |
| Markdown válido y legible | 20 |
| **Documentación** (20%) | |
| Flujo de trabajo documentado paso a paso | 20 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Visual Mode](../1-teoria/02-visual-mode.md)
- [Teoría: Sustituciones](../1-teoria/04-sustituciones.md)
- [Teoría: Comandos Shell](../1-teoria/05-comandos-shell-y-filtros.md)
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/#tables)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 03](../README.md)
