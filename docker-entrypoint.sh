#!/bin/sh
set -e
python init_db.py                                  # creates the database/tables if missing
if [ "$SEED_DEMO" = "1" ]; then python seed_data.py || true; fi   # demo data only into an empty DB
exec gunicorn wsgi:app -b 0.0.0.0:${PORT:-5000} --workers 2
