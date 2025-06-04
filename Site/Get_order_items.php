<?php

session_start();

include "../Connect.php";

$B_ID     = $_SESSION['B_ID'];
$order_id = $_GET['order_id'];

$response = [];

$sql33 = mysqli_query($con, "SELECT product_id, option_id, quantity, product_price from order_items WHERE order_id = '$order_id'");

while ($row33 = mysqli_fetch_array($sql33)) {

    $product_id    = $row33['product_id'];
    $options       = json_decode($row33['option_id'], true);
    $color_id      = $options['color_id'];
    $size_id       = $options['size_id'];
    $quantity      = $row33['quantity'];
    $product_price = $row33['product_price'];

    $sql66 = mysqli_query($con, "SELECT name AS product_name, image AS product_image from products WHERE id = '$product_id'");
    $row66 = mysqli_fetch_array($sql66);

    $product_name  = $row66['product_name'];
    $product_image = $row66['product_image'];

    if ($color_id != '') {

        $sql66 = mysqli_query($con, "SELECT value from product_options WHERE id = '$color_id'");
        $row66 = mysqli_fetch_array($sql66);

        $color_value = $row66['value'];
    }

    if ($size_id != '') {

        $sql77 = mysqli_query($con, "SELECT value from product_options WHERE id = '$size_id'");
        $row77 = mysqli_fetch_array($sql77);

        $size_value = $row77['value'];

    }

    $response[] = [
        "product_id"    => $product_id,
        "prroduct_name" => $product_name,
        "product_image" => $product_image,
        "color_value"   => $color_value,
        "size_value"    => $size_value,
        "price"         => $product_price,
        "qty"           => $quantity,
    ];

}

echo json_encode($response);