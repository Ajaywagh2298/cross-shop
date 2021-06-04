-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 08:40 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` int(10) NOT NULL,
  `cashier_name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `cashier_name`, `position`, `username`, `password`) VALUES
(1, 'owner', 'owner', 'owner', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `transaction_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`transaction_id`, `date`, `name`, `invoice`, `amount`, `remarks`, `balance`) VALUES
(1, '03/30/2021', 'RS-020003', 'IN-275228', '13', 'done', -13);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `membership_number` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `address`, `contact`, `membership_number`, `first_name`, `middle_name`, `last_name`) VALUES
(2, 'anish  rajesh ohol', 'Nagar', '655888575', '5547555445', 'anish ', 'rajesh', 'ohol'),
(3, 'Bari', 'pune', '445452', 'C-0022764', 'kiran', 'sudam', 'bari'),
(4, 'dolas', 'solapur', '3242423423', 'C-3042622', 'sudeep', '', 'dolas');

-- --------------------------------------------------------

--
-- Table structure for table `lose`
--

CREATE TABLE `lose` (
  `p_id` int(10) NOT NULL,
  `product_code` varchar(30) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `description_name` varchar(30) NOT NULL,
  `amount_lose` varchar(30) NOT NULL,
  `qty` varchar(30) NOT NULL,
  `cost` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL,
  `exdate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lose`
--

INSERT INTO `lose` (`p_id`, `product_code`, `product_name`, `description_name`, `amount_lose`, `qty`, `cost`, `date`, `category`, `exdate`) VALUES
(1, 'P-08', 'Century Tuna', 'ADOBO', '3000', '100', '30', '02-23-2017', 'Canned Goods', '2017-05-27'),
(2, 'P-20032023', 'Lucky Me', 'Pancit Canton Extra Hot', '1000', '100', '10', '03-29-2021', 'Noodles', '2017-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description_name` varchar(50) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `qty_left` int(10) NOT NULL,
  `category` varchar(100) NOT NULL,
  `date_delivered` varchar(20) NOT NULL,
  `expiration_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_name`, `description_name`, `unit`, `cost`, `price`, `supplier`, `qty_left`, `category`, `date_delivered`, `expiration_date`) VALUES
(1, 'P-08', 'Century Tuna', 'ADOBO', 'Per Pieces', '30', '33', 'Unilever', 177, 'Select Category', '2017-02-20', '2021-03-19'),
(2, 'P-20032023', 'Lucky Me', 'Pancit Canton Extra Hot', 'Per Pieces', '10', '12', 'Consuelo', 0, 'Noodles', '2017-01-21', '0'),
(3, 'P-20032043', 'Lucky Me', 'Pancit Canton Chilimansi', 'Per Pieces', '10', '12', 'Consuelo', 67, 'Noodles', '2017-02-21', '2017-06-30'),
(4, 'P-3932232', 'M.Y. San', 'Skyflakes Crackers', 'Per Pack', '45.50', '50', 'Consuelo', 53, 'Crackers', '2017-02-21', ''),
(5, 'P-0343020', 'kala chhap', 'clean face', 'Per Pack', '150', '160', 'janta shop', 0, 'Bath Soap', '2021-01-16', '2021-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `transaction_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `date_order` varchar(100) NOT NULL,
  `suplier` varchar(100) NOT NULL,
  `date_deliver` varchar(100) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `qty` varchar(30) NOT NULL,
  `cost` varchar(30) NOT NULL,
  `status` varchar(25) NOT NULL,
  `remark` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`transaction_id`, `invoice_number`, `date_order`, `suplier`, `date_deliver`, `p_name`, `qty`, `cost`, `status`, `remark`) VALUES
(1, 'PO-8330322', '2017-02-23', 'Consuelo', '', 'P-08', '100', '3300', 'Cancelled', ' '),
(2, 'PO-8037462', '2021-03-29', 'vimal', '2021-03-17', 'P-3932232', '10', '500', 'Received', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `purchases_item`
--

CREATE TABLE `purchases_item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL,
  `date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases_item`
--

INSERT INTO `purchases_item` (`id`, `name`, `qty`, `cost`, `invoice`, `status`, `date`) VALUES
(1, 'P-08', 100, '3300', 'PO-8330322', 'Cancelled', '2017-02-23'),
(2, 'P-3932232', 10, '500', 'PO-8037462', 'Received', '2021-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `transaction_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `cashier` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `due_date` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `balance` varchar(100) NOT NULL,
  `total_amount` varchar(30) NOT NULL,
  `cash` varchar(100) NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `p_amount` varchar(30) NOT NULL,
  `vat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`transaction_id`, `invoice_number`, `cashier`, `date`, `type`, `amount`, `due_date`, `name`, `balance`, `total_amount`, `cash`, `month`, `year`, `p_amount`, `vat`) VALUES
(1, 'RS-33200322', 'Rizaldy Loren', '02/21/2017', 'cash', '184.8', '', 'Renzy Jerota Loren', '', '', '185', 'February', '2017', '165', '19.8'),
(2, 'RS-22862300', 'Cashier', '03/30/2021', 'cash', '7452', '', 'anish  rajesh ohol', '', '', '7452', 'March', '2021', '592', '71.04'),
(3, 'RS-9320263', 'Cashier', '03/30/2021', 'cash', '2.24', '', 'anish  rajesh ohol', '', '', '2.24', 'March', '2021', '2', '0.24'),
(4, 'RS-23333337', 'Cashier', '03/30/2021', 'cash', '1068.48', '', 'anish  rajesh ohol', '', '', '1068', 'March', '2021', '99', '11.88'),
(5, 'RS-0050', 'Cashier', '03/30/2021', 'cash', '235.2', '', 'anish  rajesh ohol', '', '', '100', 'March', '2021', '160', '19.2'),
(6, 'RS-08232', 'Cashier', '03/30/2021', 'cash', '56', '', 'anish  rajesh ohol', '', '', '56', 'March', '2021', '50', '6'),
(7, 'RS-024222', 'Cashier', '03/30/2021', 'cash', '13.44', '', 'anish  rajesh ohol', '', '', '12', 'March', '2021', '12', '1.44'),
(8, 'RS-2345573', 'Cashier', '03/30/2021', 'cash', '13.44', '', 'anish  rajesh ohol', '', '', '13.44', 'March', '2021', '12', '1.44'),
(9, 'RS-0833233', 'Cashier', '03/30/2021', 'debit-card', '13.44', '', 'anish  rajesh ohol', '', '', '13.44', 'March', '2021', '12', '1.44'),
(10, 'RS-020003', 'Cashier', '03/30/2021', 'credit', '13', 'done', 'anish  rajesh ohol', '-13', '0', '', 'March', '2021', '0', '0'),
(11, 'RS-52222233', 'Cashier', '03/30/2021', 'credit-card', '2800', '', 'anish  rajesh ohol', '', '', '2,800', 'March', '2021', '2500', '300'),
(12, 'RS-023452', 'owner', '03/30/2021', 'cash', '13.44', '', 'anish  rajesh ohol', '', '', '15', 'March', '2021', '12', '1.44'),
(13, 'RS-0336333', 'owner', '03/30/2021', 'cash', '13.44', '', 'anish  rajesh ohol', '', '', '100', 'March', '2021', '12', '1.44'),
(14, 'RS-65263233', '', '03/30/2021', 'cash', '365.12', '', 'anish  rajesh ohol', '', '', '500', 'March', '2021', '264', '31.68'),
(15, 'RS-45229332', 'owner', '03/30/2021', 'credit-card', '12', '', 'anish  rajesh ohol', '', '', '12', 'March', '2021', '12', '1.44');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `transaction_id` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `discount` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `date` varchar(25) NOT NULL,
  `omonth` varchar(25) NOT NULL,
  `oyear` varchar(25) NOT NULL,
  `qtyleft` varchar(25) NOT NULL,
  `dname` varchar(50) NOT NULL,
  `vat` varchar(20) NOT NULL,
  `total_amount` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`transaction_id`, `invoice`, `product`, `qty`, `amount`, `name`, `price`, `discount`, `category`, `date`, `omonth`, `oyear`, `qtyleft`, `dname`, `vat`, `total_amount`) VALUES
(1, 'RS-33200322', 'P-08', '5', '165', 'Century Tuna', '33', '0', 'Canned Goods', '02/21/2017', 'February', '2017', '95', 'ADOBO', '19.8', '184.8'),
(3, 'RS-323330', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '99', 'Pancit Canton Chilimansi', '0', '12'),
(4, 'RS-323330', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '98', 'Pancit Canton Chilimansi', '0', '12'),
(5, 'RS-323330', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '97', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(6, 'RS-22862300', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '96', 'Pancit Canton Chilimansi', '3888', '3900'),
(7, 'RS-22862300', 'P-0343020', '4', '592', 'kala chhap', '160', '12', 'Bath Soap', '03/30/2021', 'March', '2021', '6', 'clean face', '2960', '3552'),
(8, 'RS-94232883', 'P-20032043', '1', '2', 'Lucky Me', '12', '10', 'Noodles', '03/30/2021', 'March', '2021', '95', 'Pancit Canton Chilimansi', '0.24', '2.24'),
(9, 'RS-9320263', 'P-20032043', '1', '2', 'Lucky Me', '12', '10', 'Noodles', '03/30/2021', 'March', '2021', '94', 'Pancit Canton Chilimansi', '0.24', '2.24'),
(10, 'RS-23333337', 'P-20032043', '10', '70', 'Lucky Me', '12', '5', 'Noodles', '03/30/2021', 'March', '2021', '84', 'Pancit Canton Chilimansi', '8.4', '78.4'),
(11, 'RS-23333337', 'P-0343020', '5', '785', 'kala chhap', '160', '3', 'Bath Soap', '03/30/2021', 'March', '2021', '1', 'clean face', '94.2', '879.2'),
(12, 'RS-23333337', 'P-08', '3', '99', 'Century Tuna', '33', '0', 'Select Category', '03/30/2021', 'March', '2021', '197', 'ADOBO', '11.88', '110.88'),
(13, 'RS-0050', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '109', 'Skyflakes Crackers', '6', '56'),
(14, 'RS-0050', 'P-0343020', '1', '160', 'kala chhap', '160', '0', 'Bath Soap', '03/30/2021', 'March', '2021', '0', 'clean face', '19.2', '179.2'),
(15, 'RS-82320', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '108', 'Skyflakes Crackers', '6', '56'),
(16, 'RS-34222', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '83', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(17, 'RS-34222', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '82', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(18, 'RS-33623202', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '107', 'Skyflakes Crackers', '6', '56'),
(19, 'RS-273333', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '81', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(20, 'RS-06262', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '106', 'Skyflakes Crackers', '6', '56'),
(21, 'RS-0633423', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '105', 'Skyflakes Crackers', '6', '56'),
(22, 'RS-526232', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '80', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(23, 'RS-02483', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '79', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(24, 'RS-025233', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '78', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(25, 'RS-08232', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '104', 'Skyflakes Crackers', '6', '56'),
(26, 'RS-4922', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '77', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(27, 'RS-024222', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '76', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(28, 'RS-23038220', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '75', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(29, 'RS-2345573', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '74', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(30, 'RS-0833233', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '73', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(31, 'RS-020003', 'P-20032043', '1', '0', 'Lucky Me', '12', '12', 'Noodles', '03/30/2021', 'March', '2021', '72', 'Pancit Canton Chilimansi', '0', '0'),
(32, 'RS-52222233', 'P-3932232', '50', '2500', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '54', 'Skyflakes Crackers', '300', '2800'),
(33, 'RS-023452', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '71', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(34, 'RS-0336333', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '70', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(35, 'RS-65263233', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '69', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(36, 'RS-65263233', 'P-3932232', '1', '50', 'M.Y. San', '50', '0', 'Crackers', '03/30/2021', 'March', '2021', '53', 'Skyflakes Crackers', '6', '56'),
(37, 'RS-65263233', 'P-08', '8', '264', 'Century Tuna', '33', '0', 'Select Category', '03/30/2021', 'March', '2021', '189', 'ADOBO', '31.68', '295.68'),
(38, 'RS-0352330', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '68', 'Pancit Canton Chilimansi', '1.44', '13.44'),
(39, 'RS-0352330', 'P-08', '12', '348', 'Century Tuna', '33', '4', 'Select Category', '03/30/2021', 'March', '2021', '177', 'ADOBO', '41.76', '389.76'),
(40, 'RS-45229332', 'P-20032043', '1', '12', 'Lucky Me', '12', '0', 'Noodles', '03/30/2021', 'March', '2021', '67', 'Pancit Canton Chilimansi', '0', '12');

-- --------------------------------------------------------

--
-- Table structure for table `supliers`
--

CREATE TABLE `supliers` (
  `suplier_id` int(11) NOT NULL,
  `suplier_name` varchar(100) NOT NULL,
  `suplier_address` varchar(100) NOT NULL,
  `suplier_contact` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supliers`
--

INSERT INTO `supliers` (`suplier_id`, `suplier_name`, `suplier_address`, `suplier_contact`, `contact_person`) VALUES
(1, 'Unilever', 'Bacolod City', '441 3251', 'dina'),
(2, 'Consuelo', 'Talisay City', '441 3896', 'rey'),
(3, 'janta shop', 'pune', '32434739', 'kiran bari');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `position`) VALUES
(1, 'admin', 'admin123', 'Admin', 'Admin'),
(2, 'ajay', 'ajay', 'ajay wagh', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `lose`
--
ALTER TABLE `lose`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `purchases_item`
--
ALTER TABLE `purchases_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `supliers`
--
ALTER TABLE `supliers`
  ADD PRIMARY KEY (`suplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `cashier_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lose`
--
ALTER TABLE `lose`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases_item`
--
ALTER TABLE `purchases_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `supliers`
--
ALTER TABLE `supliers`
  MODIFY `suplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
