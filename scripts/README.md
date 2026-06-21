# 🔄 Scripts de Automatización

Scripts para automatizar tareas del repositorio del bootcamp.

## 📋 Archivos

| Archivo | Descripción |
|---------|-------------|
| `autocommit.sh` | Script principal de auto-commit |
| `install-autocommit.sh` | Instalador del timer systemd (Fedora) |
| `logs/` | Directorio de logs (auto-generado) |

## 🚀 Instalación (Fedora 43)

```bash
# Dar permisos de ejecución
chmod +x scripts/*.sh

# Instalar con intervalo por defecto (30 minutos)
./scripts/install-autocommit.sh install

# Instalar con intervalo personalizado
./scripts/install-autocommit.sh install 1h    # Cada hora
./scripts/install-autocommit.sh install 15min # Cada 15 minutos
```

## 📊 Comandos Útiles

```bash
# Ver estado del timer
./scripts/install-autocommit.sh status

# Ejecutar manualmente
./scripts/install-autocommit.sh run

# Desinstalar
./scripts/install-autocommit.sh uninstall
```

## 🏷️ Formato de Commits

El script genera commits siguiendo **Conventional Commits** en inglés:

```
type(scope): what

What: description of changes
For: purpose of changes
Impact: effect on project/users

Auto-committed by bc-vim autocommit script
```

### Tipos Detectados

| Tipo | Condición |
|------|-----------|
| `feat` | Archivos en `2-practicas/`, `3-proyecto/`, dotfiles |
| `docs` | Archivos en `1-teoria/`, `4-recursos/`, `5-glosario/`, `*.md` |
| `fix` | Archivos con "fix", "bug", "error" en el nombre |
| `chore` | Archivos de configuración, `scripts/` |
| `ci` | Archivos en `.github/` |
| `test` | Archivos de test |
| `refactor` | Archivos con "refactor" en el nombre |

### Scope Detectado

- `week-XX` — Cambios en una semana específica
- `docs` — Cambios en `docs/`
- `scripts` — Cambios en `scripts/`
- `assets` — Cambios en `assets/`
- `github` — Cambios en `.github/`

## 📝 Ejemplo de Commit Generado

```
feat(week-03): update 2 files

What: update 2 files
For: add new exercises for students
Impact: students can practice advanced motions

Auto-committed by bc-vim autocommit script
```

## 📁 Logs

Los logs se guardan en `scripts/logs/autocommit.log` y se rotan automáticamente al alcanzar 1MB.

```bash
# Ver logs
tail -f scripts/logs/autocommit.log
```
