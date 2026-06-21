# ✏️ Ejercicio 03: Edición Básica

## 🎯 Objetivo

Practicar operaciones de edición: insertar, eliminar, copiar, pegar, deshacer.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear Archivo Base

Copia este contenido a `~/vim-practica-edicion.md` usando Vim:

```bash
nvim ~/vim-practica-edicion.md
```

Pega este contenido (en Insert mode):

```markdown
# Receta de Cocina

## Ingredientes

## Instrucciones

## Notas
```

---

## 🎮 Ejercicios de Edición

### Ejercicio A: Insertar texto

```text
1. Ve debajo de "## Ingredientes" (con j)
2. Presiona o → nueva línea abajo, Insert mode
3. Escribe: "- 2 tazas de harina"
4. Esc → volver a Normal mode
5. Presiona o → otra línea
6. Escribe: "- 3 huevos"
7. Esc
8. Presiona O → nueva línea ARRIBA
9. Escribe: "- 1 taza de azúcar"
10. Esc

Resultado esperado:
## Ingredientes
- 1 taza de azúcar    ← insertado con O (arriba)
- 2 tazas de harina   ← insertado con o (abajo)
- 3 huevos            ← insertado con o (abajo)
```

### Ejercicio B: Ir al final/principio e insertar

```text
1. Ve a la línea "- 3 huevos"
2. Presiona A → final de línea, Insert mode
3. Escribe: " (grandes)"
4. Esc
5. Ve a "- 2 tazas de harina"
6. Presiona I → inicio de línea, Insert mode
7. Las flechas no funcionan aquí, pero puedes usar ← → si quieres
8. Cambia "-" por "*" (bórralo con Backspace y escribe *)
9. Esc
10. Repite para las otras líneas si quieres practicar I

Resultado esperado:
* 1 taza de azúcar
* 2 tazas de harina
* 3 huevos (grandes)
```

### Ejercicio C: Eliminar

```text
1. Ve a "## Notas"
2. Presiona dd → elimina toda la línea
3. Presiona u → deshacer (la línea vuelve)
4. Presiona Ctrl-r → rehacer (la línea desaparece otra vez)
5. Presiona u → deshacer de nuevo

6. En la línea "* 3 huevos (grandes)", ve sobre el paréntesis
7. Presiona x → elimina el '('
8. Presiona x 7 veces más → elimina "grandes)"
9. Presiona u varias veces para deshacer

10. Ve a "## Notas" otra vez
11. Presiona D → elimina desde cursor hasta fin de línea
12. Si el cursor estaba en 'N', elimina "Notas" pero deja "## "
13. Presiona u para deshacer
```

### Ejercicio D: Copiar y Pegar

```text
1. Ve a la línea "* 2 tazas de harina"
2. Presiona yy → copia la línea
3. Presiona j → baja una línea
4. Presiona p → pega debajo
5. Presiona j p → pega otra vez

Deberías tener:
* 2 tazas de harina
* 3 huevos (grandes)
* 2 tazas de harina    ← primera copia
* 2 tazas de harina    ← segunda copia

6. Presiona u u → deshacer las dos copias

7. Ahora practica mover líneas:
   - Ve a "* 3 huevos (grandes)"
   - ddp → la línea baja una posición
   - ddkkP → la línea sube una posición
```

### Ejercicio E: Guardar y Salir

```text
1. Presiona :w → guardar (verás "written" en la barra)
2. Sigue editando cualquier cosa
3. Presiona :q → si no guardaste, Vim te advertirá
4. Presiona :wq o :x → guarda y sale
5. Vuelve a abrir: nvim ~/vim-practica-edicion.md
6. Presiona :q! → sale sin guardar
```

### Ejercicio F: Edición Libre

Crea un documento nuevo `~/vim-practica-libre.md` y escribe una carta o nota breve usando SOLO Vim:

```text
Requisitos:
- Al menos 10 líneas de contenido
- Usar o/O para crear nuevas líneas (no Enter en Insert mode para línea vacía)
- Usar A para añadir al final de líneas existentes
- Usar x para corregir errores de tipeo
- Usar dd para eliminar líneas que no te gusten
- Usar u para deshacer
- Usar yy + p para duplicar una línea
- Usar :w frecuentemente para guardar
- NO usar las flechas ni el ratón
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste i y a correctamente (insertar antes vs después)? | | |
| ¿Usaste o y O (línea nueva abajo vs arriba)? | | |
| ¿Eliminaste líneas con dd sin usar x 50 veces? | | |
| ¿Copiaste y pegaste con yy + p? | | |
| ¿Usaste :w periódicamente para guardar? | | |
| ¿Saliste correctamente con :wq o :q!? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Configuración →](../04-ejercicio-config/README.md)
