# 📚 Ejercicio 02: Arglist y Procesamiento Batch

## 🎯 Objetivo

Gestionar el arglist y ejecutar comandos en lote con :argdo, :bufdo y :cfdo.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Crea un conjunto de archivos de prueba:

```bash
mkdir -p ~/proyecto-batch/src
for i in 1 2 3 4 5; do
  echo "local old_var_$i = 'valor'" > ~/proyecto-batch/src/modulo_$i.lua
  echo "print(old_var_$i)" >> ~/proyecto-batch/src/modulo_$i.lua
  echo "-- TODO: refactorizar old_var_$i" >> ~/proyecto-batch/src/modulo_$i.lua
done
```

---

## 🎮 Ejercicios

### Ejercicio A: Gestionar Arglist

```text
1. nvim                          → abre Vim sin archivos
2. :cd ~/proyecto-batch
3. :args src/**/*.lua            → carga todos los .lua en arglist
4. :args                         → ver lista
5. :first                        → primer archivo
6. :next                         → siguiente
7. :last                         → último
```

### Ejercicio B: Sustitución con :argdo

```text
1. :args src/**/*.lua
2. :argdo %s/old_var/new_var/g   → reemplaza en todos
3. :argdo update                 → guarda todos
4. :first                        → vuelve al primero
5. Verifica: /new_var → debe aparecer en el archivo
```

### Ejercicio C: Sustitución con Confirmación

```text
1. (Primero deshaz: u en cada archivo, o recréalos)
2. :args src/**/*.lua
3. :argdo %s/old_var/new_var/gc | update
   → y para aceptar, n para saltar, a para aceptar todos
```

### Ejercicio D: Macro con :argdo

```text
1. Graba macro 'r' que:
   q r
   gg /TODO Enter c w DONE Esc
   q

2. :args src/**/*.lua
3. :argdo norm @r | update    → ejecuta macro en todos
4. :first → verifica que TODO cambió a DONE
```

### Ejercicio E: :cfdo desde Quickfix

```text
1. :vimgrep /TODO/gj **/*.lua
2. :copen
3. :cfdo %s/TODO/COMPLETADO/g | update
   → cambia en cada archivo con TODOs

4. :vimgrep /TODO/gj **/*.lua
   → debería dar 0 resultados
5. :vimgrep /COMPLETADO/gj **/*.lua
   → debería encontrar los cambios
```

### Ejercicio F: Batch con :bufdo

```text
1. :e archivo1.txt (crea algunos archivos)
2. :e archivo2.txt
3. :e archivo3.txt
4. :bufdo %s/foo/bar/ge | update
   → opera en todos los buffers abiertos
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Gestioné arglist con :args, :arga, :argd? | | |
| ¿Ejecuté :argdo para sustituciones batch? | | |
| ¿Usé :cfdo para procesar archivos de quickfix? | | |
| ¿Probé confirmación con /gc? | | |
| ¿Tengo set hidden activado? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Sesiones y Location →](../03-ejercicio-sesiones/README.md)
