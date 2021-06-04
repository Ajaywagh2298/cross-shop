<?php
require_once('auth.php');
include('connect.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <link rel="shortcut icon" href="cross%20shop%20icon.JPG">
    <title>CROSS SHOP</title>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
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


<?php include('navfixed.php');?>
<?php
function productcode() {
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
$pcode='P-'.productcode();
?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">PRODUCTS LIST</h1>
            </div>

            <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
                </div>
                <!--<a rel="facebox" id="addd" href="addcustomer.php" class="btn btn-primary">Add Customer</a><br><br>-->
                <div class="panel-body">
                    <!-- Button trigger modal -->
                    <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">Add Product</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="saveproduct.php" method="post" class = "form-group">
                                        <div id="ac">
                                            <span>Category : </span>
                                            <select name="categ" class = "form-control" >
                                                <option>Select Category</option>
                                                <option>Noodles</option>
                                                <option>Canned Goods</option>
                                                <option>Shampoo</option>
                                                <option>Bath Soap</option>
                                                <option>Crackers</option>
                                            </select>
                                            <span>Product Code : </span><input type="text" name="code" class = "form-control" value="<?php echo $pcode ?>" />
                                            <span>Brand Name : </span><input type="text" name="bname" class = "form-control" />
                                            <span>Description Name : </span><input type="text" name="dname" class = "form-control" />
                                            <span>Product Unit : </span>
                                            <select name="unit" class = "form-control" >
                                                <option>Select Product Unit</option>
                                                <option>Per Pieces</option>
                                                <option>Per Box</option>
                                                <option>Per Pack</option>
                                            </select>
                                            <span>Cost : </span><input type="text" name="cost" class = "form-control" />
                                            <span>SRP : </span><input type="text" name="price" class = "form-control" />
                                            <span>Supplier</span>
                                            <select name="supplier" class = "form-control">
                                                <?php

                                                $result = $db->prepare("SELECT * FROM supliers");

                                                $result->execute();
                                                for($i=0; $row = $result->fetch(); $i++){
                                                    ?>
                                                    <option><?php echo $row['suplier_name']; ?></option>
                                                    <?php
                                                }
                                                ?>
                                            </select>
                                            <span>Quantity : </span><input type="text" name="qty" class = "form-control" />
                                            <span>Date Delivered: </span><input type="date" name="date_del" class = "form-control" />
                                            <span>Expiration Date: </span><input type="date" name="ex_date" class = "form-control" />

                                            <span>&nbsp;</span><input class="btn btn-primary btn-block" type="submit" value="Save" class = "form-control" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                    <tr>
                        <th width="25%"> Code </th>
                        <th width="25%"> Brand Name </th>
                        <th width="25%"> Description</th>
                        <th width="25%"> Cost </th>
                        <th width="25%"> SRP </th>
                        <th width="25%"> Supplier </th>
                        <th width="25%"> Quantity Left </th>
                        <th width="25%"> Product Unit </th>
                        <th width="25%"> Action </th>
                    </tr>
                    </thead>
                    <tbody>
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


                    $result = $db->prepare("SELECT * FROM products ORDER BY product_name");
                    $result->execute();
                    for($i=0; $row = $result->fetch(); $i++){
                        ?>
                        <tr class="record">
                            <td><?php echo $row['product_code']; ?></td>
                            <td><?php echo $row['product_name']; ?></td>
                            <td><?php echo $row['description_name']; ?></td>
                            <td><?php echo $row['category']; ?></td>
                            <td align="right"><?php $pprice =$row['cost'];
                            echo formatMoney($pprice,true);?></td>
                            <td align="right"><?php echo $row['supplier']; ?></td>
                            <td align="right"><?php echo $row['qty_left']; ?></td>
                            <td ><?php echo $row['unit']; ?></td>
                            <td><a rel="facebox" class="btn btn-primary" href="editproduct.php?id=<?php echo $row['product_id']; ?>">
                                    <i class = "fa fa-pencil"></i>
                                </a>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>

                    </tbody>
                </table>
                <div class="clearfix"></div>
            </div>
            <script src="js/jquery.js"></script>
            <script type="text/javascript">
                $(function() {


                    $(".delbutton").click(function(){

//Save the link in a variable called element
                        var element = $(this);

//Find the id of the link that was clicked
                        var del_id = element.attr("id");

//Built a url to send
                        var info = 'id=' + del_id;
                        if(confirm("Sure you want to delete this update? There is NO undo!"))
                        {

                            $.ajax({
                                type: "GET",
                                url: "deletecustomer.php",
                                data: info,
                                success: function(){

                                }
                            });
                            $(this).parents(".record").animate({ backgroundColor: "#fbc7c7" }, "fast")
                                .animate({ opacity: "hide" }, "slow");

                        }

                        return false;

                    });

                });
            </script>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->


<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>


</body>

</html>

