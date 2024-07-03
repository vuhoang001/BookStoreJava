<%-- 
    Document   : ViewProductContent
    Created on : Jun 28, 2024, 5:23:45 PM
    Author     : baokhanh
--%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="DAO.BooksDAO" %>
<%@ page import="entity.Books" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    BooksDAO booksDAO = new BooksDAO();
    List<Books> booksList = booksDAO.getAllBooksWithDetails();
%>
<!DOCTYPE html>
<html>
    <head>
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
      
        </style>
    </head>
    <body>
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
        
                <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản Lý Sách</h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="/client/layout/AddNewProduct.jsp"  class="btn btn-success" > <span>Add New Product</span></a>
                            <a href="#deleteEmployeeModal" class="btn btn-danger" > <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                              <th></th>
                            <th>Book id</th>
                            <th>Book name</th>
                            <th>Author name</th>
                            <th>Book description</th>
                            <th>Book price</th>
                            <th>Book image</th>
                            <th>Quantity</th>   
                            <th>Actions</th>
                        </tr>
                    </thead>
                 <tbody>
                                <%
                                    for (Books book : booksList) {
                                %>
                                <tr>
                                    <td><%= book.getBook_id() %></td>
                                    <td><%= book.getBook_name() %></td>
                                    <td><%= book.getAuthor_id() %></td>
                                    <td><%= book.getCategory_id() %></td>
                                    <td><%= book.getBook_description() %></td>
                                    <td><%= book.getBook_price() %></td>
                                    <td><img src="<%= book.getBook_image() %>" class="book-image"></td>
                                    <td><%= book.getBook_quantity_available() %></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                </table>
              
            </div>
            <a href="/client/index.jsp" button type="button" class="btn btn-primary">Back to home</a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Books</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Author</label>
                                <select name="author" class="form-select" aria-label="Default select example">
                                    <c:forEach begin="1" end="3" var="o">
                                        <option value="1">sach</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach begin="1" end="3" var="o">
                                        <option value="1">Sach</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Quantity</label>
                                <textarea name="quantity" class="form-control" required></textarea>
                            </div>
                            
                            

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
   
        </div>
     

                </div>
            </div>
        </div>
    </body>
</html>
