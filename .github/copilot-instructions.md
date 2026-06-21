# Instrucciones de Copilot para Bootcamp Vim

## Contexto del proyecto

Bootcamp educativo "Vim Zero to Hero" (10 semanas, 80 horas). Formación intensiva en Vim/Neovim para desarrollo profesional.

## Reglas generales

1. **Idioma**: Responde en español neutro con tuteo (no voseo argentino).
2. **Público**: Estudiantes sin experiencia previa en Vim. Asume que es su primera semana.
3. **Terminal primero**: Todos los comandos deben ejecutarse desde la terminal (no GUIs).
4. **Neovim por defecto**: Recomienda Neovim 0.10+ como editor. Si el usuario usa Vim 9.1+, mantén compatibilidad.
5. **Mejores prácticas**: Enseña la forma idiomática de Vim (el "Vim way").

## Reglas de código/configuración

1. **Lua para Neovim**: Configuración en Lua para Neovim (no init.vim, no vimscript).
2. **Vimscript para Vim**: Si el entorno es Vim clásico, usa vimscript en .vimrc.
3. **lazy.nvim**: Usa lazy.nvim como gestor de plugins para Neovim.
4. **vim-plug**: Si el entorno es Vim clásico, usa vim-plug.
5. **Mappings**: Usa `<leader>` como prefijo para mappings personalizados (por defecto `\` o redefinirlo a `<space>`).
6. **Idiomático Vim**: Prefiere operadores + motions/text-objects sobre edición carácter por carácter.

## Estructura del bootcamp

```
.vscode/settings.json   → Configuración de VS Code con Vim (para transición)
assets/                 → Recursos visuales
bootcamp/week-XX/       → Contenido semanal con estructura README + teoría + prácticas + proyecto
scripts/                → Scripts de automatización
docs/                   → Documentación adicional
```

## Reglas para ejemplos

1. Explica el "por qué" detrás de cada comando.
2. Muestra el antes y después en ejemplos de edición.
3. Usa comentarios en ejemplos de configuración explicando cada opción.
4. Relaciona cada comando con la filosofía modal.

## Errores comunes a evitar

1. No uses el ratón para navegar.
2. No permanezcas en modo inserción.
3. No uses las flechas para moverte (usa hjkl).
4. No uses Ctrl+S para guardar (usa :w).
5. No uses Ctrl+C Ctrl+V (usa los registros de Vim).

## Prompt para generar comandos

Al sugerir una secuencia de comandos Vim, usa este formato:

```
Objetivo: [qué quieres lograr]
Comando: [la secuencia exacta]
Explicación: [por qué funciona así]
Alternativa: [otra forma de hacerlo, si existe]
```

## Terminología

- **Normal mode**: Modo por defecto para navegar y ejecutar comandos
- **Insert mode**: Modo para escribir texto
- **Visual mode**: Modo para seleccionar texto
- **Command-line mode**: Modo para comandos con `:`
- **Motion**: Movimiento del cursor
- **Text object**: Unidad de texto (palabra, oración, párrafo, paréntesis, etc.)
- **Operator**: Comando que actúa sobre texto (d=delete, c=change, y=yank, etc.)
- **Register**: Espacio de almacenamiento para texto copiado/eliminado
- **Macro**: Secuencia de comandos grabada para repetir
- **Buffer**: Archivo cargado en memoria
- **Window**: Vista de un buffer
- **Tab**: Colección de ventanas
