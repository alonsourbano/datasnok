<?php
# https://www.hackerrank.com/challenges/stack-exchange-question-classifier

$topics = [
    'gis',
    'security',
    'photo',
    'mathematica',
    'unix',
    'wordpress',
    'scifi',
    'electronics',
    'android',
    'apple'
];

$android = [
    'android',
    'aokp',
    'aosp',
    'app',
    'battery',
    'call',
    'device',
    'galaxy',
    'google',
    'htc',
    'jelly',
    'keyboard',
    'lg',
    'memory',
    'mobile',
    'network',
    'nexus',
    'phone',
    'play',
    'rom',
    's2',
    'samsung',
    'sd',
    'store',
    'wifi'
];

$apple = [
    'app',
    'apple',
    'finder',
    'imac',
    'ios',
    'ipad',
    'iphone',
    'ipod',
    'itunes',
    'lion',
    'mac',
    'macbook',
    'mail',
    'mountain',
    'network',
    'osx',
    'phone',
    'safari',
    'time machine'
];

$electronics = [
    '12v',
    'ac',
    'amp',
    'arduino',
    'batter',
    'bit',
    'cable',
    'capacitor',
    'charge',
    'circuit',
    'connector',
    'control',
    'controller',
    'dc',
    'design',
    'device',
    'electronic',
    'frequenc',
    'input',
    'led',
    'load',
    'ma',
    'microcontroller',
    'modul',
    'motor',
    'output',
    'pcb',
    'pin',
    'power',
    'schema',
    'sensor',
    'signal',
    'soldering',
    'source',
    'switch',
    'voltage',
    'wire'
];

$gis = [
    'api',
    'arcgis',
    'arcmap',
    'arcpy',
    'area',
    'coordinate',
    'distance',
    'east',
    'esri',
    'geo',
    'geometr',
    'geoserver',
    'gis',
    'google',
    'line',
    'map',
    'north',
    'openlayer',
    'point',
    'polygon',
    'postgis',
    'qgis',
    'raster',
    'server',
    'south',
    'spatial',
    'tile',
    'vector',
    'west',
    'wfs',
    'wms'
];

$mathematica = [
    '3d',
    'calcul',
    'comput',
    'diff',
    'equation',
    'express',
    'function',
    'graph',
    'integral',
    'limit',
    'mathematica',
    'matrix',
    'numeric',
    'pattern',
    'plot',
    'point',
    'problem',
    'rearrang',
    'remain',
    'set',
    'solv',
    'stringmatch',
    'value'
];

$photo = [
    '50mm',
    'af',
    'aperture',
    'body',
    'camera',
    'canon',
    'color',
    'digital',
    'dslr',
    'ef',
    'effect',
    'eos',
    'exposure',
    'film',
    'flash',
    'focus',
    'image',
    'iso',
    'kit',
    'lens',
    'light',
    'lightroom',
    'look',
    'macro',
    'manual',
    'mode',
    'nikon',
    'photo',
    'photograph',
    'picture',
    'processing',
    'quality',
    'raw',
    'sensor',
    'shoot',
    'shooting',
    'shot',
    'shutter',
    'speed',
    'take',
    'taken',
    'white',
    'zoom'
];

$scifi = [
    'avada kedavra',
    'avenger',
    'batman',
    'basilisk',
    'book',
    'character',
    'children',
    'creatur',
    'cryogenic',
    'doctor',
    'dr.',
    'earth',
    'episode',
    'fantasy',
    'film',
    'gandalf',
    'harry',
    'hermione',
    'human',
    'korra',
    'lannister',
    'lord',
    'luke',
    'magic',
    'man',
    'monster',
    'movie',
    'murder',
    'novel',
    'people',
    'planet',
    'potter',
    'power',
    'r2d2',
    'scifi',
    'season',
    'serie',
    'show',
    'space',
    'star',
    'stor',
    'superman',
    'trek',
    'tv',
    'universe',
    'vader',
    'victim',
    'voldemort',
    'witch',
    'wizard',
    'wolverine',
    'year'
];

$security = [
    'access',
    'address',
    'anonym',
    'application',
    'attack',
    'authentication',
    'certificate',
    'client',
    'computer',
    'data',
    'database',
    'email',
    'encrypted',
    'encryption',
    'file',
    'filter',
    'hash',
    'infect',
    'information',
    'ip',
    'login',
    'network',
    'password',
    'private',
    'public',
    'secure',
    'security',
    'server',
    'service',
    'site',
    'software',
    'ssl',
    'traffic',
    'vulnerab',
    'web',
    'website',
    'windows',
    'xss'
];

$unix = [
    'bash',
    'bin',
    'boot',
    'centos',
    'command',
    'debian',
    'director',
    'disk',
    'drive',
    'echo',
    'etc',
    'fedora',
    'kernel',
    'linux',
    'local',
    'log',
    'make',
    'network',
    'package',
    'partition',
    'password',
    'process',
    'read',
    'root',
    'run',
    'running',
    'script',
    'server',
    'session',
    'shell',
    'ssh',
    'sudo',
    'system',
    'terminal',
    'ubuntu'
];

$wordpress = [
    'admin',
    'blog',
    'categor',
    'comment',
    'content',
    'custom',
    'database',
    'domain',
    'form',
    'galler',
    'link',
    'loop',
    'menu',
    'meta',
    'page',
    'php',
    'plugin',
    'post',
    'single',
    'tag',
    'taxonom',
    'template',
    'theme',
    'title',
    'upload',
    'url',
    'user',
    'website',
    'wordpress',
    'wp'
];

# Used only for analysis purposes, not need for the challenge
function analyze($fp, $n)
{
    $o = file_get_contents('StackExchangeQuestionClassifier/output00.txt');
    $o = explode("\n", $o);
    $t = [];
    for ($i = 0; $i < $n; $i++) {
        $json = json_decode(fgets($fp));
        $questions = [];
        preg_match_all("/\b[a-zA-Z0-9]{2,}\b/", $json->question, $questions);
        foreach ($questions as $q1) {
            foreach ($q1 as $q2) {
                if (empty($t[$o[$i]][$q2])) {
                    $t[$o[$i]][$q2] = 0;
                }
                $t[$o[$i]][$q2]++;
            }
        }
        $excerpts = [];
        preg_match_all("/\b[a-zA-Z0-9]{2,}\b/", $json->excerpt, $excerpts);
        foreach ($excerpts as $q1) {
            foreach ($q1 as $q2) {
                if (empty($t[$o[$i]][$q2])) {
                    $t[$o[$i]][$q2] = 0;
                }
                $t[$o[$i]][$q2]++;
            }
        }
    }

    foreach ($t as $k1 => $v) {
        foreach ($v as $k2 => $w) {
            if ($w < 50) {
                unset($t[$k1][$k2]);
            }
        }
    }

    foreach ($t as $k => $v) {
        file_put_contents("StackExchangeQuestionClassifier/{$k}.txt", json_encode($v));
    }
}

$fp = fopen('php://stdin', 'r');
$n = fgets($fp);

for ($i = 0; $i < $n; $i++) {
    $json = fgets($fp);
    $o = [];
    foreach ($topics as $topic) {
        foreach ($$topic as $s) {
            $p = 0;
            while (($p = strpos(strtolower($json), $s, $p + 1)) !== false) {
                if (empty($o[$topic])) {
                    $o[$topic] = 0;
                }

                $o[$topic]++;
            }
        }
    }

    if (count($o) == 0) {
        $max = array_rand($topics); 
    } else {
        $max = array_keys($o, max($o))[0];
    }
        
    echo "$max\n";
}
?>
