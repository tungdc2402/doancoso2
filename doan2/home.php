<?php
include 'database.php';
$sql = "SELECT * FROM khoa_hoc";
$result = mysqli_query($conn, $sql);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VATLYHADONG.VN - Khóa học & Tài liệu</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- HEADER -->
<header class="main-header">
    <div class="container header-content">
        <div class="logo">
            <a href="#">
                <h1>VATLYHADONG<span>.VN</span></h1>
                <p>Khóa học & Tài liệu Vật Lý</p>
            </a>
        </div>

        <nav class="navbar">
            <ul>
                <li><a href="#" class="active">Trang chủ</a></li>
                <li><a href="#">Khóa học Online</a></li>
                <li><a href="#">Sách tham khảo</a></li>
                <li><a href="#">Tài liệu VIP</a></li>
            </ul>
        </nav>

        <div class="header-actions">
            <div class="search-box">
                <input type="text" placeholder="Tìm khóa học...">
                <button><i class="fas fa-search"></i></button>
            </div>
            <div class="cart-icon">
                <a href="#"><i class="fas fa-shopping-cart"></i> <span>2</span></a>
            </div>
            <div class="mobile-menu-btn"><i class="fas fa-bars"></i></div>
        </div>
    </div>
</header>

<!-- MAIN CONTENT -->
<div class="main-content">
    <!-- PHẦN 1: KHÓA HỌC -->
    <div class="container">
        <h2 class="section-title">Khóa học nổi bật</h2>

        <div class="course-grid">
            <!-- Card 1 -->
            <?php while ($row = mysqli_fetch_assoc($result)) : ?>
            <a href="detail.php?id=" class="course-card">
                <div class="course-img-wrapper">
                    <img src="<?php echo htmlspecialchars($row['hinh_anh']); ?>" alt="Course" class="course-img">
                </div>
                <div class="course-title"><?php echo htmlspecialchars($row['ten_khoa_hoc']); ?></div>
                <div class="course-author">Thầy Nguyễn Văn A</div>
                <div class="course-rating">
                    <span>4.9</span>
                    <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
                    <span class="reviews">(1,234)</span>
                </div>
                <div class="course-price">
                    <span>599.000₫</span>
                    <span class="old-price">1.299.000₫</span>
                </div>
                <span class="badge">Bestseller</span>
            </a>
        </div>
        <?php endwhile; ?>
    </div>

    <!-- PHẦN 2: SÁCH (Đã được chỉnh sửa căn chỉnh) -->
    <div class="container section-separator">
        <div class="section-header">
            <h2 class="section-title">Sách & Tài liệu bán chạy</h2>
            <a href="#" class="see-all">Xem tất cả <i class="fas fa-arrow-right"></i></a>
        </div>

        <div class="book-grid">
            <!-- Book Card 1 -->
            <div class="book-card">
                <div class="book-cover-wrapper">
                    <img src="https://m.media-amazon.com/images/I/41oYsXj8wwL._SX384_BO1,204,203,200_.jpg" alt="Book" class="book-cover">
                </div>
                <div class="book-type">Ebook PDF</div>
                <h3 class="book-title">Cẩm nang Vật Lý 12 toàn tập</h3>
                <div class="course-author">VATLYHADONG Biên soạn</div>
                <div class="course-rating">
                    <span>4.9</span>
                    <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
                </div>
                <div class="course-price">
                    <span>150.000₫</span>
                    <span class="old-price">300.000₫</span>
                </div>
                <button class="book-btn">Xem chi tiết</button>
            </div>

            <!-- Book Card 2 -->
            <div class="book-card">
                <div class="book-cover-wrapper">
                    <img src="https://m.media-amazon.com/images/I/51woedbG2aL._SX379_BO1,204,203,200_.jpg" alt="Book" class="book-cover">
                </div>
                <div class="book-type">Sách giấy</div>
                <h3 class="book-title">Tuyển tập 500 bài toán Cơ học hay và khó</h3>
                <div class="course-author">Thầy Nguyễn Văn A</div>
                <div class="course-rating">
                    <span>4.8</span>
                    <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half-stroke"></i></div>
                </div>
                <div class="course-price">
                    <span>280.000₫</span>
                </div>
                <button class="book-btn">Xem chi tiết</button>
            </div>

            <!-- Book Card 3 -->
            <div class="book-card">
                <div class="book-cover-wrapper">
                    <img src="https://m.media-amazon.com/images/I/51E2055ZGUL._SX377_BO1,204,203,200_.jpg" alt="Book" class="book-cover">
                </div>
                <div class="book-type">Ebook EPUB</div>
                <h3 class="book-title">Sổ tay công thức Vật Lý THPT</h3>
                <div class="course-author">Lưu hành nội bộ</div>
                <div class="course-rating">
                    <span>4.5</span>
                    <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></div>
                </div>
                <div class="course-price">
                    <span>99.000₫</span>
                    <span class="old-price">199.000₫</span>
                </div>
                <button class="book-btn">Xem chi tiết</button>
            </div>

            <!-- Book Card 4 -->
            <div class="book-card">
                <div class="book-cover-wrapper">
                    <img src="https://m.media-amazon.com/images/I/51WIKlio9qL._SX379_BO1,204,203,200_.jpg" alt="Book" class="book-cover">
                </div>
                <div class="book-type">Combo Sách</div>
                <h3 class="book-title">Bộ đề thi thử 2025 (Có lời giải chi tiết)</h3>
                <div class="course-author">Team Vật Lý HĐ</div>
                <div class="course-rating">
                    <span>5.0</span>
                    <div class="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
                </div>
                <div class="course-price">
                    <span>450.000₫</span>
                    <span class="old-price">600.000₫</span>
                </div>
                <button class="book-btn">Xem chi tiết</button>
            </div>
        </div>
    </div>

</div>

<footer>
    <div class="container footer-content">
        <div class="logo">
            <h2 style="color:#fff; font-size: 24px;">VATLYHADONG<span>.VN</span></h2>
        </div>
        <div style="font-size:14px; margin-top:10px; color: #d1d7dc;">© 2025 Bản quyền thuộc về Vật Lý Hà Đông.</div>
    </div>
</footer>

</body>
</html>