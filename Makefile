# Nome dell'immagine Docker
IMAGE_NAME = dfossacecchi/php-fpm

# Regola principale
build:
	@if [ -z "$(TAG)" ]; then \
		echo "Il tag deve essere passato come argomento (es. 'make build TAG=latest')"; \
		exit 1; \
	fi
	docker build -t $(IMAGE_NAME):$(TAG) .

.PHONY: build