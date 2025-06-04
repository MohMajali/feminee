<?php

include "../Connect.php";

$B_ID = $_SESSION['B_ID'];

use PHPMailer\PHPMailer\PHPMailer;

require '../phpmailer/src/Exception.php';
require '../phpmailer/src/PHPMailer.php';
require '../phpmailer/src/SMTP.php';

$buyer_id = $_GET['B_ID'];

$cart = [];

$cartSql = mysqli_query($con, "SELECT * from carts WHERE buyer_id = '$buyer_id'");

$totalPrice = 0;

while ($cartRow = mysqli_fetch_array($cartSql)) {

    $product_id = $cartRow['product_id'];
    $qty        = $cartRow['qty'];

    $productSql = mysqli_query($con, "SELECT seller_id, price from products WHERE id = '$product_id'");
    $productRow = mysqli_fetch_array($productSql);

    $seller_id = $productRow['seller_id'];

    $price = $productRow['price'];

    $totalPrice += ($price * $qty);

    $cart[$seller_id][] = [
        'cart_id'    => $cartRow['id'],
        'product_id' => $cartRow['product_id'],
        'seller_id'  => $seller_id,
        'price'      => $price,
        'options'    => $cartRow['options'],
        'qty'        => $cartRow['qty'],
    ];

}

foreach ($cart as $sellerId => $list) {

    $stmt = $con->prepare("INSERT INTO orders (buyer_id, total_price, seller_id) VALUES (?, ?, ?) ");

    $stmt->bind_param("idi", $buyer_id, $totalPrice, $sellerId);

    if ($stmt->execute()) {

        $order_id = $stmt->insert_id;

        foreach ($list as $item) {

            $product_id    = $item['product_id'];
            $options       = $item['options'];
            $qty           = $item['qty'];
            $cart_id       = $item['cart_id'];
            $product_price = $item['price'];

            $orderItemStmt = $con->prepare("INSERT INTO order_items (order_id, seller_id, product_id, option_id, quantity, product_price) VALUES (?, ?, ?, ?, ?, ?)");

            $orderItemStmt->bind_param("iiisid", $order_id, $sellerId, $product_id, $options, $qty, $product_price);

            if ($orderItemStmt->execute()) {

                $productStmt = $con->prepare("SELECT qty AS product_qty FROM products WHERE id = ?");
                $productStmt->bind_param("i", $product_id);

                $productStmt->execute();

                $productStmt->store_result();

                if ($productStmt->num_rows > 0) {

                    $productStmt->bind_result($product_qty);
                    $productStmt->fetch();

                    $newQty = $product_qty - $item['qty'];
                    $active = $newQty == 0 ? 0 : 1;

                    $updateProductStmt = $con->prepare("UPDATE products SET qty = ?, active = ? WHERE id = ?");

                    $updateProductStmt->bind_param("iii", $newQty, $active, $product_id);

                    if ($updateProductStmt->execute()) {

                        $DeleteFromCartStmt = $con->prepare("DELETE FROM carts WHERE id = ?");

                        $DeleteFromCartStmt->bind_param("i", $cart_id);
                        $DeleteFromCartStmt->execute();

                        $sellersSql = mysqli_query($con, "select * from users where id='$sellerId'");
                        $sellerRow  = mysqli_fetch_array($sellersSql);

                        $sellerEmail = $sellerRow['email'];

                        $buyerSql = mysqli_query($con, "select * from users where id='$buyer_id'");
                        $buyerRow = mysqli_fetch_array($buyerSql);

                        $buyerName  = $buyerRow['name'];
                        $buyerEmail = $buyerRow['email'];

                        try {

                            $mail = new PHPMailer(true);

                            $mail->isSMTP();
                            $mail->Host       = 'smtp.gmail.com';
                            $mail->SMTPAuth   = true;
                            $mail->Username   = 'femineeproject@gmail.com';
                            $mail->Password   = 'whunewnggqjhqyoa';
                            $mail->SMTPSecure = 'ssl';
                            $mail->Port       = 465;

                            $mail->setFrom($buyerEmail);
                            $mail->addAddress($sellerEmail);

                            $mail->Subject = "Order Request";
                            $mail->Body    = "A Request From {$buyerName}";

                            $mail->send();

                        } catch (Exception $e) {

                            echo $e->getMessage();
                            die;
                        }

                    }
                }
            }
        }

    }
}

echo "<script language='JavaScript'>
alert ('Thank you for dealing with Feminee, Your Order Has Been Placed !');
</script>";

echo "<script language='JavaScript'>
document.location='./Orders.php';
</script>";