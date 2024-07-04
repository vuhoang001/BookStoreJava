
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="DAO.BooksDAO" %>
<%@page import="DAO.CategoriesDAO" %>
<%@ page import="entity.Books" %>
<%--<%@ page import="entity.Author" %>
--%><%@ page import="entity.Categories" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    BooksDAO booksDAO = new BooksDAO();
    List<Books> booksList = booksDAO.getAllBooksWithDetails();
    CategoriesDAO cateDao = new CategoriesDAO();
    List<Categories> categoriesList = cateDao.getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>book</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản Lý Sách</h2>
                        </div>
                        <div class="col-sm-6">
                            <!--<a href="/bansach/client/content/AddNewBook.jsp"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>-->
                               <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>		
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>

                            <th>Book_id</th>
                            <th>Book_name</th>
                            <th>Author_name</th>
                            <th>Category_name</th>
                            <th>Book_description</th>
                            <th>Book_price</th>
                            <th>Book_image</th>
                            <th>book_quantity_available</th>
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
                            <td>
                                <a href="edit?bid="  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="${pageContext.request.contextPath}/delete?bid=${book.book_id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                     <%
                        }
                     %>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
        <a href="/bansach/client/index.jsp" button type="button" class="btn btn-primary">Back to home</a>

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
                                <%
                                 for (Categories category : categoriesList) {
                            %>
                                
                                    <option value="${category.category_id}">${category.category_name}</option>
                                
                                <% 
                                    }
                                %>
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
    <!-- Edit Modal HTML -->
    <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">						
                        <h4 class="modal-title">Edit Book</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control" required>
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
                <input type="submit" class="btn btn-info" value="Save">
            </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">						
                    <h4 class="modal-title">Delete Book</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
</a>
<script src="js/manager.js" type="text/javascript"></script>
</body>
</html>