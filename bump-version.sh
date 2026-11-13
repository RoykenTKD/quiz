#!/bin/sh
# Kjør før hver commit som endrer quizen: setter ny versjon i index.html og version.json,
# slik at installerte hjemskjerm-apper oppdager endringen og laster siste versjon.
V=$(date +%Y%m%d-%H%M%S)
sed -i.bak "s/const APP_VERSION=\"[^\"]*\"/const APP_VERSION=\"$V\"/" index.html && rm -f index.html.bak
printf '{"v":"%s"}\n' "$V" > version.json
echo "Versjon: $V"
