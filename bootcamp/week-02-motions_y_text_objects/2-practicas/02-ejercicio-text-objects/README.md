# 🧱 Ejercicio 02: Text Objects en Código Anidado

## 🎯 Objetivo

Practicar text objects (`iw`, `i"`, `i(`, `i{`, `it`, `ip`) en archivos reales con estructuras anidadas.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear los Archivos de Práctica

Crea estos archivos con el siguiente contenido:

#### Archivo 1: `~/vim-practica-json.json`

```bash
nvim ~/vim-practica-json.json
```

Copia (en Insert mode):

```json
{
  "servidor": {
    "host": "localhost",
    "puerto": 3000,
    "ssl": {
      "habilitado": true,
      "certificado": "/ruta/al/cert.pem",
      "clave": "/ruta/al/clave.pem"
    }
  },
  "base_datos": {
    "tipo": "postgresql",
    "url": "postgres://usuario:clave@localhost:5432/bd",
    "pool": {
      "minimo": 2,
      "maximo": 10
    }
  },
  "logs": {
    "nivel": "info",
    "archivo": "/var/log/app.log",
    "formato": "json"
  }
}
```

#### Archivo 2: `~/vim-practica-html.html`

```bash
nvim ~/vim-practica-html.html
```

```html
<!DOCTYPE html>
<html>
<head>
    <title>Página de Prueba</title>
</head>
<body>
    <header>
        <h1>Título Principal</h1>
        <nav>
            <ul>
                <li>Inicio</li>
                <li>Acerca de</li>
                <li>Contacto</li>
            </ul>
        </nav>
    </header>
    <main>
        <article>
            <h2>Primer Artículo</h2>
            <p>Este es el primer párrafo del artículo.</p>
            <p>Este es el segundo párrafo con <strong>texto importante</strong>.</p>
        </article>
        <article>
            <h2>Segundo Artículo</h2>
            <p>Contenido del segundo artículo.</p>
        </article>
    </main>
    <footer>
        <p>&copy; 2024 Mi Sitio</p>
    </footer>
</body>
</html>
```

#### Archivo 3: `~/vim-practica-codigo.js`

```bash
nvim ~/vim-practica-codigo.js
```

```javascript
function procesarUsuario(datos) {
    const resultado = {
        nombre: datos.nombre,
        email: datos.email,
        config: {
            tema: "oscuro",
            idioma: "es",
            notificaciones: {
                email: true,
                push: false
            }
        }
    };

    if (resultado.nombre.length > 0) {
        return {
            exito: true,
            datos: resultado,
            mensaje: "Usuario procesado correctamente"
        };
    }

    return {
        exito: false,
        error: "Nombre requerido"
    };
}

module.exports = { procesarUsuario };
```

---

## 🎮 Ejercicios

### Ejercicio A: Text Objects en JSON (archivo JSON)

```text
1. Ve al string "localhost"
2. ci" → cambia por "0.0.0.0" Esc

3. Ve al número 3000
4. ciw → cambia por 8080 Esc

5. Ve al objeto ssl completo (dentro de las { } de ssl)
6. da{ → elimina todo el bloque ssl
7. u   → deshacer
8. di{ → elimina SOLO el contenido de ssl
9. u   → deshacer

10. Ve al objeto "pool"
11. yi{ → copia el contenido
12. P   → pégalo fuera (practica navegar)

13. Ve a "minimo": 2
14. ciw → cambia "minimo" por "min" Esc
15. j   → siguiente línea
16. ciw → cambia "maximo" por "max" Esc
```

### Ejercicio B: Text Objects en HTML

```text
1. Ve a <title>Página de Prueba</title>
2. Coloca el cursor dentro del texto "Página de Prueba"
3. cit → cambia contenido del tag
4. Escribe: "Mi Sitio Web" Esc
   Resultado: <title>Mi Sitio Web</title>

5. Ve a <h1>Título Principal</h1>
6. cit → cambia por "Bienvenidos" Esc

7. Ve a <p>Este es el primer párrafo...</p>
8. dit → elimina el contenido del párrafo
   Resultado: <p></p>
9. u   → deshacer

10. Ve a <li>Inicio</li>
11. cat → elimina todo el tag completo
12. u   → deshacer

13. Ve al <article> completo (dentro de sus tags)
14. dat → elimina el artículo entero
15. u   → deshacer

16. Ve al <ul>...</ul>
17. yi{ o yit → copia la lista (dentro de ul)
    Prueba ambos: ¿cuál funciona mejor para un <ul>?
```

### Ejercicio C: Inside vs Around (diferencias sutiles)

```text
Abre el archivo JSON:

1. Ve a "host": "localhost"
2. Coloca cursor en "localhost" (dentro de las comillas)
3. di" → Resultado: "host": ""
   Las comillas quedan vacías pero presentes
4. u   → deshacer
5. da" → Resultado: "host":
   Las comillas DESAPARECEN junto con el contenido
6. u   → deshacer

Compara con paréntesis:
7. Ve a los argumentos de: function procesarUsuario(datos) {
8. Coloca cursor dentro de (datos)
9. di( → function procesarUsuario()
10. u  → deshacer
11. da( → function procesarUsuario
12. u  → deshacer
```

### Ejercicio D: Combinación con otros operadores

```text
En el archivo JS:

1. Ve al bloque "config"
2. >i{ → indenta el bloque una vez
3. .   → indenta otra vez (repetición)
4. u u → deshacer las dos indentaciones

5. Ve al objeto retornado en el if:
   {
       exito: true,
       datos: resultado,
       mensaje: "Usuario procesado correctamente"
   }
6. =i{ → autoformatea el bloque

7. En "Usuario procesado correctamente":
8. gUiw → convierte a MAYÚSCULAS
9. u    → deshacer
10. guiw → convierte a minúsculas (no cambia nada, ya está)
```

### Ejercicio E: Párrafos

```text
En el archivo HTML, busca un bloque de varias líneas contiguas
(por ejemplo, el <header> completo).

1. Ve al inicio del <header>
2. vip → selecciona visualmente el párrafo
3. Esc → sal de Visual mode
4. dap → elimina el párrafo completo
5. u   → deshacer
6. yap → copia el párrafo
7. P   → pégalo en otra parte del documento
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste `ci"`, `ci(`, `ci{` en lugar de seleccionar y borrar? | | |
| ¿Diferencias `di{` (contenido) de `da{` (contenido + llaves)? | | |
| ¿Usaste `cit` en HTML sin tener que seleccionar manualmente? | | |
| ¿Combinaste text objects con `>`, `<`, `=` además de `d`/`c`/`y`? | | |
| ¿Notas que editas más rápido que en la Semana 1? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Edición con Operadores →](../03-ejercicio-edicion-operadores/README.md)
