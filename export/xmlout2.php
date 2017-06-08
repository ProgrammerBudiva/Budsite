<?php


if(($_POST['user']=='admin')&&($_POST['auth']=='ocpass'))
{
if($_POST['xml']=='export')
{
    $exp=file_get_contents('/home/andriyyy/projects/Budsite/export/openc_exp.xml');
   echo $exp;
}

if($_POST['xml']=='import')
{
    $imp=file_get_contents('/home/andriyyy/projects/Budsite/export/openc_imp.xml');
    echo $imp;
}

}

