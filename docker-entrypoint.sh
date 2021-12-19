#!/bin/bash

sed -i '0.0.0.0/g' /usr/src/app/web/vue/dist/UIconfig.js
sed -i '0.0.0.0/'${HOST}'/g' /usr/src/app/web/vue/dist/UIconfig.js
sed -i '3000/'${PORT}'/g' /usr/src/app/web/vue/dist/UIconfig.js
if [[ "${USE_SSL:-0}" == "1" ]] ; then
    sed -i 'ssl: false/ssl: true/g' /usr/src/app/web/vue/dist/UIconfig.js
fi
exec node gekko "$@"
