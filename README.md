# Graficall-T
Ambiente Gráfico O Termux fornece suporte para programas que usam o X Window System. No entanto, não há aceleração de hardware para renderização e o usuário terá que instalar um aplicativo de terceiros para visualizar a saída gráfica.

Para usar programas habilitados para X11, certifique-se de que pelo menos um dos seguintes programas esteja instalado: VNC Viewer - a melhor escolha para interagir com o ambiente gráfico. Requer um servidor VNC em execução. XServer XSDL - este pode ser instável, mas fornece um servidor Xorg independente para que você não precise configurar o VNC.

Ativando o Repositório X11 Você pode habilitar o repositório de pacotes X11 executando este comando: 

$ pkg install x11-repo  

O comando acima adicionará automaticamente o arquivo sources.list e a chave PGP apropriados. Se você quiser desabilitar este repositório - basta remover o pacote instalado. Configurando o VNC Servidor Se você decidiu usar o VNC para saída gráfica, siga estas instruções para configurar corretamente o servidor VNC. 

1.Instale o pacote `tigervnc`: 

pkg instala tigervnc

2. Após a instalação, execute isto: 

vncserver

Na primeira vez, você será solicitado a configurar senhas: Você precisará de uma senha para acessar seus desktops. Senha: Verificar: Deseja inserir uma senha somente para visualização (s / n)? n Observe que as senhas não são visíveis quando você as digita e o comprimento máximo da senha é de 8 caracteres. 3. Se tudo estiver bem, você verá esta mensagem: Nova área de trabalho 'localhost: 1 ()' é localhost: 
1 Criando script de inicialização padrão 

/data/data/com.termux/files/home/.vnc/xstartup 

Criando configuração padrão 

/data/data/com.termux/files/home/.vnc/config

Iniciando os aplicativos especificados em 

/data/data/com.termux/files/home/.vnc/xstartup 

O arquivo de log é 

/data/data/com.termux/files/home/.vnc/localhost:1.log

Isso significa que o servidor X (vnc) está disponível no display 'localhost: 1'. 4. Finalmente, para fazer os programas fazerem a saída gráfica para o display 'localhost: 1', defina a variável de ambiente como mostrado aqui (sim, sem especificar 'localhost'): 

export DISPLAY=":1" 

Você pode até mesmo colocar essa variável em seu bashrc ou perfil para que você não precise configurá-la manualmente, a menos que o endereço de exibição seja alterado. Cliente Aqui será assumido que você usa este cliente Android VNC: VNC Viewer (desenvolvido pela RealVNC Limited).

1. Determine o número da porta na qual o servidor VNC atende. Pode ser calculado assim: 5900 + {display number}. Portanto, para exibir 'localhost: 1', a porta será 5901. 2. Agora abra o aplicativo VNC Viewer e crie uma nova conexão com as seguintes informações (supondo que a porta VNC seja 5901): Endereço: 127.0.0.1:5901 Nome: Termux 3. Agora inicie. Você será solicitado a inserir a senha na primeira inicialização do 'vncserver'. Dependendo dos pacotes que você instalou, você poderá ver a tela totalmente preta ou o prompt do terminal (somente se 'aterm' estiver instalado). Gerentes de janela Fluxbox

A maneira mais simples de obter um ambiente gráfico funcional é instalar o Fluxbox: 

pkg install fluxbox

Pode ser iniciado automaticamente na inicialização do servidor VNC. Para fazer isso, edite o arquivo 

~/.vnc/xstartup 

como mostrado aqui: 

#!/data/data/com.termux/files/usr/bin/sh
## Fluxbox desktop.
# Gerar menu.
fluxbox-generate_menu 
# Iniciar o fluxbox. 
fluxbox & Caixa aberta


O Openbox requer uma configuração mais complicada que o Fluxbox. Em primeiro lugar você precisa instalar alguns pacotes:

pkg install openbox pypanel xorg-xsetroot 

Quanto ao Fluxbox, é recomendado colocar as seguintes linhas no seu 
~/.vnc/xstartup

#!/data/data/com.termux/files/usr/bin/sh 
# Inicie o Openbox. sessão de caixa aberta Não coloque mais nada para arquivar 

~/.vnc/xstartup, mas somente as linhas mostradas acima, já que o Openbox tem seu próprio script de auto-inicialização. Está localizado em $ {PREFIX} / etc / xdg / openbox / autostart. Edite este arquivo como aqui: # Tornar cinza de fundo. xsetroot - cinza sólido # Lançar PyPanel. pypanel e Veja também
