<?php
$auth = pam_auth($_GET['user'], $_GET['password']);
var_dump($auth);