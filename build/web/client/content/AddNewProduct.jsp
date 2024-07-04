
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
