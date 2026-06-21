# 🔀 Ejercicio 04: Fugitive Avanzado

## 🎯 Objetivo

Usar vim-fugitive para blame interactivo, explorar historial, diff y merge.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Necesitas estar en un repositorio git. Usa el bootcamp o cualquier proyecto.

---

## 🎮 Ejercicios

### Ejercicio A: Blame Interactivo

```text
1. Abre un archivo con historial de git
2. :Gblame
   → abre blame en panel lateral

3. En la ventana de blame:
   Enter sobre un commit → ver el commit completo
   o → abrir commit en split
   p → reblame desde el commit anterior
   q → cerrar blame
```

### Ejercicio B: Explorar Historial

```text
1. :Glog
   → historial de commits del archivo actual

2. :0Glog
   → historial de TODO el repositorio

3. En la ventana de log:
   Enter sobre un commit → ver commit
   o → abrir en split
   S → abrir en split vertical
```

### Ejercicio C: Diff con Versiones Anteriores

```text
1. :Gdiffsplit HEAD~1
   → diff con el commit anterior

2. :Gdiffsplit HEAD~3
   → diff con hace 3 commits

3. ]c / [c → navegar cambios

4. :Gdiffsplit main (o master)
   → diff con otra rama

5. :diffoff → salir del modo diff
```

### Ejercicio D: Ver Versiones Antiguas

```text
1. :Gedit HEAD~1:./%
   → abre versión del commit anterior
   → en buffer separado (readonly)

2. :Gedit origin/main:./%
   → abre versión de la rama main

3. Yank texto necesario → vuelve al buffer actual → pega
```

### Ejercicio E: Git Status Interactivo

```text
1. Haz algunos cambios sin commit
2. :Gstatus (o :Git)
   → status interactivo

3. Navega archivos con j/k
4. - sobre un archivo → stage/unstage
5. = sobre un archivo → ver diff inline
6. cc → commit
7. Escribe mensaje → :wq
```

### Ejercicio F: Log y Búsqueda en Commits

```text
1. :G log --oneline -20
   → últimos 20 commits

2. :Git log --grep="fix" 
   → commits que mencionan "fix"

3. :Git log --author="nombre"
   → commits de un autor específico
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usé :Gblame interactivo? | | |
| ¿Exploré historial con :Glog? | | |
| ¿Hice diff con :Gdiffsplit? | | |
| ¿Vi versiones antiguas con :Gedit? | | |
| ¿Navegué :Gstatus con -/=? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
