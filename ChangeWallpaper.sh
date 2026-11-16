#!/bin/bash
WALLPAPER_DIR="/home/sibay/Изображения/Wallpaper/"
while true; do
    RANDOM_FILE=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | shuf -n1)

    if [ -n "$RANDOM_FILE" ] && [ -f "$RANDOM_FILE" ]; then
        # Устанавливаем обои через gsettings
        gsettings set org.gnome.desktop.background picture-uri "file://$RANDOM_FILE"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$RANDOM_FILE"
        echo "$(date): Обои изменены на $RANDOM_FILE" >> "/home/sibay/Изображения/Wallpaper/.wallpaper-log"
    else
        echo "$(date): Не найдено изображение в $WALLPAPER_DIR" >> "/home/sibay/Изображения/Wallpaper/.wallpaper-log"
    fi

    sleep 900
done