<?php

$conf = new RdKafka\Conf();
$conf->set('log_level', (string) LOG_DEBUG);
$conf->set('debug', 'all');
$rk = new RdKafka\Producer($conf);
$rk->addBrokers("10.0.0.1:9092,10.0.0.2:9092");

echo "Hello World";