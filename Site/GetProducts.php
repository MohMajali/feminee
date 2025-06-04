<?php
// session_start();

// include "../Connect.php";

// $products = [];

// $category_id     = $_GET['category_id'];
// $sub_category_id = $_GET['sub_category_id'];
// $product_name    = $_GET['product_name'];
// $price           = $_GET['price'];
// $filter          = $_GET['filter'];
// $rating          = $_GET['rating'];
// $min             = $_GET['min'];
// $max             = $_GET['max'];

// $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
// categories.name AS category_name

// from products
// INNER JOIN categories ON categories.id = products.category_id
// WHERE products.active = 1";

// if ($filter === 'popularity') {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
// categories.name AS category_name

// from products
// INNER JOIN categories ON categories.id = products.category_id
// WHERE products.active = 1
// ORDER BY products.total_rate DESC
// ";
// } else if ($filter === 'price') {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1
//     ORDER BY products.price DESC
//     ";
// }

// if ($category_id) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.category_id = '$category_id'";

// }

// if ($product_name) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.name LIKE '%$product_name%'";

// }

// if ($sub_category_id) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.sub_category_id
//     WHERE products.active = 1 AND products.sub_category_id = '$sub_category_id'";

// }

// if ($price) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.price >= '$price'";

// }

// if ($rating) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.total_rate = '$rating'";
// }

// if ($min && $max) {


//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.price >= '$min' AND products.price <= '$max'";


// } else if ($min) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.price >= '$min'";
// } else if ($max) {

//     $sql = "SELECT products.id, products.name, products.price, products.description, products.image,
//     categories.name AS category_name

//     from products
//     INNER JOIN categories ON categories.id = products.category_id
//     WHERE products.active = 1 AND products.price <= '$max'";
// }

// $sql1 = mysqli_query($con, $sql);

// while ($row1 = mysqli_fetch_array($sql1)) {

//     $products[] = [
//         'id'            => $row1['id'],
//         'name'          => $row1['name'],
//         'price'         => $row1['price'],
//         'description'   => $row1['description'],
//         'image'         => $row1['image'],
//         'category_name' => $row1['category_name'],
//     ];
// }

// echo json_encode($products);





session_start();
header('Content-Type: application/json');

include "../Connect.php";

$category_id     = isset($_GET['category_id'])     && is_numeric($_GET['category_id'])     ? intval($_GET['category_id'])     : null;
$sub_category_id = isset($_GET['sub_category_id']) && is_numeric($_GET['sub_category_id']) ? intval($_GET['sub_category_id']) : null;
$product_name    = isset($_GET['product_name'])    && strlen(trim($_GET['product_name']))      ? trim($_GET['product_name'])    : null;
$filter          = isset($_GET['filter'])          && strlen(trim($_GET['filter']))            ? trim($_GET['filter'])      : null;
$rating          = isset($_GET['rating'])          && is_numeric($_GET['rating'])             ? floatval($_GET['rating'])   : null;
$min             = isset($_GET['min'])             && is_numeric($_GET['min'])                ? floatval($_GET['min'])      : null;
$max             = isset($_GET['max'])             && is_numeric($_GET['max'])                ? floatval($_GET['max'])      : null;

$sql = "
SELECT
    p.id,
    p.name,
    p.price,
    p.description,
    p.image,
    c.name AS category_name
FROM products p
INNER JOIN categories c ON c.id = p.category_id
";

$conditions = ["p.active = 1"];
$params     = [];

if ($category_id !== null) {
    $conditions[] = "p.category_id = ?";
    $params[]     = $category_id;
}
if ($sub_category_id !== null) {
    $conditions[] = "p.sub_category_id = ?";
    $params[]     = $sub_category_id;
}
if ($product_name !== null) {
    $conditions[] = "p.name LIKE ?";
    $params[]     = "%{$product_name}%";
}
if ($rating !== null) {
    $conditions[] = "p.total_rate = ?";
    $params[]     = $rating;
}
if ($min !== null) {
    $conditions[] = "p.price >= ?";
    $params[]     = $min;
}
if ($max !== null) {
    $conditions[] = "p.price <= ?";
    $params[]     = $max;
}

$orderBy = "";
if ($filter === 'popularity') {
    $orderBy = " ORDER BY p.total_rate DESC";
} elseif ($filter === 'price') {
    $orderBy = " ORDER BY p.price DESC";
}

$sql .= " WHERE " . implode(' AND ', $conditions) . $orderBy;

$stmt = mysqli_prepare($con, $sql);
if ($stmt) {
    if (!empty($params)) {
        $types = str_repeat('s', count($params));
        mysqli_stmt_bind_param($stmt, $types, ...$params);
    }
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    $products = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $products[] = $row;
    }

    echo json_encode($products);
    exit;
}

http_response_code(500);
echo json_encode(["error" => "Database query failed: " . mysqli_error($con)]);
exit;
