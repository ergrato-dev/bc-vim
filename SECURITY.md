# Política de Seguridad

## Reportar una Vulnerabilidad

Si descubres una vulnerabilidad de seguridad en este repositorio, por favor **no abras un issue público**.

Envía un reporte a través de [GitHub Security Advisories](https://github.com/ergrato-dev/bc-vim/security/advisories/new) o contacta directamente al mantenedor del proyecto.

## Alcance

Este repositorio contiene material educativo. Las vulnerabilidades pueden incluir:

- Scripts de shell inseguros o con posibles efectos secundarios no deseados
- Configuraciones de Vim/Neovim que podrían exponer datos
- Comandos de ejemplo que podrían ser malinterpretados y causar daños
- Enlaces a recursos externos comprometidos

## Buenas Prácticas para Estudiantes

- **Revisa antes de ejecutar**: Lee cualquier script antes de ejecutarlo
- **No ejecutes como root**: Los scripts del bootcamp están diseñados para ejecutarse como usuario normal
- **Respaldos**: Haz copias de seguridad de tus dotfiles antes de aplicar nuevas configuraciones
- **Plugins**: Verifica la procedencia de los plugins y su seguridad antes de instalarlos
- **Modelines**: Ten cuidado con `modeline` en archivos de terceros

## Versiones Soportadas

| Versión | Soportada |
|---------|-----------|
| Rama `main` (última) | ✅ |
| Versiones anteriores | ❌ |

## Divulgación Responsable

Al reportar una vulnerabilidad, por favor incluye:

1. Descripción detallada del problema
2. Pasos para reproducir
3. Impacto potencial
4. Sugerencias de mitigación (si las tienes)

Nos comprometemos a responder en un plazo de 48 horas y proporcionar un timeline para la resolución.
