#!/usr/bin/env bash
# Exporta los README.md del bootcamp a PDF usando pandoc
# Requisitos: pandoc, weasyprint (pip install weasyprint) o wkhtmltopdf

set -euo pipefail

BOOTCAMP_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_DIR="$BOOTCAMP_DIR/docs/pdf"

mkdir -p "$OUTPUT_DIR"

echo "📄 Exportando README principal..."
pandoc "$BOOTCAMP_DIR/README.md" \
    --from=gfm \
    --to=pdf \
    --output="$OUTPUT_DIR/bootcamp-vim-readme.pdf" \
    --pdf-engine=weasyprint \
    --metadata title="Bootcamp Vim - Zero to Hero" \
    --metadata author="Bootcamp Vim" \
    --metadata lang=es

for week_dir in "$BOOTCAMP_DIR"/bootcamp/week-*; do
    if [ -d "$week_dir" ] && [ -f "$week_dir/README.md" ]; then
        week_name=$(basename "$week_dir")
        echo "📄 Exportando $week_name..."
        pandoc "$week_dir/README.md" \
            --from=gfm \
            --to=pdf \
            --output="$OUTPUT_DIR/${week_name}.pdf" \
            --pdf-engine=weasyprint \
            --metadata title="${week_name//_/ }" \
            --metadata author="Bootcamp Vim" \
            --metadata lang=es
    fi
done

echo "✅ PDFs exportados en: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
