<?php
session_start();

include "../Connect.php";

$products = [];

$category_id = $_GET['category_id'];
$price = $_GET['price'];

$sql = "SELECT products.id, products.name, products.price, products.description, products.image,
categories.name AS category_name

from products
INNER JOIN categories ON categories.id = products.category_id
WHERE products.active = 1";

if ($category_id) {

    $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
    categories.name AS category_name

    from products
    INNER JOIN categories ON categories.id = products.category_id
    WHERE products.active = 1 AND products.category_id = '$category_id'";

}

if ($price) {

    $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
    categories.name AS category_name

    from products
    INNER JOIN categories ON categories.id = products.category_id
    WHERE products.active = 1 AND products.price >= '$price'";

}

$sql1 = mysqli_query($con, $sql);

while ($row1 = mysqli_fetch_array($sql1)) {

    $products[] = [
        'id'            => $row1['id'],
        'name'          => $row1['name'],
        'price'         => $row1['price'],
        'description'   => $row1['description'],
        'image'         => $row1['image'],
        'category_name' => $row1['category_name'],
    ];
}

echo json_encode($products);
