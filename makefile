build:
	./build.sh

test:
	pytest

clean:
	./clean.sh
run:
	systemctl start counter

build-deb:
	./debBuild.sh

lint-deb:
	-lintian counter-v2.0.0.deb