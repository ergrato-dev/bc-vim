# 🎯 Proyecto Semana 02: Refactoriza un Archivo de Configuración

## 📋 Descripción

En este proyecto integrador, refactorizarás un archivo de configuración real (TOML o YAML) usando exclusivamente operadores combinados con text objects y motions avanzados. Documentarás cada comando usado y explicarás la "frase Vim" detrás de cada acción.

---

## 🎯 Objetivos

Al completar este proyecto, habrás demostrado que puedes:

- ✅ Usar `ci"`, `ci(`, `ci{` para cambiar valores en archivos de configuración
- ✅ Usar `di(`, `di{`, `da{` para eliminar secciones completas
- ✅ Usar `yap`, `yip`, `ya{` para copiar y duplicar bloques
- ✅ Usar `f`/`t` + operador para ediciones precisas en línea
- ✅ Usar `/` y `n` para encontrar y modificar todas las ocurrencias de un patrón
- ✅ Documentar cada acción como una "frase Vim" (verbo + sustantivo)

---

## 📦 Requisitos Funcionales

### RF-01: Archivo de Entrada (10%)

Se te proporciona un archivo de configuración en TOML que contiene errores intencionales, valores obsoletos y secciones que necesitan refactorización.

### RF-02: Correcciones Requeridas (50%)

Debes realizar al menos **8 cambios** que incluyan obligatoriamente:

| # | Tipo de cambio | Text object esperado |
|---|---------------|---------------------|
| 1 | Cambiar un valor string | `ci"` |
| 2 | Cambiar un valor numérico | `ciw` |
| 3 | Cambiar contenido de un bloque | `ci{` o `ci[` |
| 4 | Eliminar una sección completa | `da{` o `dap` |
| 5 | Copiar y duplicar un bloque | `ya{` + `p` |
| 6 | Cambiar hasta un carácter en línea | `ct{char}` o `cf{char}` |
| 7 | Cambiar todas las ocurrencias de un valor | `/patrón` + `ciw` + `n . n .` |
| 8 | Mover una sección de lugar | `dap` + `p`/`P` (u otro método) |

### RF-03: Documentación de Comandos (30%)

Crea un archivo `comandos-usados.md` con una tabla que liste cada cambio realizado:

```markdown
| # | Comando(s) | Frase Vim | Descripción del cambio |
|---|-----------|-----------|----------------------|
| 1 | ci"localhost Esc | change inside quotes | Cambié "localhost" por "0.0.0.0" |
| 2 | da{ | delete around braces | Eliminé la sección completa de logging |
```

### RF-04: Archivo Resultante (10%)

El archivo refactorizado debe:
- Ser sintácticamente válido (TOML válido)
- No tener errores de formato
- Reflejar todos los cambios documentados

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md              # Este archivo
├── starter/
│   └── config.toml        # Archivo de configuración a refactorizar
└── (tu entregable)
    └── comandos-usados.md # Documentación de comandos usados
```

---

## 📝 Archivo de Entrada: `starter/config.toml`

```toml
# Configuración de la Aplicación — v1.0 (OBSOLETO)
# Necesita refactorización para v2.0

[servidor]
host = "localhost"       # Cambiar a IP de producción
puerto = 3000            # Usar 8080
ssl_habilitado = false   # Activar en producción
ssl_cert = "/ruta/antigua/cert.pem"  # Ruta obsoleta

[base_datos]
tipo = "mysql"           # Migrar a PostgreSQL
host = "localhost"
puerto = 3306
nombre = "app_db_vieja"  # Renombrar a app_db_v2
usuario = "admin"
password = "password123" # INSEGURO — cambiar

[logs]
nivel = "debug"          # Cambiar a "info" en producción
archivo = "/tmp/app.log" # Usar ruta estándar: /var/log/app.log
formato = "texto"        # Cambiar a "json"

[cache]
habilitado = false       # Debería estar activado
tipo = "memoria"
tiempo_vida = 300
maximo_elementos = 1000

[api_externa]
# Esta sección está obsoleta y debe ser eliminada
url = "https://api-vieja.example.com/v1"
version = "v1"
api_key = "deprecated-key-12345"
timeout = 30

[notificaciones]
email = true
email_destinatario = "admin@example.com"
push = false
slack_webhook = ""

[caracteristicas]
modo_oscuro = false
idioma = "en"            # Cambiar a "es"
limite_usuarios = 100    # Aumentar a 500
depuracion = true        # Debe ser false en producción
beta = true              # Eliminar esta opción (ya salió de beta)
```

---

## 📝 Instrucciones

### Paso 1: Entender la Gramática

Antes de tocar el archivo, **traduce mentalmente** cada cambio a una frase Vim:

```text
"Cambiar host de localhost a 0.0.0.0"
→ ci" (change inside quotes) sobre "localhost"

"Eliminar sección api_externa completa"
→ V sobre [api_externa], j hasta el final, d
  O mejor: coloca cursor en [api_externa], dap (delete a paragraph)

"Cambiar todas las ocurrencias de debug a info"
→ /debug Enter → ciw → info Esc → n → . → n → .
```

### Paso 2: Crear una Copia de Trabajo

```bash
cp starter/config.toml ~/proyecto-semana02-config.toml
nvim ~/proyecto-semana02-config.toml
```

### Paso 3: Ejecutar los Cambios

Realiza cada cambio usando el text object o motion correspondiente. **No edites carácter por carácter.** Si te equivocas, `u` para deshacer.

Registra cada comando en `comandos-usados.md` a medida que lo ejecutas.

### Paso 4: Documentar

Crea el archivo `comandos-usados.md` con el formato indicado en RF-03.

### Paso 5: Verificar

```bash
# Verifica que el TOML es válido (si tienes python):
python3 -c "import tomllib; tomllib.loads(open('$HOME/proyecto-semana02-config.toml').read())" 2>/dev/null && echo "TOML válido" || echo "TOML inválido"
```

Si no tienes Python, verifica visualmente:
- [ ] Las secciones tienen corchetes balanceados `[...]`
- [ ] Los strings tienen comillas cerradas `"..."`
- [ ] No quedaron líneas huérfanas de secciones eliminadas
- [ ] Los valores booleanos son `true`/`false` (minúsculas)

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Cambios realizados** (50%) | |
| 8 cambios que cubren todos los tipos requeridos | 50 |
| 6-7 cambios | 35 |
| 4-5 cambios | 20 |
| **Documentación** (30%) | |
| Tabla completa con comandos y frases Vim explicadas | 30 |
| Tabla con comandos pero sin explicación de frases Vim | 15 |
| **Archivo resultante** (10%) | |
| TOML sintácticamente válido y bien formateado | 10 |
| **Calidad del proceso** (10%) | |
| Sin edición carácter por carácter, usando solo text objects | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [TOML Specification](https://toml.io)
- [Teoría: Text Objects](../../1-teoria/04-text-objects.md)
- [Teoría: Vim como Lenguaje](../../1-teoria/05-vim-como-lenguaje.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 02](../README.md)
