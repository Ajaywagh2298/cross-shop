<?php
require_once('auth.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>CURE GROCERY</title>
	
	<link rel="shortcut icon" href="logo.jpg">
	<!-- Bootstrap Core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Morris Charts CSS -->
	<link href="vendor/morrisjs/morris.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


	<link href="css/bootstrap-datepicker.min.css" rel="stylesheet">

	<link href="js/datepicker.js" rel="stylesheet">

	<link href="js/bootstrap-datepicker.min.js" rel="stylesheet">
	
	<link href="src/facebox.css" media="screen" rel="stylesheet" type="text/css" />
	<script src="lib/jquery.js" type="text/javascript"></script>
	<script src="src/facebox.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('a[rel*=facebox]').facebox({
				loadingImage : 'src/loading.gif',
				closeImage   : 'src/closelabel.png'
			})
		})
	</script>


</head>

<body>

	<div id="wrapper">
		
		<?php include('navfixed.php');?>


		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Welcome:<strong> <?php echo $session_cashier_name; ?></strong></h1>
				</div>

				<!-- /.col-lg-12 -->
			</div>

        <div id="orayt">
            <a class="list-group-item">
                <?php
                function formatMoney($number, $fractional=false) {
                    if ($fractional) {
                        $number = sprintf('%.2f', $number);
                    }
                    while (true) {
                        $replaced = preg_replace('/(-?\d+)(\d\d\d)/', '$1,$2', $number);
                        if ($replaced != $number) {
                            $number = $replaced;
                        } else {
                            break;
                        }
                    }
                    return $number;
                }
                ?>

                <?php
                include('connect.php');
                $today = date('d-M-Y');
                $sql = "SELECT sum(amount) FROM sales WHERE date = ?";
                $query = $db->prepare($sql);
                $query->execute(array($today)) or die ("Data Not Found !");
                $fetch = $query->fetchAll();

                foreach ($fetch as $key => $value) {
                    $data = $value['sum(amount)'];
                }
                $json = json_encode($data);
                ?>

                <?php echo "<font style = 'color:black;'>Total Sales For Today:  </font>";

                echo  $today;  ?>

            </a>
            <a class="list-group-item" href ="view_productqty.php">
                Re-Order<span class="badge">
						<?php
                        include('connect.php');
                        $result = $db->prepare("SELECT * FROM products where qty_left < 50 ORDER BY product_id DESC");
                        $result->execute();
                        $rowcount = $result->rowcount();
                        ?>
                        <?php echo $rowcount;?>
					</span>
            </a>
            <a class="list-group-item" href ="view_customer.php">
                Credit <span class="badge">
					<?php
                    include('connect.php');
                    $today = date('Y-m-d');
                    $sql = "SELECT * FROM sales WHERE due_date = ?";
                    $query = $db->prepare($sql);
                    $query->execute(array($today));
                    $fetch = $query->fetchAll();
                    $rowcount = $query->rowcount();
                    ?>
					[<?php echo $rowcount;?>]  <?php echo "$today" ?>
				</span>
            </a>
            <a class="list-group-item" href ="view_exproduct.php">
                Product Expiration  <span class="badge">
				<?php
                include('connect.php');
                $today = date('Y-m-d');
                $sql = "SELECT * FROM products WHERE products.expiration_date >= DATE(now())
				AND
				products.expiration_date <= DATE_ADD(DATE(now()), INTERVAL 1 MONTH)";
                $query = $db->prepare($sql);
                $query->execute(/*array($today)*/) or die ("Data Not Found !");
                $fetch = $query->fetchAll();
                $rowcount = $query->rowcount();
                ?>
				[<?php echo $rowcount;?>]  <?php echo "$today" ?>
			</span>
            </a>
            <!--<a class="list-group-item"  href ="view_overdue.php">
			Overdue <span class="badge">
			<?php
            include('connect.php');
            $today = date('Y-m-d');
            $sql = "SELECT due_date FROM sales WHERE DATE(due_date) = DATE( DATE_SUB( NOW() , INTERVAL 1 DAY ) )";
            $query = $db->prepare($sql);
            $query->execute(array($today));
            $fetch = $query->fetchAll();
            $rowcount = $query->rowcount();
            ?>
			[<?php echo $rowcount;?>]  <?php echo "$today" ?>
		</span>
	</a>-->
        </div>
        </div>
		<!-- /.row -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<script src="data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>
<script>
	$('.carousel').carousel({
        interval: 3000 //changes the speed
    })
</script>

</body>

</html>
