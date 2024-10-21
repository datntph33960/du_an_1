<?php include_once 'layout/header.php'; ?>
<div class="wrapper bg--shaft">

    <?php include_once 'layout/menu.php'; ?>

    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="page-title">Checkout</h1>
                    <ul class="breadcrumb justify-content-center">
                        <li><a href="index.html">Home</a></li>
                        <li class="current"><a href="checkout.html">Checkout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="main-content-wrapper">
        <div class="checkout-area pt--40 pb--80 pt-md--30 pb-md--60">
            <div class="container">
                <form action="<?= BASE_URL . '?act=xu-ly-thanh-toan' ?>" method="POST" id="paymentForm">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout-title">
                                <h2>THÔNG TIN NGƯỜI NHẬN</h2>
                            </div>
                            <div class="checkout-form">

                                <!-- Receiver Information Fields -->
                                <div class="form-row mb--30">
                                    <div class="form__group col-md-12 mb-sm--30">
                                        <label for="ten_nguoi_nhan" class="form__label">Họ Và Tên: <span>*</span></label>
                                        <input type="text" name="ten_nguoi_nhan" value="<?= $user['ho_ten'] ?>" class="form__input form__input--2" placeholder="Nhập họ và tên" required>
                                    </div>
                                </div>
                                <div class="form-row mb--30">
                                    <div class="form__group col-12">
                                        <label for="dia_chi_nguoi_nhan" class="form__label">Địa Chỉ: <span>*</span></label>
                                        <input type="text" name="dia_chi_nguoi_nhan" value="<?= $user['dia_chi'] ?>" class="form__input form__input--2" placeholder="Nhập địa chỉ" required>
                                    </div>
                                </div>
                                <div class="form-row mb--30">
                                    <div class="form__group col-md-12 mb-sm--30">
                                        <label for="sdt_nguoi_nhan" class="form__label">Số Điện Thoại: <span>*</span></label>
                                        <input type="text" name="sdt_nguoi_nhan" value="<?= $user['so_dien_thoai'] ?>" class="form__input form__input--2" placeholder="Nhập số điện thoại" required>
                                    </div>
                                    <div class="form__group col-md-12">
                                        <label for="email_nguoi_nhan" class="form__label">Email:</label>
                                        <input type="email" name="email_nguoi_nhan" value="<?= $user['email'] ?>" class="form__input form__input--2" placeholder="Nhập địa chỉ email">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form__group col-12">
                                        <label for="ghi_chu" class="form__label">Ghi Chú:</label>
                                        <textarea class="form__input form__input--2 form__input--textarea" name="ghi_chu" placeholder="Ghi Chú..."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 mt-md--30">
                            <div class="order-details">
                                <h3 class="heading-tertiary">Thông tin Sản phẩm</h3>
                                <div class="order-table table-content table-responsive mb--30">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Sản Phẩm</th>
                                                <th>Giá Tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $tongGioHang = 0; // Initialize total cart amount

                                            foreach ($chiTietGioHang as $sanPham): ?>
                                                <tr>
                                                    <td>
                                                        <input type="hidden" name="product_id[]" value="<?= $sanPham['san_pham_id'] ?>">
                                                        <input type="hidden" name="quantity[]" value="<?= $sanPham['so_luong'] ?>">
                                                        <a href=""><?= htmlspecialchars($sanPham['ten_san_pham']) ?><strong> x <?= intval($sanPham['so_luong']) ?></strong></a>
                                                    </td>
                                                    <td>
                                                        <?php
                                                        $tongTien = $sanPham['gia_khuyen_mai'] ? ($sanPham['gia_khuyen_mai'] * $sanPham['so_luong']) : ($sanPham['gia_san_pham'] * $sanPham['so_luong']);
                                                        $price = $sanPham['gia_khuyen_mai'] ?? $sanPham['gia_san_pham'];
                                                        echo '<input type="hidden" name="price[]" value="' . $price . '">';
                                                        echo '<input type="hidden" name="total_price[]" value="' . $tongTien . '">';
                                                        $tongGioHang += $tongTien;
                                                        echo formatPrice($tongTien) . ' vnd';
                                                        ?>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Vận chuyển</th>
                                                <td><strong>30.000đ</strong></td>
                                            </tr>
                                            <tr>
                                                <th>Tổng tiền sản phẩm</th>
                                                <input type="hidden" name="tong_tien" value="<?= $tongGioHang ?>">
                                                <td><strong><?= formatPrice($tongGioHang + 30000) . 'đ' ?></strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                
                                <div class="checkout-payment">
                                    <div class="payment-btn-group">
                                        <h5>Chọn phương thức thanh toán</h5> 
                                        <br>
                                        <div class="custom-radio payment-radio">
                                            <input style="width: 20px;" id="option1" type="radio" value="1" name="phuong_thuc_thanh_toan_id" checked required onclick="hidePaymentCode()" />
                                            <label class="payment-label" for="option1">Thanh Toán Khi Nhận Hàng</label>
                                        </div> 
                                        <br>

                                        <div class="custom-radio payment-radio">
                                            <input style="width: 20px;" id="option2" type="radio" value="2" name="phuong_thuc_thanh_toan_id" required onclick="showPaymentCode()" />
                                            <label class="payment-label" for="option2">Thanh toán VNPAY</label>
                                        </div>
                                        <br>

                                        <div class="payment-code" id="paymentCode">
                                            Mã thanh toán: <span id="code"><img src="https://th.bing.com/th/id/OIP.SzaQ2zk5Q5EsnORQ_zpvGAHaHa?w=175&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Payment Code"></span>
                                        </div>
                                    </div>

                                    <p class="alert alert-danger" style="display: none;" id="messageLogin">Bạn cần đăng nhập để thực hiện đặt hàng!</p>

                                    <div class="payment-btn-group">
                                        <button type="submit" class="btn btn-style-3">Thanh toán</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('paymentForm').addEventListener('submit', function(event) {
        if (!isLogIn) {
            event.preventDefault();
            document.getElementById('messageLogin').style.display = 'block';
            document.getElementById('messageLogin').textContent = 'Bạn cần đăng nhập để thực hiện đặt hàng!';
        }
    });

    function showPaymentCode() {
        document.getElementById('paymentCode').style.display = 'block';
    }

    function hidePaymentCode() {
        document.getElementById('paymentCode').style.display = 'none';
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('option1').checked = true; // Set the first radio button as checked
    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<?php include_once 'layout/footer.php'; ?>