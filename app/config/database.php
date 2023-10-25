<?php

return [
    'default' => 'main',
    'debug'   => false,
    'connections' => [
        'main' => [
            'adapter' => 'mysql',
            'options' => [
                'host'         => 'localhost',
                'port'         => '3306',
                'dbname'       => 'db_cafe-tahura',
                'username'     => 'root',
                'password'     => '',
                'dialectClass' => Phalcon\Db\Dialect\Mysql::class,
            ]
        ],
    ],
];
