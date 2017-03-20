IMAGE=notebook.img

.PHONY: bootstrap

all: bootstrap

${IMAGE}:
	sudo singularity create -s 3000 ${IMAGE}

bootstrap: ${IMAGE}
	sudo singularity bootstrap ${IMAGE} Singularity

notebook: ${IMAGE}
	singularity exec ${IMAGE} /usr/local/bin/jupyter notebook

upgrade:
	sudo singularity exec --writable ${IMAGE} apt-get update
	sudo singularity exec --writable ${IMAGE} apt-get upgrade
