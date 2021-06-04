<?php
require_once('auth.php');
include('connect.php');
?>
<?php
function createRandomPassword() {
	$chars = "003232303232023232023456789";
	srand((double)microtime()*1000000);
	$i = 0;
	$pass = '' ;
	while ($i <= 7) {

		$num = rand() % 33;

		$tmp = substr($chars, $num, 1);

		$pass = $pass . $tmp;

		$i++;

	}
	return $pass;
}
$finalcode='RS-'.createRandomPassword();
?>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<a class="navbar-brand" href="#"><img src="cross%20shop1.JPG" style="height: 150%;width: 200px;"></a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
	Welcome:<strong> <?php echo $session_cashier_name; ?></strong>      
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
					<li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
					</li>
				</ul>
				<!-- /.dropdown-user -->
			</li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->



		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
                    <li>
                        <a href="home.php"><i class="fa fa-home fa-fw"></i> Home</a>
                    </li>
					<li>
						<a href="#"><i class="fa fa-money fa-fw"></i> Select payment method<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li>
								<a href="sales.php?id=cash&invoice=<?php echo $finalcode ?>">Cash</a>
							</li>
							<li>
								<a href="sales.php?id=debit-card&invoice=<?php echo $finalcode ?>">Debit Card</a>
							</li>
                            <li>
                                <a href="sales.php?id=credit-card&invoice=<?php echo $finalcode ?>">Credit Card</a>
                            </li>
                            <li>
                                <a href="sales.php?id=upi&invoice=<?php echo $finalcode ?>">UPI</a>
                            </li>
                            <li>
                                <a href="sales.php?id=net-banking&invoice=<?php echo $finalcode ?>">Net Banking</a>
                            </li>
                            <li>
                                <a href="sales.php?id=credit&invoice=<?php echo $finalcode ?>">Credit</a>
                            </li>
						</ul>
					</li>
                    <li>
                        <a href="../customer.php"><i class="fa fa-user fa-fw"></i> Customer</a>
                    </li>
                    <li>
                        <a rel="facebox" href="select_customer.php"><i class="fa fa-book fa-fw"></i> Customer Ledger</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i> REPORTS<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="../accountreceivables.php">Accounts Receivables Report</a>
                            </li>
                            <li>
                                <a href="../collection.php">Collection Report</a>
                            </li>
                            <li>
                                <a href="../salesreport.php">Sales Report</a>
                            </li>
                            <li>
                                <a  href="../product_lose.php"> List of Product Expired</a>
                            </li>
                            <li>
                                <a  href="../search_customer.php"> Customer Transaction Record</a>
                            </li>
                        </ul>
                    </li>
                </ul>
				</div>
			</div>
			<!-- /.navbar-static-side -->
		</nav>
