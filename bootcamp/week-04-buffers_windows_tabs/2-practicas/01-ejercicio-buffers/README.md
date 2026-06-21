# 📦 Ejercicio 01: Buffer Management

## 🎯 Objetivo

Dominar la gestión de buffers: abrir, listar, cambiar, eliminar y navegar.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Generar Archivos de Práctica

```bash
for i in $(seq 1 6); do
  echo "# Archivo $i" > ~/vim-buffer-$i.md
  echo "" >> ~/vim-buffer-$i.md
  echo "Contenido del archivo número $i." >> ~/vim-buffer-$i.md
done
```

Esto crea 6 archivos: `~/vim-buffer-1.md` a `~/vim-buffer-6.md`.

### Paso 2: Abrir el Primer Archivo

```bash
nvim ~/vim-buffer-1.md
```

---

## 🎮 Ejercicios

### Ejercicio A: Abrir Múltiples Archivos

```text
1. :e ~/vim-buffer-2.md     → abre archivo 2
2. :e ~/vim-buffer-3.md     → abre archivo 3
3. :e ~/vim-buffer-4.md     → abre archivo 4
4. :e ~/vim-buffer-5.md     → abre archivo 5
5. :e ~/vim-buffer-6.md     → abre archivo 6

Ahora tienes 6 buffers abiertos.
```

### Ejercicio B: Listar Buffers

```text
1. :ls                       → lista todos los buffers
   Deberías ver:
   1 %a "~/vim-buffer-1.md"
   2 #  "~/vim-buffer-2.md"
   3 h  "~/vim-buffer-3.md"
   ...

   % = buffer actual
   # = buffer alternativo
   h = oculto (hidden)
   a = activo
```

### Ejercicio C: Cambiar entre Buffers

```text
1. :b 1                     → vuelve al archivo 1
2. :b 3                     → va al archivo 3
3. :b 6                     → va al archivo 6
4. Ctrl-6                   → alterna al buffer anterior (archivo 3)
5. Ctrl-6                   → alterna de vuelta (archivo 6)
6. :b buffer-4              → autocompleta con Tab, ve al archivo 4
7. :bn                      → siguiente buffer (next)
8. :bn                      → siguiente
9. :bp                      → buffer anterior (prev)
10. :bf                     → primer buffer (first)
11. :bl                     → último buffer (last)
```

### Ejercicio D: Eliminar Buffers

```text
1. :ls                      → mira los números de buffer
2. :bd 5                    → elimina buffer 5 (archivo 5)
3. :ls                      → verifica que desapareció
4. :bd 6                    → elimina buffer 6
5. :b #                     → intenta ir al buffer alternativo
   → ¿Qué pasa si el buffer # fue eliminado?
```

### Ejercicio E: Guardar Múltiples Buffers

```text
1. Ve al archivo 1: :b 1
2. Haz un cambio: o → "Línea añadida" → Esc
3. Ve al archivo 3: :b 3
4. Haz otro cambio: o → "Otra línea" → Esc
5. :wa                       → guarda TODOS los buffers modificados
6. :ls                      → verifica que ya no tengan '+' 
```

### Ejercicio F: Simular Flujo de Desarrollo

```text
1. Abre Vim sin archivos: nvim
2. Crea 3 archivos de código:
   :e ~/proyecto/src/models/user.lua
   i → escribe: return { name = "User" } → Esc
   :w                         → guarda

3. :e ~/proyecto/src/controllers/user_controller.lua
   i → escribe: local User = require("models.user") → Esc
   :w

4. :e ~/proyecto/test/user_spec.lua
   i → escribe: describe("User", function() end) → Esc
   :w

5. :ls                       → 3 buffers activos
6. :b user                   → Tab, elige "models/user.lua"
7. :b contr                  → Tab, elige controlador
8. :b spec                   → Tab, elige spec
9. Ctrl-6                   → alterna entre spec y controller
10. :wa                     → guarda todo
```

### Ejercicio G: Drill Cronometrado

```text
Realiza esta secuencia en menos de 40 segundos:
1. :ls                      → mira los buffers
2. :b {n}                   → cambia a cada buffer (todos los números)
3. Ctrl-6                   → alterna buffer 3 veces
4. :bf                      → primer buffer
5. :bl                      → último buffer
6. :b 2                     → buffer intermedio
7. :bd 4                    → elimina un buffer
8. :ls                      → confirma eliminación
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Listas buffers con `:ls` y entiendes los indicadores? | | |
| ¿Cambias buffers con `:b {n}` y `Ctrl-6`? | | |
| ¿Eliminas buffers que ya no necesitas? | | |
| ¿Tienes `set hidden` en tu configuración? | | |
| ¿Usas `:wa` para guardar todo antes de salir? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Split Navigation →](../02-ejercicio-splits/README.md)
