### Установка проекта на локальной машине

1. Клонируйте проект git clone ssh://git@gitlab.secl.com.ua:2241/e.mocharnik/Budsite.git

2. Копируйте два файлики config.php.sample admin/config.php.sample и переименуйте их в config.php admin/config.php

3. Отредактируйте созданные файлы с нужными вами настройками, где вместо /home/edgar/PhpstormProjects/budsite будет путь к вашему проекту

4. Создайте базу данных с помощью средств PhpMyAdmin или через консоль с помощью комманд

   - mysql -uuser -ppassword
   - crate database budsite;
   - quit;
    
5. Смигрируйте базу данных budsite либо с помощью PhpMyAdmin(но здесь вы должны учесть лимит на размер загружаемого файла, изменить этот лимит можно с помощью
изменения конфигурации в php.ini настройки upload_max_filesize, при потребности измените также max_execution_time)

Второй способ: с помощью консоли: **mysql -uuser -ppassword budsite < budsite.sql**
6. Сконфигурируйте подключение к базе данных в файлах *config.php.sample admin/config.php.sample* на следующие

>
- define('DB_DRIVER', 'mysqli');
- define('DB_HOSTNAME', 'localhost');
- define('DB_USERNAME', 'user');
- define('DB_PASSWORD', 'password');
- define('DB_DATABASE', 'budsite');
- define('DB_PREFIX', 'oc_');


7. Создайте папки: image/cache/ system/cache/ system/logs/ system/modification, и если вы линукс пользователь назначьте им права 777 с помощью команды
> sudo chmod -R 777 image/cache/ system/cache/ system/logs/ system/modification

8. Сконфигурируйте apache2 для того, чтобы проект можно было просматривать в браузере (нужно активировать rewrite mode)

8.1 Если вы linux-пользовтель,  то выполните следующие шаги

а. cd /etc/apache2/sites-available/

b. если у вас нету ранее созданных конфигурационных файлов, то выполните комманду и у вас уставновлена версия apache2 2.4.7

> sudo touch budsite.conf

иначе выполните команду:

> sudo cp имя_конфигурации.conf budsite.conf

c. содержание новосозданного файла для нормальной конфигурации должно быть следующее

>
<VirtualHost *:80>

	ServerName budsite.loc

	ServerAdmin webmaster@localhost

	DocumentRoot /home/edgar/PhpstormProjects/budsite

	DirectoryIndex index.php

	<Directory /home/edgar/PhpstormProjects/budsite>
		Options Indexes FollowSymLinks
		AllowOverride All
		Require all granted
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


d. sudo a2ensite budsite.conf

e. sudo gedit /etc/hosts

f. найидте настройку 127.0.0.1 localhost и через пробел добавьте budsite.loc. Локальное айпи может слушать множество сайтов

g. sudo service apache2 restart

e. Перейдите в браузере и введите budsite.loc и у вас должно все заработать.

f. Зайдите в админ панель. Перейдите Модули - модификатори. Удалите Combo Products Front-end. Перейдите к установке 
расширений и установите модкль заново из папки проекта (vqmod/xml). Обновите модификатори. У вас обновиться модуль
комботоваров