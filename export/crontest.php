<?php
$out=date("d.m.Y h:i:sa");
$file='/home/budsit00/budsite.com.ua/www/export/time.txt';
file_put_contents($file, $out);