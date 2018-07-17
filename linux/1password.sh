VERSION=0.5

TMPDIR=$(mktemp -d)
DEST=/usr/local/bin/op

curl -L "https://cache.agilebits.com/dist/1P/op/pkg/v${VERSION}/op_linux_amd64_v${VERSION}.zip" -o "${TMPDIR}/op.zip"
unzip "${TMPDIR}/op.zip" -d "${TMPDIR}"
mv "${TMPDIR}/op" "${DEST}"
chmod 777 "${DEST}"

echo "\n\e[92m ✔\e[0m \e[1m1password installed at:\e[0m ${DEST}\n"
