# 🔎 Ejercicio 04: Búsqueda y Navegación

## 🎯 Objetivo

Practicar búsqueda en archivo con `/`, `?`, `n`, `N` y saltos contextuales con `*`, `#`, `%`.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear el Archivo de Práctica

```bash
nvim ~/vim-practica-busqueda.js
```

Copia este contenido (en Insert mode):

```javascript
// Archivo de práctica para búsqueda y navegación
// Contiene múltiples ocurrencias de patrones comunes

function calcularTotal(items) {
    let total = 0;
    for (let i = 0; i < items.length; i++) {
        const item = items[i];
        if (item.precio > 0) {
            total += item.precio * item.cantidad;
        }
    }
    return total;
}

function procesarPedido(pedido) {
    // TODO: validar datos de entrada
    const items = pedido.items;
    const total = calcularTotal(items);

    // TODO: aplicar descuentos
    let descuento = 0;
    if (total > 100) {
        descuento = total * 0.1;
    }

    // FIXME: calcular impuestos correctamente
    const impuesto = (total - descuento) * 0.21;

    return {
        subtotal: total,
        descuento: descuento,
        impuesto: impuesto,
        total: total - descuento + impuesto
    };
}

function validarEmail(email) {
    // HACK: validación simple, mejorar después
    return email.includes('@') && email.includes('.');
}

function formatearFecha(fecha) {
    // TODO: soportar diferentes formatos
    const date = new Date(fecha);
    return date.toLocaleDateString();
}

function enviarFactura(cliente) {
    const email = cliente.email;

    if (!validarEmail(email)) {
        // FIXME: mejor manejo de errores
        console.error("Email inválido:", email);
        return false;
    }

    // TODO: implementar envío real
    console.log("Factura enviada a:", email);
    return true;
}

// Datos de prueba
const pedidoPrueba = {
    items: [
        { nombre: "Producto A", precio: 25, cantidad: 2 },
        { nombre: "Producto B", precio: 40, cantidad: 1 },
        { nombre: "Producto C", precio: 15, cantidad: 3 }
    ]
};

const clientePrueba = {
    email: "cliente@example.com"
};

const resultado = procesarPedido(pedidoPrueba);
console.log("Resultado:", resultado);
enviarFactura(clientePrueba);
```

Guarda con `:w`.

---

## 🎮 Ejercicios

### Ejercicio A: Búsqueda con / y navegación con n/N

```text
1. /TODO<Enter>   → busca "TODO" hacia adelante
2. n              → siguiente TODO
3. n              → siguiente TODO
4. n              → ¿cuántos TODOs hay en total? (respuesta: 4)
5. N              → TODO anterior
6. N              → TODO anterior (hacia atrás)

7. :noh           → limpia el resaltado
8. /console<Enter> → busca "console"
9. n n n           → navega por los console.log y console.error
10. d n            → elimina hasta el siguiente console... (peligroso!)
    Mejor no ejecutes esto, solo entiende que se puede.
```

### Ejercicio B: Búsqueda hacia atrás con ?

```text
1. G              → final del archivo
2. ?TODO<Enter>   → busca TODO hacia ATRÁS
3. n              → anterior (más atrás)
4. n              → anterior
5. N              → siguiente (hacia adelante, dirección opuesta)

Recuerda: con ?, n va hacia atrás, N va hacia adelante.
```

### Ejercicio C: * y # (palabra bajo el cursor)

```text
1. Ve a la palabra "total" en la función calcularTotal
2. Coloca el cursor sobre "total"
3. *              → busca siguiente "total"
4. n n n          → navega todas las ocurrencias
5. Observa: ¿encuentra "subtotal"? No, porque * busca palabra EXACTA.

6. Ahora coloca el cursor sobre "total" de nuevo
7. g*             → busca siguiente ocurrencia PARCIAL
8. n              → ¿encuentra "subtotal"? ¡Sí!

9. #              → busca "total" hacia ATRÁS
10. g#            → busca PARCIAL hacia ATRÁS
```

### Ejercicio D: % (par correspondiente)

```text
1. Ve al inicio del archivo (gg)
2. Busca el primer '(' → f(
3. %              → salta al ')' correspondiente
4. %              → vuelve al '('

5. Busca un '{' → f{
6. %              → salta al '}' correspondiente
7. %              → vuelve al '{'

8. Prueba con el objeto pedidoPrueba:
   Ve al '{' de pedidoPrueba
   %              → salta al '}' que cierra el objeto entero

9. Prueba con los [] de items:
   Ve a un '['
   %              → salta al ']' correspondiente

10. Prueba combinación: d%
    Ve al '(' de calcularTotal(items)
    d%             → elimina todo hasta el ')' correspondiente (inclusive)
    u              → deshacer
```

### Ejercicio E: Búsqueda como motion con operadores

```text
1. Ve a la línea "// TODO: validar datos de entrada"
2. d / FIXME <Enter> → elimina desde aquí hasta "FIXME"
3. u                 → deshacer

4. Ve a "// HACK: validación simple"
5. c / console <Enter> → cambia desde aquí hasta "console"
6. Escribe: // MEJORA: validación robusta
7. Esc

8. u                 → deshacer

9. Ve a "function calcularTotal"
10. y / function <Enter> → copia desde aquí hasta siguiente "function"
11. G                  → final del archivo  
12. p                  → pega la copia
13. u u                → deshacer pegado y volver
```

### Ejercicio F: Combinado: Modificar TODOs y FIXMEs

```text
Tarea: Cambiar todos los "TODO" por "TODO-SEMANA2" y "FIXME" por "FIXME-SEMANA2".

Estrategia 1 (principiante):
/TODO<Enter> → cw → TODO-SEMANA2 Esc → n → . → n → . → n → .

Estrategia 2 (avanzado, Semana 3):
:%s/TODO/TODO-SEMANA2/g

Por ahora usa la Estrategia 1:
1. /TODO<Enter>     → primer TODO
2. ciw              → cambia palabra
3. TODO-SEMANA2 Esc
4. n                → siguiente TODO
5. .                → repite el cambio
6. n . n . n .      → cambia todos los TODOs

7. /FIXME<Enter>    → primer FIXME
8. ciw              → cambia palabra
9. FIXME-SEMANA2 Esc
10. n . n .         → cambia todos los FIXMEs
```

### Ejercicio G: Navegación contextual libre

```text
Explora el archivo USANDO SOLO:
- * y #     (para saltar entre usos de variables)
- %         (para saltar entre pares)
- / y n/N   (para buscar patrones)

Objetivo: Navegar por todo el archivo en menos de 2 minutos,
tocando cada función y cada variable al menos una vez.

Secuencia sugerida:
1. gg → inicio del archivo
2. * sobre "calcularTotal" → primera definición
3. n → siguiente uso
4. % en '(' de la definición → salta al ')'
5. /function<Enter> → siguiente función
6. * sobre esa función → busca usos
7. n n → navega usos
8. /return<Enter> → busca returns
9. n n n → navega returns
10. G → final
11. :noh → limpia resaltado
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usas `/` y `?` sin confundir sus direcciones? | | |
| ¿Navegas resultados con `n`/`N` sin perderte? | | |
| ¿Usas `*` para buscar referencias de variables/funciones? | | |
| ¿Diferencias `*` (exacta) de `g*` (parcial)? | | |
| ¿Usas `%` para saltar entre pares en código anidado? | | |
| ¿Combinas `d`/`c`/`y` con `/` como motion? | | |
| ¿Limpias el resaltado con `:noh` cuando ya no lo necesitas? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
