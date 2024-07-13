#!/bin/sh


echo "Apply Database Migration"

python manage.py makemigrations
python manage.py migrate


exec "$@"