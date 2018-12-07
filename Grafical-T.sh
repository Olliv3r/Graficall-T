#!/bin/sh
# Autor : olive
# Script instala parte grafica do termux

if test -f $PREFIX/bin/ruby
then
if test -f $PREFIX/bin/figlet
then
clear

pacotes_Graficall() {
	echo "\033[00;94mInstando depen... da Parte Grafica aguarde por favor"
	pkg update
	pkg install x11-repo 
	pkg install tigervnc
	vncserver
}
# ------
depen_Fluxbox() {
	echo "
	#!/data/data/com.termux/files/usr/bin/sh
	## Fluxbox desktop.

	# Generate menu.
	fluxbox-generate_menu

	# Start fluxbox.
	fluxbox " >> ~/vnc/xstartup
}

Fluxbox() {
	echo "\033[00;94mInstalando Fluxbox... por favor aguarde..."
	pkg update
	pkg install fluxbox x11-repo
	if test -f ~/.vnc
	then
		depen_Fluxbox
	else
		mkdir ~/.vnc ;
		depen_Fluxbox
	fi
}
# ------
# ------
depenOpenBox() {
	echo "
	#!/data/data/com.termux/files/usr/bin/sh

	# Start Openbox.
	openbox-session &
" >> ~/.vnc/xstartup
}

cpainel() {
	echo "
	# Make background gray.
	xsetroot -solid gray
	# Launch PyPanel.

	pypanel &" >> ~/.vnc/xtartup
}

Openbox() {
	echo "\033[00;94mInstalando depen de OpenBox for favor aguarde..."
	pkg update ;pkg install x11-repo  openbox pypanel xorg-xsetroot
	if test -f ~/.vnc
	then
		depenOpenBox
		cpainel
	else
		depenOpenBox
		cpainel
	fi
}

depenWire() {
	echo "\033[01;94mInstalando Wireshark por favor aguarde..."
	pkg update
	pkg install x11-repo
	pkg install wireshark
}

# ------
menu() {
	echo "
	\033[01;94m{\033[01;96m1\033[01;94m} \033[01;92m- \033[01;96mInstalar Interface gráfica do termux
	\033[01;94m{\033[01;96m2\033[01;94m} \033[01;92m- \033[01;96mInstalar Fluxbox
	\033[01;94m{\033[01;96m3\033[01;94m} \033[01;92m- \033[01;96mInstalr OpenBox
	\033[01;94m{\033[01;96m4\033[01;94m} \033[01;92m- \033[01;96mInstalar Wireshark
	\033[01;94m{\033[01;91mX\033[01;94m} \033[01;92m- \033[01;96mSair"
}

retorno() {
	sh ~/Graficall-T/Grafical-T.sh
}

else
	pkg update
	pkg install figlet
fi
else
pkg install ruby ; gem install lolcat ; bash Grafical-T.sh
fi

figlet Grafival-T | lolcat
menu
echo "        ______________________"
echo -n "\033[01;93m[Instalar]\033[01;96m>>> \033[00;91m"

read r

case $r in
	"1")
		pacotes_Graficall
		echo "\033[01;94mEnter para voltar ou Ctr+C pra sair>>> \033[00;91m"
		read r
		retorno;;
	"2")
		Fluxbox
		echo "\033[01;94mEnter para voltar ou Ctr+C pra sair>>> \033[00;91m"
		read r
		retorno;;
	"3")
		Openbox
		echo "\033[01;94mEnter para voltar ou Ctr+C pra sair>>> \033[00;91m"
		read r
		retorno;;
	"4")
		depenWire
		echo "\033[01;94mEnter para voltar ou Ctr+C pra sair>>> \033[00;91m"
		read r
		retorno;;
	"X" | "x")
		echo "\033[01;91m"
		exit;;
	*)
esac
