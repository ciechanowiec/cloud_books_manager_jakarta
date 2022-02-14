<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.logic.Book"%>
<% List<Book> booksList = (List<Book>) request.getAttribute("booksList"); %>
<html>
    <head>
        <title>Books Manager</title>
    </head>
    <body>
        <center>
            <header>
                <h1>Books Manager</h1>
                <h2>
                    <a href="addForm"> Add a new book</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<%=request.getContextPath()%>/index.jsp"> List all books</a>
                </h2>                           
            </header>

            <h3>List of Books</h3>
            <table border="" style="text-align: center; vertical-align: middle;">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
                <% for (Book book : booksList) { %>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td>
                            <% double price = book.getPrice();
                               DecimalFormat priceFormatter = new DecimalFormat("#,###.00");
                               String priceFormatted = priceFormatter.format(price);
                            %>
                            <%= priceFormatted %>
                        </td>
                        <td>                       
                            <form style="display: inline-block;" method="get" action="editForm">
                                <button type="submit" name="idForEdit" value="<%= book.getId() %>">Edit</button>
                            </form>
                            <form style="display: inline-block;" method="get" action="deleteAction">
                                <button type="submit" name="idForDelete" value="<%= book.getId() %>">Delete</button>
                            </form>                                    
                        </td>
                    </tr>    
                <% } %>
            </table>
        </center>
    </body>
</html>