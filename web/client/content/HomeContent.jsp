<%-- 
    Document   : MainContent
    Created on : Jun 26, 2024, 10:49:21 PM
    Author     : baokhanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <style>
        .benefits {
  background-color: #f8f8f8;
  padding: 40px 0;
}

.benefits .container {

  flex-wrap: wrap;
  justify-content: center;
   flex-direction: column;
}

.benefit {
  width: 500px;
  margin: 20px;
  padding: 20px;
  border: 1px solid #ccc;
  text-align: center;
}

.benefit img {
  width: 100px;
  height: 100px;
  margin-bottom: 10px;
  
}

.benefit h3 {
  font-size: 20px;
  font-weight: bold;
}

.benefit p {
  font-size: 16px;
}
    </style>
</head>
<section class="hero" style="background-color: #ffffff;">
    <div class="container">
        <h2>Welcome to Bookstore</h2>
        <p>Explore our wide collection of books and find your next favorite read.</p>
        <a href="#" class="btn">Shop Now</a>
    </div>
</section>

<section class="categories">
  <div class="container" style="display: flex;">
    <div class="benefit">
      <img src="https://png.pngtree.com/png-vector/20230507/ourmid/pngtree-fast-delivery-label-design-vector-png-image_7087605.png" alt="Miễn phí vận chuyển">
      <h3>Fast Delivery</h3>
      <p>Fast Delivery in Hanoi City</p>
    </div>
    <div class="benefit">
      <img src="data:image/jpeg;base64,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" alt="Thanh toán an toàn">
      <h3>Variety of books</h3>
      <p>Our store has many different types of books with lots of interesting content</p>
    </div>
    <div class="benefit">
      <img src="data:image/png;base64,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" alt="Trả hàng 30 ngày">
      <h3>Good price</h3>
      <p>We rent and sell books at affordable prices</p>
    </div>
    <div class="benefit">
      <img src="data:image/jpeg;base64,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" alt="Hỗ trợ 24/7">
      <h3>Support 24/7</h3>
      <p>Our store supports customers 24/7 via mail and phone</p>
    </div>
  </div>

</section>

<section class="featured-books">
    <div class="container">
        <h2>Best seller</h2>
        <ul class="book-list">
            <li>
                <a href="#">
                    <img src="book1.jpg" alt="Book Title">
                    <h3>Vết Củ</h3>
                    <p>Đoàn Hiệu Lương</p>
                    <span class="price">50,000 VNĐ</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="book2.jpg" alt="Book Title">
                    <h3>BUY ONE, GET ONE 50% OFF</h3>
                    <p>Romance</p>
                    <span class="price">100,000 VNĐ</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="book3.jpg" alt="Book Title">
                    <h3>Vết Củ</h3>
                    <p>Đoàn Hiệu Lương</p>
                    <span class="price">50,000 VNĐ</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="book4.jpg" alt="Book Title">
                    <h3>Vết Củ</h3>
                    <p>Đoàn Hiệu Lương</p>
                    <span class="price">50,000 VNĐ</span>
                </a>
            </li>
        </ul>
    </div>
</section>
