-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 05, 2024 lúc 01:58 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1_nhom5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `tai_khoan_id` int(11) NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `san_pham_id`, `tai_khoan_id`, `noi_dung`, `ngay_dang`, `trang_thai`) VALUES
(1, 24, 2, 'sản phẩm đẹp đấy uy tín,sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín', '2024-10-01', 1),
(2, 24, 2, 'sản phẩm đẹp đấy uy tín,sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín, sản phẩm đẹp đấy uy tín', '2024-10-01', 1),
(3, 1, 2, 'hihi', '2024-09-03', 0),
(4, 2, 2, 'em đặt thêm 10 cái được không ạ', '2024-09-04', 1),
(5, 26, 12, 'ok', '2024-10-14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id` int(11) NOT NULL,
  `don_hang_id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hangs`
--

INSERT INTO `chi_tiet_don_hangs` (`id`, `don_hang_id`, `san_pham_id`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(2, 1, 24, 100000.00, 10, 20000000.00),
(3, 3, 25, 100000.00, 10, 10000.00),
(4, 5, 26, 1000000.00, 2, 2000000.00),
(5, 6, 25, 100000.00, 15, 1500000.00),
(6, 6, 24, 123123.00, 1, 123123.00),
(7, 7, 24, 123123.00, 1, 123123.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_gio_hangs`
--

CREATE TABLE `chi_tiet_gio_hangs` (
  `id` int(11) NOT NULL,
  `gio_hang_id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` int(11) NOT NULL,
  `ten_chuc_vu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuc_vus`
--

INSERT INTO `chuc_vus` (`id`, `ten_chuc_vu`) VALUES
(1, 'quản trị viên'),
(2, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_mucs`
--

CREATE TABLE `danh_mucs` (
  `id` int(11) NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `mo_ta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_mucs`
--

INSERT INTO `danh_mucs` (`id`, `ten_danh_muc`, `mo_ta`) VALUES
(8, 'Rolex', 'okok1231\r\n\r\n'),
(13, 'Piguet', 'okok'),
(14, 'Apple Watch', 'cụ sinh bg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id` int(11) NOT NULL,
  `ma_don_hang` varchar(50) NOT NULL,
  `tai_khoan_id` int(11) NOT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `email_nguoi_nhan` varchar(255) NOT NULL,
  `sdt_nguoi_nhan` varchar(15) NOT NULL,
  `dia_chi_nguoi_nhan` text NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `phuong_thuc_thanh_toan_id` int(11) NOT NULL,
  `trang_thai_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hangs`
--

INSERT INTO `don_hangs` (`id`, `ma_don_hang`, `tai_khoan_id`, `ten_nguoi_nhan`, `email_nguoi_nhan`, `sdt_nguoi_nhan`, `dia_chi_nguoi_nhan`, `ngay_dat`, `tong_tien`, `ghi_chu`, `phuong_thuc_thanh_toan_id`, `trang_thai_id`) VALUES
(1, 'DH-123', 2, 'duong van sinh1', 'sinhduong1500@gmail.com', '0865642496', 'lãn tranh, liên chung, tân yên, bắc giang', '2024-09-30', 1000000.00, 'okok1234', 1, 9),
(3, 'DH-124', 1, 'Đỗ tú tài', 'taixiu124@gmail.com', '0987456123', 'thái bình', '2024-10-05', 1000000.00, '123ok', 1, 4),
(4, 'DH9525', 2, 'tú tài', 'taixiu1@gmail.com', '0564489991', 'okkookok', '2024-10-09', 1623123.00, '', 2, 6),
(5, 'DH-1717', 12, 'anh sinh', 'ddd@gmail.com', '0943048234', 'ok', '2024-10-14', 2000000.00, 'ddfd', 1, 9),
(6, 'DH-4301', 2, 'tú tài', 'taixiu1@gmail.com', '0564489991', 'okkookok', '2024-10-21', 1623123.00, '', 2, 11),
(7, 'DH-7719', 2, 'tú tài', 'taixiu1@gmail.com', '0564489991', 'okkookok', '2024-10-21', 123123.00, '', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int(11) NOT NULL,
  `tai_khoan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hangs`
--

INSERT INTO `gio_hangs` (`id`, `tai_khoan_id`) VALUES
(4, 2),
(5, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int(11) NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `link_hinh_anh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id`, `san_pham_id`, `link_hinh_anh`) VALUES
(72, 24, './uploads/AlbumSanPham/1728025291.5-450x450.jpg'),
(73, 24, './uploads/AlbumSanPham/1728025291.5-900x900.jpg'),
(75, 25, './uploads/AlbumSanPham/1728121912.2-2-450x450.jpg'),
(76, 25, './uploads/AlbumSanPham/1728121912.2-450x450.jpg'),
(77, 25, './uploads/AlbumSanPham/1728121912.2-600x600.jpg'),
(78, 25, './uploads/AlbumSanPham/1728121912.3-3-450x450.jpg'),
(79, 26, './uploads/AlbumSanPham/1728288901.3-900x900.jpg'),
(80, 26, './uploads/AlbumSanPham/1728288901.4-4-450x450.jpg'),
(81, 26, './uploads/AlbumSanPham/1728288901.4-450x450.jpg'),
(82, 26, './uploads/AlbumSanPham/1728288901.4-900x900.jpg'),
(83, 27, './uploads/AlbumSanPham/1728288947.4-450x450.jpg'),
(84, 27, './uploads/AlbumSanPham/1728288947.4-900x900.jpg'),
(85, 27, './uploads/AlbumSanPham/1728288947.5-5-450x450.jpg'),
(86, 27, './uploads/AlbumSanPham/1728288947.5-450x450.jpg'),
(87, 28, './uploads/AlbumSanPham/1728288997.14-450x450.jpg'),
(88, 28, './uploads/AlbumSanPham/1728288997.15-15-450x450.jpg'),
(89, 28, './uploads/AlbumSanPham/1728288997.15-450x450.jpg'),
(90, 28, './uploads/AlbumSanPham/1728288997.16-16-450x450.jpg'),
(91, 29, './uploads/AlbumSanPham/1728289723.4-450x450.jpg'),
(92, 29, './uploads/AlbumSanPham/1728289723.4-900x900.jpg'),
(93, 29, './uploads/AlbumSanPham/1728289723.5-5-450x450.jpg'),
(94, 29, './uploads/AlbumSanPham/1728289723.5-450x450.jpg'),
(96, 24, './uploads/AlbumSanPham/17283129752-450x450.jpg'),
(97, 24, './uploads/AlbumSanPham/17283129752-450x450.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuong_thuc_thanh_toans`
--

CREATE TABLE `phuong_thuc_thanh_toans` (
  `id` int(11) NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phuong_thuc_thanh_toans`
--

INSERT INTO `phuong_thuc_thanh_toans` (`id`, `ten_phuong_thuc`) VALUES
(1, 'COD(Thanh toán khi nhận hàng)'),
(2, 'Thanh toán VNPay');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int(11) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `hinh_anh` text DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `luot_xem` int(11) DEFAULT 0,
  `ngay_nhap` date NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `danh_muc_id` int(11) NOT NULL,
  `trang_thai` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_phams`
--

INSERT INTO `san_phams` (`id`, `ten_san_pham`, `gia_san_pham`, `gia_khuyen_mai`, `hinh_anh`, `so_luong`, `luot_xem`, `ngay_nhap`, `mo_ta`, `danh_muc_id`, `trang_thai`) VALUES
(24, 'Aliquam lobortis', 99999999.99, 123123.00, './uploads/anhSanPham/1728455424.1-1-450x450.jpg', 12, 0, '2024-10-04', 'okok123', 8, 1),
(25, 'Aliquam lobortis 15', 12000000.00, 100000.00, './uploads/anhSanPham/1728455455.1-450x450.jpg', 10, 0, '2024-10-05', 'okok', 8, 1),
(26, 'Aliquam lobortis 16', 120000.00, 1000000.00, './uploads/anhSanPham/1728455503.3-900x900.jpg', 10, 0, '2024-10-07', 'ok', 8, 1),
(27, 'Aliquam lobortis 17', 1111111.00, 19000.00, './uploads/anhSanPham/1728455530.3-900x900.jpg', 30, 0, '2024-10-07', '1111', 8, 1),
(28, 'Aliquam lobortis 10', 1111111.00, 1111.00, './uploads/anhSanPham/1728455555.3-900x900.jpg', 232, 0, '2024-10-07', 'okok123', 8, 1),
(29, 'Aliquam lobortis 09', 232323.00, 2323.00, './uploads/anhSanPham/1728455572.4-900x900.jpg', 1111, 0, '2024-10-07', 'okok124', 8, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(10) NOT NULL,
  `gioi_tinh` tinyint(1) NOT NULL DEFAULT 1,
  `dia_chi` text NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `chuc_vu_id` int(11) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_khoans`
--

INSERT INTO `tai_khoans` (`id`, `ho_ten`, `anh_dai_dien`, `ngay_sinh`, `email`, `so_dien_thoai`, `gioi_tinh`, `dia_chi`, `mat_khau`, `chuc_vu_id`, `trang_thai`) VALUES
(1, 'Dương Văn Sinh', './uploads/anhSanPham/1728312947.1-1-600x600.jpg', '2024-09-12', 'sinhduong1507@gmail.com', '0895646546', 1, 'bắc giang', '$2y$10$A2J7wIlaor2UduZ1EVs.A./Q8wsJF9GHZYN11iOCVXmxlVEmpB2wG', 1, 1),
(2, 'tú tài', './uploads/anhSanPham/1728312947.1-1-600x600.jpg', '2024-09-14', 'taixiu1@gmail.com', '0564489991', 2, 'okkookok', '$2y$10$sCFRsBSq1.ymrc0zntzsdOBSzCglOvyhBkETmTFudrggzuaIyio9y', 2, 1),
(3, 'Dương Văn Sinh aa', NULL, '0000-00-00', 'duongsinh2004@gmail.com', '0865642497', 1, '', '$2y$10$5nLFaQcLmkIqxc7ktveINOOnET3xS0QSbs40du6voS5uVdHYGVyha', 2, 1),
(5, 'Dương Văn SinhAA', NULL, '0000-00-00', 'duongsinh2005@gmail.com', '0865642497', 1, '', '$2y$10$c/vdSf.lljuaDiWmifkFh.ugbsIWwW6Pgf24a2E2bHfG4wnPlp5DK', 1, 1),
(6, 'Dương Văn Sinh cc', NULL, '0000-00-00', 'sinhduong1508@gmail.com', '0865642497', 1, '', '$2y$10$vw/2w5xBermp0qqi/UNYrOE1R8Tigp6O/8lerFOCmj5Bq.Q/Sn8Fu', 1, 2),
(10, 'Dương Văn Sinh bbvv', NULL, '0000-00-00', 'sinhduong1500@gmail.com', '0865642434', 1, '', '$2y$10$jBQCj0Hzc74D8LRDJkAJj..gpcEclw5VcYnKC8rVngE3OfMJ5QaEW', 1, 2),
(11, 'aaaaa', NULL, '0000-00-00', 'a12@gmail.com', '', 1, '', '$2y$10$.RR6hetcQeH6346traMxEeThMWGLf2cNPyiSRDTzbh1jL2.JDqHI.', 0, 1),
(12, 'anh sinh', NULL, '0000-00-00', 'ddd@gmail.com', '', 1, '', '$2y$10$ZpZDPFCc8Fs5OoUS1UubK.W5SbHkjcyXeqtg/t7wT2WqJcoktUubi', 2, 1),
(13, 'qqq', NULL, '0000-00-00', 'd123@gmail.com', '', 1, '', '$2y$10$IZgxZBEozAYQQDK6dms0YO6kb8AZ1dH.zndZ.6zSMQJFUWu8iQtCi', 0, 1),
(14, 'eee', NULL, '0000-00-00', 'd12@gmail.com', '', 1, '', '$2y$10$nWCzWx/itKd4LdVbVDOK5uYAD.AXBTKOUD0yJx5OTarZ7IwDRly4W', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int(11) NOT NULL,
  `ten_trang_thai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `ten_trang_thai`) VALUES
(1, 'Chưa xác nhận'),
(2, 'Đã xác nhận'),
(3, 'Chưa thanh toán'),
(4, 'Đã thanh toán'),
(5, 'Đang chuẩn bị hàng'),
(6, 'Đang giao'),
(7, 'Đã giao'),
(8, 'Đã nhận'),
(9, 'Thành công'),
(10, 'Hoàn hàng'),
(11, 'Hủy đơn');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
