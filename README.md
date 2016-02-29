# Create virtual host in Mac OSx or Linux

> Script para criação de virtal host.

### Modo de usar

1. Clone o repositório para sua máquina com o comando `git clone git@github.com:ribeiroevandro/virtual-host.git .virtual-host`;
2. Acesse o diretório com `cd .virtual-host` abra a pasta do projeto com `subl .` _O comando **subl** é um alias do Sublime Text, fique a vontade para usar o seu editor favorito_.
3. Altere o arquivo de acordo com o seu sistema operacional, para usuários de Mac OS, edite o arquivo `mvhost.sh` e usuários Linux, edite o arquivo `lvhost.sh`
4. Informe seu usuário na variável USUARIO na linha **13**;
5. Torne o arquivo executável usando o comando `chmod +x mvhost` se estiver executando de um **Mac OS** ou `chmod +x lvhost` caso esteja usando **Linux**;
6. Execute no terminal `ln -s ~/.virtual-host/mvhost.sh /usr/local/bin/mvhost` ou `ln -s ~/.virtual-host/lvhost.sh /usr/local/bin/lvhost`
7. Reinicie o terminal e execute `mvhost app-name` ou `lvhost app-name`;
 
#### Resultado

##### Mac OS
```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /Users/user/Sites/app-name
    ServerName app-name.l
    <Directory /Users/user/Sites/app-name>
        Options Indexes FollowSymLinks
        AllowOverride All
        Allow from all
    </Directory>
    ErrorLog /var/log/app-name-error.log
    CustomLog /var/log/app-name-access.log combined
</VirtualHost>
```

##### Linux
```
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/app-name
	ServerName app-name.l
	<Directory "/var/www/app-name">
		Options Indexes FollowSymLinks
		AllowOverride All
		Allow from all
	</Directory>
	ErrorLog /var/log/app-name-error.log
	CustomLog /var/log/app-name-access.log combined
</VirtualHost>
```