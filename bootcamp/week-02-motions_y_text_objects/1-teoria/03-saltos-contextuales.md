# 🎯 %, *, #: Saltos Contextuales

## 🎯 Objetivos

- Usar `%` para saltar entre pares de delimitadores
- Buscar la palabra bajo el cursor con `*` y `#`
- Diferenciar `*` de `g*` (palabra exacta vs parcial)
- Combinar saltos contextuales con operadores

---

## 📋 Contenido

### 1. %: Salto entre Pares

`%` salta al delimitador que hace par con el que está bajo el cursor.

```text
Pares que reconoce %:
- (  ↔  )
- {  ↔  }
- [  ↔  ]
- <  ↔  >  (en algunos lenguajes)
- /* ↔ */  (comentarios C)
- #if ↔ #endif (C preprocessor)
```

```text
Ejemplo con código:

function procesar(datos) {         ← cursor en '('
    if (datos.validos) {           ← % salta a ')'
        return datos.valor
    }                              ← cursor en '}'
}                                  ← % salta a '{'

Navegación con %:
Cursor en ( → % → ) → % → ( → % → ) → ...
Cursor en { → % → } → % → { → ...
```

**Caso práctico — navegar bloques anidados**:
```javascript
function outer() {          // % en { → } al final
  function inner() {        // % en { → } de inner
    return true
  }
  return inner()
}
```

---

### 2. % con Multilínea

`%` funciona aunque el par esté en otra línea. Es perfecto para navegar código con bloques largos:

```python
def procesar_datos(entrada):   # cursor en '('
    resultado = []              #
    for item in entrada:        #
        if item.valido():       #
            resultado.append(   #
                item.transform()#
            )                   # ← % encuentra ESTE ')'
    return resultado            #
```

**Si el par no se encuentra en el archivo**, `%` no hace nada (no salta, no da error). Por ejemplo, si abres `(` pero no hay `)` en el archivo.

---

### 3. *: Buscar Palabra Bajo el Cursor

`*` busca la **siguiente** ocurrencia de la palabra exacta bajo el cursor.

```text
Línea: "const user = getUserData(user)"
                          ↑ cursor en 'user'

* → busca "user" (palabra completa) hacia adelante
    encuentra el 'user' al final de la línea
```

**Importante**: `*` busca la **palabra completa**. Si el cursor está en `user`, busca `user`, no `getUser` ni `users`.

```text
* NO encuentra:          * SÍ encuentra:
getUser                  user
users                    user
username                 (user)
user_data                user;
```

---

### 4. #: Buscar Palabra Bajo el Cursor (hacia atrás)

`#` busca la **anterior** ocurrencia de la palabra exacta bajo el cursor.

```text
const user = getUserData(user)
              ↑ cursor en 'getUserData'

# → busca "getUserData" hacia atrás (no hay, no se mueve)
```

---

### 5. g* y g#: Búsqueda Parcial

| Comando | Acción |
|---------|--------|
| `*` | Buscar palabra **exacta** hacia adelante |
| `#` | Buscar palabra **exacta** hacia atrás |
| `g*` | Buscar palabra **parcial** hacia adelante |
| `g#` | Buscar palabra **parcial** hacia atrás |

```text
Línea: "getUserData setUserData userData"

Cursor en 'getUser' (parte de getUserData):

*   → busca palabra completa "getUserData" (no encuentra nada más)
g*  → busca "getUser" como substring (encuentra getUserData y setUserData)
```

**Cuándo usar cada uno**:
- `*`/`#`: para variables, funciones, nombres exactos
- `g*`/`g#`: para prefijos, substrings (ej: buscar todas las funciones que empiezan con `handle`)

---

### 6. Combinar con Operadores

`*`, `#`, `g*`, `g#` y `%` son motions. Se combinan con operadores:

```text
d %     → delete hasta el par correspondiente
c %     → change hasta el par
y %     → yank hasta el par

d *     → delete hasta siguiente ocurrencia de la palabra
y #     → yank hasta anterior ocurrencia
v *     → seleccionar visualmente hasta siguiente ocurrencia
```

**Ejemplo práctico con `%`**:
```javascript
const config = {
    server: "localhost",  // cursor en '{'
    port: 3000
}
// Quieres reemplazar todo el objeto:
c% → elimina todo hasta '}' y entra en Insert mode
Escribes el nuevo objeto:
{
    server: "prod.example.com",
    port: 443
}
Esc
```

**Ejemplo práctico con `*`**:
```javascript
// Quieres eliminar desde aquí hasta la siguiente función handleClick
function handleClick() { ... }
// ... mucho código ...
function handleClick() { ... }  // ← queremos llegar aquí

// cursor en 'handleClick' de la primera línea
d * → elimina todo hasta el siguiente handleClick
```

---

### 7. Casos de Uso Comunes

#### Navegar código anidado rápidamente

```javascript
if (condicion) {        // % en '(' → ')'
  while (activo) {      // % en '{' → '}' del while
    procesar()
  }                     // % en '}' → '{' del while
}                       // % en '}' → '{' del if
```

#### Encontrar todas las referencias a una variable

```text
Cursor sobre 'userConfig'
* → primera referencia abajo
n → siguiente
n → siguiente
n → siguiente
# → vuelve a la original hacia atrás
```

#### Saltar entre definición y uso

```python
def calcular_total(items):    # cursor en 'calcular_total'
    return sum(items)

# ... 200 líneas después ...

total = calcular_total(datos) # * desde la definición te trae aquí
                               # # desde el uso te lleva a la definición
```

---

### 8. `matchit`: Extensión de `%`

En Neovim, `%` viene mejorado con el plugin `matchit` (incluido por defecto):

```text
Pares adicionales que reconoce matchit:
- if / else / endif        (Vimscript, archivos de build)
- class / end              (Ruby, Lua)
- def / end                (Ruby)
- do / end                 (Ruby, Lua)
- <!-- / -->               (HTML)
- <div> / </div>           (HTML, con matchit configurado)
```

---

## 💡 Resumen Visual

```text
Saltos contextuales:

  %        → par correspondiente  ( ) [ ] { } /* */ #if/#endif
  *        → palabra exacta adelante
  #        → palabra exacta atrás
  g*       → palabra parcial adelante
  g#       → palabra parcial atrás

  Combinaciones:
  d%  → delete hasta par
  y*  → yank hasta siguiente palabra
  c#  → change hasta anterior palabra
```

---

## ✅ Checklist de Verificación

- [ ] Uso `%` para saltar entre `()`, `{}`, `[]` sin pensar
- [ ] Entiendo que `%` funciona multilínea
- [ ] Uso `*` para buscar todas las ocurrencias de una variable/función
- [ ] Diferencio `*` (palabra exacta) de `g*` (substring)
- [ ] Combino `d%`, `c%`, `y%` para operar sobre bloques delimitados
- [ ] Uso `*` y `#` para saltar entre definición y uso de símbolos

---

## 🎮 Ejercicio Rápido

Abre un archivo de código con funciones, objetos y estructuras anidadas:

```text
1. Coloca el cursor sobre un '(' → % → % → (salta entre paréntesis)
2. Sobre un '{' → % → verifica que llegas al '}' correcto
3. Sobre el nombre de una función → * → ve al siguiente uso
4. n → n → N → (navega entre usos)
5. d% → elimina hasta el cierre del bloque
6. u → deshacer
7. Colócate en una palabra común (ej: 'data')
8. * → * → ve cuántas ocurrencias hay

Bono: Busca una clase o función con *, luego usa g* para encontrar
      palabras que contengan ese nombre como substring.
```

---

## ➡️ Siguiente

[04 - Text Objects](04-text-objects.md)
