<?php
include "../Connect.php";
session_start();

$response = [
    "error" => false,
];

if (isset($_GET['buyer_id']) && isset($_GET['product_id'])) {

    $buyer_id = ($_GET['buyer_id']);
    $product_id = ($_GET['product_id']);

    $query = mysqli_query($con, "SELECT * FROM favorites WHERE product_id ='$product_id' AND buyer_id = '$buyer_id'");

    if (mysqli_num_rows($query) > 0) {

        $response['error'] = true;
        $response['message'] = 'Already in favorites';

    } else {

        $stmt = $con->prepare("INSERT INTO favorites (buyer_id, product_id) VALUES (?, ?)");

        $stmt->bind_param("ii", $buyer_id, $product_id);

        if ($stmt->execute()) {

            $response['error'] = false;

        } else {
            $response['error'] = true;
        }
    }

} else {

    $response['error'] = true;
}

echo json_encode($response);
