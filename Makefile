DOCKER_MANIFEST=DOCKER_CLI_EXPERIMENTAL=enabled docker manifest

docker-login-ci:
	docker login -u "$$DOCKER_USER" -p "$$DOCKER_PASS";

docker-manifest-annotate:
	echo ${VERSION}
	${DOCKER_MANIFEST} create --amend "aydenbottos/screego:unstable"     "aydenbottos/screego:amd64-unstable"     "aydenbottos/screego:386-unstable"     "aydenbottos/screego:armv7-unstable"     "aydenbottos/screego:arm64-unstable"     "aydenbottos/screego:ppc64le-unstable"
	${DOCKER_MANIFEST} create --amend "aydenbottos/screego:${VERSION}" "aydenbottos/screego:amd64-${VERSION}" "aydenbottos/screego:386-${VERSION}" "aydenbottos/screego:armv7-${VERSION}" "aydenbottos/screego:arm64-${VERSION}" "aydenbottos/screego:ppc64le-${VERSION}"
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:unstable"     "aydenbottos/screego:amd64-unstable"       --os=linux --arch=amd64
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:${VERSION}" "aydenbottos/screego:amd64-${VERSION}"   --os=linux --arch=amd64
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:unstable"     "aydenbottos/screego:386-unstable"         --os=linux --arch=386
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:${VERSION}" "aydenbottos/screego:386-${VERSION}"     --os=linux --arch=386
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:unstable"     "aydenbottos/screego:armv7-unstable"       --os=linux --arch=arm --variant=v7
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:${VERSION}" "aydenbottos/screego:armv7-${VERSION}"   --os=linux --arch=arm --variant=v7
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:unstable"     "aydenbottos/screego:arm64-unstable"       --os=linux --arch=arm64
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:${VERSION}" "aydenbottos/screego:arm64-${VERSION}"   --os=linux --arch=arm64
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:unstable"     "aydenbottos/screego:ppc64le-unstable"     --os=linux --arch=ppc64le
	${DOCKER_MANIFEST} annotate "aydenbottos/screego:${VERSION}" "aydenbottos/screego:ppc64le-${VERSION}" --os=linux --arch=ppc64le


docker-manifest-push:
	${DOCKER_MANIFEST} push "aydenbottos/screego:${VERSION}"
	${DOCKER_MANIFEST} push "aydenbottos/screego:unstable"

