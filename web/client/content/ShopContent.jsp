<%@page import ="DAO.BookInfoDAO"%> 
<%@page import ="entity.BookInfo"%>
<%@page import ="entity.Books"%> 
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <style>
        .card {
            height: 500px; /* Chiều cao cố định cho các thẻ card */
            border: 2px solid #000;
        }
        .card-img-top {
            height: 300px; /* Chiều cao cố định cho hình ảnh */
            object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
        }
        
        
    </style>
     
    
</head>
<body>
    <div class="container-fluid fruite py-5">
        <div class="container py-5">
               <br>
            <h1 class="mb-4">Bookstore</h1>
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <div class="col-xl-3">
                            <div class="input-group w-100 mx-auto d-flex">
                                <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                            </div>
                        </div>
                        <div class="col-6"></div>
                        <div class="col-xl-3">
                            <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                <label for="fruits">Default Sorting:</label>
                                <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                    <option value="volvo">Romantic</option>
                                    <option value="saab">Horror</option>
                                    <option value="opel">Action</option>
                                    <option value="audi">Fiction</option> 
                   
                                    <option value="audi">Adventure</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4>Categories</h4>
                                        <ul class="list-unstyled fruite-categorie">
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#">Romantic</a>
                                                    <span>(3)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#">Horror</a>
                                                    <span>(5)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#">Action</a>
                                                    <span>(2)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#">Fiction</a>
                                                    <span>(8)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#">Advanture</a>
                                                    <span>(5)</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4 class="mb-2">Price</h4>
                                        <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="500" value="0" oninput="amount.value=rangeInput.value">
                                        <output id="amount" name="amount" min-value="0" max-value="500" for="rangeInput">0</output>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <h4 class="mb-3">Best seller</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="row g-4 justify-content-center">
                                <div class="container">
                                    <h2>Our Books</h2>
                                    <div class="row">
                                        <%
                                            BookInfoDAO dao = new BookInfoDAO();
                                            List<BookInfo> bookInfoList = dao.getAllBooksInfo();
                                            for (BookInfo bookInfo : bookInfoList) {
                                                Books book = bookInfo.getBook();
                                        %>
                                        <div class="col-sm-4">
                                            <div class="card" style="margin-bottom: 20px;">
                                                <img src="<%= book.getBook_image() %>" class="card-img-top" alt="Book Image">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%= book.getBook_name() %></h5>
                                                    <p class="card-text"><strong>Author:</strong> <%= bookInfo.getAuthor().getAuthor_name() %></p>
                                 
                                                    <p class="card-text"><strong>Price:</strong> $<%= book.getBook_price() %></p>
                                                    <p class="card-text"><strong>Quantity Available:</strong> <%= book.getBook_quantity_available() %></p>
                                               
                                                <form action="<%= request.getContextPath() %>/AddToCartServlet" method="post">
                                                        <input type="hidden" name="book_id" value="<%= book.getBook_id() %>">
                                                        <button type="submit" class="btn btn-primary">Add To Cart</button>
                                                    </form>

                                                    <a href="/client/layout/ViewProductLayout.jsp?book_id=<%= book.getBook_id() %>" class="btn btn-primary">Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                      <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   
</body>
