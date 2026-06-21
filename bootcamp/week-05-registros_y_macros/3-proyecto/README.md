# 🎯 Proyecto Semana 05: Automatiza la Conversión de Logs a JSON

## 📋 Descripción

Convertirás un archivo de logs en formato legacy (texto plano desestructurado) a un archivo JSON estructurado usando exclusivamente registros y macros. Documentarás cada macro utilizada.

---

## 🎯 Objetivos

- ✅ Usar registros con nombre para almacenar fragmentos de texto y patrones
- ✅ Grabar macros para procesar cada tipo de línea del log
- ✅ Aplicar macros en lote con `:normal` y `:global`
- ✅ Editar macros mediante inspección de registros
- ✅ Documentar cada macro con su propósito y comandos

---

## 📦 Requisitos Funcionales

### RF-01: Archivo de Entrada (0%)

Se proporciona un archivo de logs con 4 tipos de líneas: ERROR, WARN, INFO, DEBUG.

### RF-02: Transformaciones por Tipo (40%)

| Tipo de línea | Formato original | Formato JSON deseado |
|--------------|-----------------|---------------------|
| ERROR | `[fecha] ERROR mensaje` | `{"tipo":"ERROR","fecha":"...","mensaje":"..."}` |
| WARN | `[fecha] WARN mensaje` | `{"tipo":"WARN","fecha":"...","mensaje":"..."}` |
| INFO | `[fecha] INFO mensaje` | `{"tipo":"INFO","fecha":"...","mensaje":"..."}` |
| DEBUG | `[fecha] DEBUG mensaje` | `{"tipo":"DEBUG","fecha":"...","mensaje":"..."}` |

### RF-03: Uso de Registros (25%)

- Usa registros con nombre (`"a`-`"d`) para almacenar fragmentos de plantilla JSON
- Usa append (`"A`-`"D`) para acumular resultados en un registro

### RF-04: Macros Documentadas (25%)

Documenta cada macro con:
- Nombre del registro donde se almacenó
- Propósito de la macro
- Comandos que la componen (obtenidos con `:reg`)

### RF-05: Archivo Resultante (10%)

El archivo final debe ser JSON válido (array de objetos).

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md            # Este archivo
├── starter/
│   └── logs_raw.txt     # Archivo de logs a procesar
└── (tu entregable)
    ├── logs_json.txt     # Resultado final en JSON
    └── macros-usadas.md  # Documentación de macros
```

---

## 📝 Archivo de Entrada: `starter/logs_raw.txt`

```text
[2024-01-15 10:30:01] INFO Conexion aceptada desde 192.168.1.10
[2024-01-15 10:30:05] ERROR Timeout en consulta a base_datos
[2024-01-15 10:30:10] WARN Memoria alta: 85%
[2024-01-15 10:30:15] DEBUG Variable x = 42, y = 17
[2024-01-15 10:31:00] INFO Respuesta enviada a cliente
[2024-01-15 10:31:22] ERROR Archivo no encontrado: config.json
[2024-01-15 10:31:45] WARN Reintento de conexion (3/5)
[2024-01-15 10:32:00] DEBUG Cache invalidado para usuario 1001
[2024-01-15 10:32:30] INFO Script de backup iniciado
[2024-01-15 10:33:00] ERROR Permiso denegado al acceder a /data
[2024-01-15 10:33:15] WARN Temperatura CPU: 78C (umbral: 80C)
[2024-01-15 10:33:30] DEBUG Request headers: {auth: bearer, type: json}
[2024-01-15 10:34:00] INFO Servicio reiniciado correctamente
[2024-01-15 10:34:45] ERROR Division por cero en modulo calculos
[2024-01-15 10:35:00] WARN Espacio en disco: 12% libre
```

---

## 📝 Instrucciones

### Paso 1: Analizar

Identifica los 4 patrones de línea. ¿Qué tienen en común? ¿Qué las diferencia?

```text
Común:      [fecha] TIPO mensaje
Diferencia: TIPO = INFO, ERROR, WARN, DEBUG
```

### Paso 2: Guardar Plantillas en Registros

```text
"a y i {   → copia {"tipo":"ERROR"} a registro 'a' (ejemplo)
O escribe las plantillas manualmente y cópialas a registros.
```

### Paso 3: Grabar Macros por Tipo

```text
Macro 'e' para ERROR:
q e
0 f ] x s ": " Esc              → quita corchetes de fecha
s ERROR, "tipo": " Esc f " l   → inserta tipo
$ F " i , "mensaje": " Esc A " Esc → cierra mensaje
j @ e                            → siguiente + recursión
q

Macro 'i' para INFO:
(estructura similar, cambia "ERROR" por "INFO")

Macro 'w' para WARN:
(estructura similar, cambia "ERROR" por "WARN")

Macro 'd' para DEBUG:
(estructura similar, cambia "ERROR" por "DEBUG")
```

### Paso 4: Aplicar Macros

```text
:g/ERROR/normal @e              → ERROR → JSON
:g/INFO/normal @i               → INFO → JSON
:g/WARN/normal @w               → WARN → JSON
:g/DEBUG/normal @d              → DEBUG → JSON
```

### Paso 5: Post-procesar

```text
1. Añadir coma al final de cada línea: :%s/$/,/g
2. Quitar coma de la última línea: :$s/,$//
3. Añadir corchetes al inicio y final:
   gg I [ Esc
   G A ] Esc
```

### Paso 6: Validar JSON

```bash
python3 -c "import json; json.loads(open('$HOME/proyecto-semana05-logs.json').read())" && echo "JSON válido" || echo "JSON inválido"
```

### Paso 7: Documentar

Crea `macros-usadas.md`:

```markdown
# Macros Usadas - Proyecto Semana 05

## Macro 'e' — Procesar ERROR
- Registro: @e
- Propósito: Convertir línea de ERROR a JSON
- Comandos: 0f]xs": "\<Esc>sERROR... (obtenido con :reg e)

## Macro 'i' — Procesar INFO
...
```

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Transformaciones** (40%) | |
| ERROR convertido correctamente | 10 |
| WARN convertido correctamente | 10 |
| INFO convertido correctamente | 10 |
| DEBUG convertido correctamente | 10 |
| **Uso de Registros** (25%) | |
| Usa registros para plantillas o acumulación | 15 |
| Demuestra append (mayúsculas) | 10 |
| **Macros Documentadas** (25%) | |
| Cada macro documentada con propósito y comandos | 25 |
| **Resultado Final** (10%) | |
| JSON sintácticamente válido | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Registros](../../1-teoria/01-registros.md)
- [Teoría: Macros - Grabación y Ejecución](../../1-teoria/03-macros-grabacion.md)
- [Teoría: Macros - Edición y Batch](../../1-teoria/04-macros-edicion-batch.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 05](../README.md)
