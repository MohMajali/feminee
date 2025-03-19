<?php
    session_start();

    include "../Connect.php";

    $B_ID = $_SESSION['B_ID'];

    if ($B_ID) {

        $sql211 = mysqli_query($con, "SELECT COUNT(id) AS cart_count FROM carts WHERE buyer_id = '$B_ID'");
        $row211 = mysqli_fetch_array($sql211);

        $cart_count = $row211['cart_count'];
    }

?>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Feminee</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
    <link href="../assets/img/Logo.png" rel="icon" />
    <link href="../assets/img/Logo.png" rel="apple-touch-icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.php" class="navbar-brand"><h1 class="text-primary display-6">Feminee</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.php" class="nav-item nav-link ">Home</a>
                            <a href="Products.php" class="nav-item nav-link">Products</a>
                            <a href="Sellers.php" class="nav-item nav-link">Sellers</a>
                            <a href="Offers.php" class="nav-item nav-link">Offers</a>
                            <a href="contact.php" class="nav-item nav-link">Contact</a>
                            <?php if ($B_ID) {?>
                                <a href="Orders.php" class="nav-item nav-link active">Orders</a>
                            <?php }?>
<?php if (! $B_ID) {?>
                            <a href="../Login.php" class="nav-item nav-link">Login</a>
                            <?php }?>
                        </div>
                        <?php if ($B_ID) {?>

<div class="d-flex m-3 me-0">
    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
    <a href="./Cart.php" class="position-relative me-4 my-auto">
        <i class="fa fa-shopping-bag fa-2x"></i>
        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;"><?php echo $cart_count ?></span>
    </a>
    <a href="./Profile.php" class="my-auto">
        <i class="fas fa-user fa-2x"></i>
    </a>
</div>

<?php }?>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <form class="w-75 mx-auto d-flex" action="./Products.php" method="POST">
                                <input type="search" class="form-control p-3" name="product_name" placeholder="product name" aria-describedby="search-icon-1">
                                <button type="submit" id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Orders</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="./index.php">Home</a></li>
                <li class="breadcrumb-item active text-white">Orders</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Seller Name</th>
                            <th scope="col">Offer</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Options</th>
                            <th scope="col">Total</th>
                            <th scope="col">Status</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>

                        <?php
                            $sql33 = mysqli_query($con, "SELECT * from orders WHERE buyer_id = '$B_ID'");

                            $totalPrice = 0;

                            while ($row33 = mysqli_fetch_array($sql33)) {

                                $order_id    = $row33['id'];
                                $offer_id    = $row33['offer_id'];
                                $status_id   = $row33['status_id'];
                                $total_price = $row33['total_price'];

                                $sql55 = mysqli_query($con, "SELECT product_id, seller_id, option_id, quantity from order_items WHERE order_id = '$order_id'");
                                $row55 = mysqli_fetch_array($sql55);

                                $product_id = $row55['product_id'];
                                $seller_id  = $row55['seller_id'];
                                $options    = json_decode($row55['option_id'], true);
                                $color_id   = $options['color_id'];
                                $size_id    = $options['size_id'];
                                $quantity   = $row55['quantity'];

                                $sql66 = mysqli_query($con, "SELECT name AS product_name, image AS product_image, price AS product_price from products WHERE id = '$product_id'");
                                $row66 = mysqli_fetch_array($sql66);

                                $product_name  = $row66['product_name'];
                                $product_image = $row66['product_image'];
                                $product_price = $row66['product_price'];

                                $sql77 = mysqli_query($con, "SELECT name AS seller_name from users WHERE id = '$seller_id'");
                                $row77 = mysqli_fetch_array($sql77);

                                $seller_name = $row77['seller_name'];

                                $sql88 = mysqli_query($con, "SELECT name AS status_name from statuses WHERE id = '$status_id'");
                                $row88 = mysqli_fetch_array($sql88);

                                $status_name = $row88['status_name'];

                                $sql99 = mysqli_query($con, "SELECT title from offers WHERE id = '$offer_id'");
                                $row99 = mysqli_fetch_array($sql99);

                                $offer_title = $row99['title'];

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

                                $totalPrice += ($product_price * $quantity);

                            ?>

                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="../Seller_Dashboard/<?php echo $product_image ?>" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $seller_name ?></p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $offer_title ?></p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $product_name ?></p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $product_price ?> JODs</p>
                                </td>
                                <td>
                                <p class="mb-0 mt-4"><?php echo $quantity ?></p>
                                </td>
                                <td>
                                <p class="mb-0 mt-4"><?php echo $color_value . ' ' . $size_value ?></p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $offer_id ? $total_price : ($product_price * $quantity) ?> JODs</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><?php echo $status_name ?></p>
                                </td>
                                <td>


                                <?php if ($status_id == 1) {?>

                                    <a href="./CancelOrder.php?order_id=<?php echo $order_id ?>" class="btn btn-md rounded-circle bg-light border mt-4 delete-btn" >
                                        <i class="fa fa-times text-danger"></i>
                                    </a>
                                    <?php } else if ($status_id == 3) {?>
                                        <a href="./Rate-Form.php?seller_id=<?php echo $seller_id ?>&product_id=<?php echo $product_id ?>" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Rate</a>
                                    </a>
                                    <?php }?>



                                </td>

                            </tr>


<?php }?>

                        </tbody>
                    </table>
                </div>


            </div>
        </div>
        <!-- Cart Page End -->


        <!-- Footer Start -->
            <?php require './Footer.php'?>
        <!-- Footer End -->




        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>





    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    </body>

</html>