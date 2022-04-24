#!/usr/bin/env bash

# Завершить текущие экземпляры polybar
while uid=`pgrep polybar`; do kill -s KILL $uid; done

# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
polybar bar &

echo "Polybar загрузился..."
