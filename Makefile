start:
	python manage.py runserver localhost:4243 -v 3

mm:
	python manage.py migrate

patch:
	npm version patch
	git push --tags origin master
	rm -rf dist/*
	rm -rf build/*
	yarn build
	python manage.py collectstatic --noinput
	python setup.py sdist bdist_wheel
	python -m twine upload dist/*
