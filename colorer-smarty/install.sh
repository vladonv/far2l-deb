#!/bin/bash
cp -rf *.hrc ~/.config/far2l/plugins/colorer
sed -i 's/UserHrcPath\=$/UserHrcPath\=\~\/\.config\/far2l\/plugins\/colorer\/user\.hrc/g' ~/.config/far2l/plugins/colorer/config.ini

