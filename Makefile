# Makefile

run:
	python app/manage.py runserver 0.0.0.0:8000

migrate:
	python app/manage.py migrate

createsuperuser:
	python app/manage.py createsuperuser

shell:
	python app/manage.py shell

