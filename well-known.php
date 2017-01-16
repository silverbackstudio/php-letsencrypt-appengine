<?php 
use google\appengine\api\cloud_storage\CloudStorageTools;

define('WELL_KNOWN_BUCKET',  CloudStorageTools::getDefaultGoogleStorageBucketName() );
define('WELL_KNOWN_FOLDER',  '.well-known/');

$matches = array();

if(preg_match('@/\.well-known/(.*)@', $_SERVER['REQUEST_URI'], $matches) && !empty($matches[1])){
    $file_path = CloudStorageTools::getFilename(WELL_KNOWN_BUCKET, WELL_KNOWN_FOLDER.$matches[1]);
}

if( file_exists($file_path) ){
        CloudStorageTools::serve($file_path);
} else {
    header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
    echo 'Not Found';
    exit;
}
