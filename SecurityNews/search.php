<?php
header('Content-Type: application/json');

$search = isset($_POST['titre']) ? trim(stripslashes($_POST['titre'])) : '';

if ($search === '') {
    echo json_encode(['error' => 'Empty search term.']);
    exit;
}

$connexion = new PDO('mysql:host=127.0.0.1;dbname=SecurityNews', 'admin', 'admin');
$requete = $connexion->query("SELECT * FROM articles WHERE titre LIKE '%" . $search . "%'");
$results = $requete->fetchAll(PDO::FETCH_ASSOC);
$requete->closeCursor();

echo json_encode($results);
