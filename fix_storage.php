<?php

$target = __DIR__.'/storage/app/public';
$link = __DIR__.'/public/storage';

if (file_exists($link) || is_link($link)) {
    unlink($link);
}

if (symlink($target, $link)) {
    echo 'Symlink created: public/storage -> storage/app/public<br>';
} else {
    echo 'Symlink failed. Trying copy...<br>';
    exec("cp -r $target $link 2>&1", $output, $returnCode);
    if ($returnCode === 0) {
        echo 'Files copied to public/storage<br>';
    } else {
        echo 'Copy also failed. You may need to set permissions manually.<br>';
        echo implode('<br>', $output);
    }
}

echo '<br>Now run: php artisan basset:cache && php artisan optimize:clear && php artisan config:cache && php artisan route:cache && php artisan view:cache';
echo "<br><br><strong style='color:red'>DELETE THIS FILE (fix_storage.php) IMMEDIATELY AFTER RUNNING!</strong>";
