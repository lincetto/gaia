<?php
 
/* Controlla che l'autopull sia attivo */
if (!file_exists('upload/setup/autopull')) {
    
}

$GIT_BIN = '/usr/bin/git';
$REMOTE = 'origin';
$BRANCH = 'master';

header('Content-Type: text/plain');

$output = '';

exec("$GIT_BIN fetch $REMOTE 2>&1; $GIT_BIN checkout -q $REMOTE/$BRANCH 2>&1; $GIT_BIN log -1 2>&1;", $output);

$output = date('d-m-Y H:i:s') . "\n\n" . $output;

file_put_contents('upload/log/autopull.txt');