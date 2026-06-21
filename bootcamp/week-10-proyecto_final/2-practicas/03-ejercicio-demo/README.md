# 🎬 Ejercicio 03: Demo y Grabación

## 🎯 Objetivo

Preparar y ensayar una demostración en vivo de 3-5 minutos de tu configuración.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Preparar Archivos de Demo

Crea archivos de práctica con "errores" incluidos para mostrar funcionalidades LSP:

```bash
mkdir -p ~/proyecto-demo/src
```

Usa la plantilla de la teoría [04-flujo-demostracion.md](../../1-teoria/04-flujo-demostracion.md).

### Paso 2: Definir el Guion

Escribe tu propio guion de 3-5 minutos cubriendo:

```text
[0:00-0:30] APERTURA — mostrar editor, tema, estructura
[0:30-1:30] NAVEGACIÓN — telescope, file tree, splits
[1:30-2:30] LSP — diagnóstico, hover, go-to-def, rename
[2:30-3:30] GIT — gitsigns, :Gstatus, commit
[3:30-4:30] FLUJO — ciclo completo editar→testear→commit
[4:30-5:00] CIERRE — which-key, repo GitHub
```

### Paso 3: Ensayar

```text
1. Repasa el guion mentalmente (5 min)
2. Ejecuta la demo completa SIN hablar (primera pasada)
3. Ejecuta la demo completa HABLANDO (segunda pasada)
4. Ajusta tiempos, simplifica si es necesario
5. Ejecuta versión final (tercera pasada)
```

### Paso 4: Grabar (Opcional)

Si necesitas enviar un video:

```bash
# Linux: SimpleScreenRecorder, OBS, o peek (GIF)
sudo apt install peek

# macOS: QuickTime Player → File → New Screen Recording

# Terminal recording con asciinema
sudo apt install asciinema
asciinema rec demo.cast
# Ctrl+D para terminar
asciinema play demo.cast
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Tengo archivos de demo preparados? | | |
| ¿Tengo un guion mental de 5 pasos? | | |
| ¿Ensayé al menos 2 veces? | | |
| ¿La demo dura 3-5 minutos? | | |
| ¿Muestro al menos 5 features diferentes? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Reflexión y Publicación →](../04-ejercicio-reflexion/README.md)
