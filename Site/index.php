<?php
    session_start();

    include "../Connect.php";

    $B_ID = $_SESSION['B_ID'];

    if ($B_ID) {

        $sql1 = mysqli_query($con, "SELECT COUNT(id) AS cart_count FROM carts WHERE buyer_id = '$B_ID'");
        $row1 = mysqli_fetch_array($sql1);

        $cart_count = $row1['cart_count'];
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

        <style>

            .love-icon {
                position: absolute;
                top: 10px;
                right: 10px;
                color: red;
                z-index: 10;
                font-size: 20px;
            }

            .not-fav {

                position: absolute;
                top: 10px;
                right: 10px;
                color: white;
                z-index: 10;
                font-size: 20px;
            }
    </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
    
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                <a href="index.php" class="navbar-brand">
                        <img src="../assets/img/Logo.png" class="img-fluid" alt="" style="height: 70px; width:70px;">
                        <p class="p-0 m-0">Feminee</p>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.php" class="nav-item nav-link active">Home</a>
                            <a href="Products.php" class="nav-item nav-link">Products</a>
                            <a href="Sellers.php" class="nav-item nav-link">Sellers</a>
                            <a href="Offers.php" class="nav-item nav-link">Offers</a>
                            <?php if ($B_ID) {?>
                                <a href="Favorites.php" class="nav-item nav-link">Favorites</a>
                                <?php }?>
                            <?php if ($B_ID) {?>
                                <a href="Orders.php" class="nav-item nav-link">Orders</a>
                            <?php }?>
<?php if (! $B_ID) {?>
                            <a href="../Login.php" class="nav-item nav-link">Login</a>
                            <?php } else {?>
                                <a href="./Logout.php" class="nav-item nav-link">Logout</a>
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


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header" style="background-color: #ffc1ccd4;">
  <div class="container py-5">
    <div class="row g-5 align-items-center">
      <div class="col-12">
        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
          <div class="carousel-inner">
          <?php
                                $sql1 = mysqli_query($con, "SELECT * from users WHERE active = 1 and user_type_id = 2");

                                $counter = 0;
                                while ($row1 = mysqli_fetch_array($sql1)) {

                                    $seller_id_carousel   = $row1['id'];
                                    $sellerName_coursel   = $row1['name'];
                                    $sellerImage_carousel = $row1['image'];
                                    $sellerdescription_carousel = $row1['description'];

                                    $isActive = $counter === 0 ? 'active' : '';
                                    $counter++;

                                ?>


<div class="carousel-item <?= $isActive ?>" id="<?= $seller_id_carousel ?>" onclick="onClick(<?= $seller_id_carousel ?>)">
  <div class="row gx-0 align-items-stretch">
    <!-- Image column -->
     <div class="col-md-1"></div>
    <div class="col-md-4">
      <img
        src="../Seller_Dashboard/<?= $sellerImage_carousel ?>"
        class="img-fluid  h-100 object-fit-cover rounded-start"
        alt="<?= htmlspecialchars($sellerName_coursel) ?>"
      >
    </div>
    <!-- Text column -->
    <div class="col-md-6 d-flex text-center">
      <div class="p-3 border rounded flex-fill">
        <h5 class="mb-2 mt-3"><?= htmlspecialchars($sellerName_coursel) ?></h5>
        <p class="mb-0"><?= htmlspecialchars($sellerdescription_carousel) ?></p>
      </div>
    </div>
    
    <div class="col-md-1"></div>
  </div>
</div>
            <?php } ?>
          </div>
          <button class="carousel-control-prev" type="button"
          data-bs-target="#carouselId" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button"
          data-bs-target="#carouselId" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
          <!-- controls… -->
        </div>
      </div>
    </div>
  </div>
</div>
        <!-- Hero End -->
        <script>
        const onClick = (id) => {

            console.log(id);

            document.location = `./Seller.php?seller_id=${id}`
        }
    </script>

        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">

                    <div class="col-md-6 col-lg-4">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle background-sec mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Security Payment</h5>
                                <p class="mb-0">100% security payment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle background-sec mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>30 Day Return</h5>
                                <p class="mb-0">30 day money guarantee</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle background-sec mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>24/7 Support</h5>
                                <p class="mb-0">Support every time fast</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Best Products</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                            <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">All Products</span>
                                    </a>
                                </li>
                            <?php
                                $sql1 = mysqli_query($con, "SELECT * from categories WHERE active = 1");

                                while ($row1 = mysqli_fetch_array($sql1)) {

                                    $category_id   = $row1['id'];
                                    $category_name = $row1['name'];

                                ?>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-<?php echo $category_id + 1 ?>">
                                        <span class="text-dark" style="width: 130px;"><?php echo $category_name ?></span>
                                    </a>
                                </li>
<?php }?>

                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">

                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    <?php
                                        $sql1 = mysqli_query($con, "SELECT * from products WHERE active = 1 AND total_rate >= 3.5");

                                        while ($row1 = mysqli_fetch_array($sql1)) {

                                            $product_id          = $row1['id'];
                                            $seller_id           = $row1['seller_id'];
                                            $category_id         = $row1['category_id'];
                                            $product_name        = substr($row1['name'], 0, 10) . '...';
                                            $product_description = $row1['description'];
                                            $product_image       = $row1['image'];
                                            $product_price       = $row1['price'];
                                            $active              = $row1['active'];
                                            $created_at          = $row1['created_at'];

                                            $sellerSql = mysqli_query($con, "SELECT * FROM users WHERE id = '$seller_id'");
                                            $sellerRow = mysqli_fetch_array($sellerSql);

                                            $sellerName = $sellerRow['name'];

                                            $categorySql = mysqli_query($con, "SELECT * FROM categories WHERE id = '$category_id'");
                                            $categoryRow = mysqli_fetch_array($categorySql);

                                            $categoryName = $categoryRow['name'];

                                            if ($B_ID) {

                                                $favSql = mysqli_query($con, "SELECT * FROM favorites WHERE product_id = '$product_id' AND buyer_id = '$B_ID'");
                                                $favRow = mysqli_fetch_array($favSql);

                                                $isFavorite = $favRow['active'];
                                            }

                                        ?>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item position-relative">
                                                <?php if ($B_ID) {?>
                                            <i id="icon-<?php echo $product_id ?>" onclick="addToFav(<?php echo $B_ID ?>,<?php echo $product_id ?>)" class="<?php echo $isFavorite ? 'fa fa-heart love-icon' : 'fa fa-heart not-fav' ?>"></i>
                                            <?php }?>

                                                <div class="fruite-img">
                                                    <img src="../Seller_Dashboard/<?php echo $product_image ?>" class="img-fluid w-100 rounded-top" alt="" style="height: 220px;">
                                                </div>
                                                <div class="text-white background-sec px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><?php echo $categoryName ?></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><?php echo $product_name ?></h4>
                                                    <p><?php echo substr($product_description, 0, 10) . '.....' ?></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><?php echo $product_price ?> JODs</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                      <?php }?>

                                    </div>
                                </div>
                            </div>
                        </div>




                        <?php
                            $categoryTabSql = mysqli_query($con, "SELECT * from categories WHERE active = 1");

                            while ($categoryTabRow = mysqli_fetch_array($categoryTabSql)) {

                                $category_id_tab   = $categoryTabRow['id'];
                                $category_name_tab = $categoryTabRow['name'];

                            ?>

                        <div id="tab-<?php echo $category_id_tab + 1 ?>" class="tab-pane fade show p-0">

                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    <?php
                                        $productTabSql = mysqli_query($con, "SELECT * from products WHERE active = 1 AND category_id = '$category_id_tab' AND total_rate >= 3.5");

                                            while ($productTabRow = mysqli_fetch_array($productTabSql)) {

                                                $product_id              = $productTabRow['id'];
                                                $seller_id_tab           = $productTabRow['seller_id'];
                                                $product_name_tab        = substr($productTabRow['name'], 0, 10) . '...';
                                                $product_description_tab = $productTabRow['description'];
                                                $product_image_tab       = $productTabRow['image'];
                                                $product_price_tab       = $productTabRow['price'];
                                                $active_tab              = $productTabRow['active'];
                                                $created_at_tab          = $productTabRow['created_at'];

                                                $sellerSqlTab = mysqli_query($con, "SELECT * FROM users WHERE id = '$seller_id'");
                                                $sellerRowTab = mysqli_fetch_array($sellerSqlTab);

                                                $sellerNameTab = $sellerRowTab['name'];

                                            ?>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">

                                                <div class="fruite-img">
                                                    <img src="../Seller_Dashboard/<?php echo $product_image_tab ?>" class="img-fluid w-100 rounded-top" alt="" style="height: 220px;">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><?php echo $category_name_tab ?></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><?php echo $product_name_tab ?></h4>
                                                    <p><?php echo substr($product_description_tab, 0, 10) . '.....' ?></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><?php echo $product_price_tab ?> JODs</p>
                                                        <a href="./Product.php?" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
<?php }?>

                                    </div>
                                </div>
                            </div>
                        </div>
<?php }?>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->





        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0">Best Sellers</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">

                <?php
                    $sql1 = mysqli_query($con, "SELECT * from users WHERE user_type_id = 2 AND total_rate >= 3.5 AND active = 1");

                    while ($row1 = mysqli_fetch_array($sql1)) {

                        $seller_id          = $row1['id'];
                        $seller_name        = $row1['name'];
                        $seller_email       = $row1['email'];
                        $seller_description = $row1['description'];
                        $seller_image       = $row1['image'];

                    ?>
                    <div class="border border-primary rounded position-relative vesitable-item">
                        <div class="vesitable-img">
                            <img src="../Seller_Dashboard/<?php echo $seller_image ?>" class="img-fluid w-100 rounded-top" alt="" style="height: 220px;">
                        </div>
                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;"></div>
                        <div class="p-4 rounded-bottom">
                            <h4><?php echo $seller_name ?></h4>
                            <p><?php echo substr($seller_description, 0, 10) . '....' ?></p>
                            <div class="d-flex justify-content-between flex-lg-wrap">
                                <p class="text-dark fs-5 fw-bold mb-0"></p>
                                <a href="./Seller.php?seller_id=<?php echo $seller_id ?>" class="btn border border-secondary rounded-pill px-3 text-primary"> View Seller</a>
                            </div>
                        </div>
                    </div>
                    <?php
                    }?>


                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->


        <!-- Banner Section Start-->
        <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <div class="py-4">
                            <h1 class="display-3 text-white">FEMMINEE</h1>
                            <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                            <p class="mb-4 text-dark">We sell fresh products thats made with love.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="position-relative">
                            <img src="./img/banner1.png" class="img-fluid w-100 rounded" alt="">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->




        <!-- Fact Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users secondry-text"></i>
                                <h4>satisfied customers</h4>
                                <h1>1963</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users secondry-text"></i>
                                <h4>quality of service</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users secondry-text"></i>
                                <h4>quality certificates</h4>
                                <h1>33</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users secondry-text"></i>
                                <h4>Available Products</h4>
                                <h1>789</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fact Start -->





        <!-- Footer Start -->
         <?php require './Footer.php'; ?>
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

    <script>
        const addToFav = (customerId, productId) => {




fetch(`./AddToFavorite.php?buyer_id=${customerId}&product_id=${productId}`)
.then((response) => response.json())
.then(data => {



    if (!data["error"]) {


        document.getElementById(`icon-${productId}`).classList.remove('fa', 'fa-heart', 'not-fav');
        document.getElementById(`icon-${productId}`).classList.add('fa', 'fa-heart', 'love-icon');




    } else {


        alert(data['message'])

    }


})

}
    </script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    </body>

</html>