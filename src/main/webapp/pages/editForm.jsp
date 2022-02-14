<%@ page import="com.logic.Book"%>
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
                <h3>Edit a book</h3>                
            </header>
            <form method="get" action="editAction">
                <% Book book = (Book) request.getAttribute("book"); %>
                <input type="hidden" name="id" id="id" value="<%= book.getId()%>">
                <table border="" style="text-align: center; font-size: 18;">
                    <tr height="40px">
                        <td width="100"><b><label for="title">Title:</label></b></td>
                        <td width="300" ><input style="font-size: 18;" type="text" size="27" name="title" id="title" value="<%= book.getTitle()%>" maxlength="120" required/></td>
                    </tr>
                    <tr height="40px">
                        <td width="100"><b><label for="author">Author:</label></b></td>
                        <td width="300" ><input style="font-size: 18;" type="text" size="27" name="author" id="author" value="<%= book.getAuthor()%>" maxlength="120" required/></td>
                    </tr>
                    <tr height="40px">
                        <td width="100"><b><label for="price">Price:</label></b></td>                        
                        <td align="left" width="300" >&nbsp<input style="font-size: 18; width: 130px;" step=0.01 max="999999999" type="number" name="price" id="price" value="<%= book.getPrice()%>" required/></td>                        
                    </tr>
                    <tr height="40px">
                        <td colspan="2"><input type="submit" value="Save" style="font-size: 18;"/></td>
                    </tr>
                </table>
            </form>            
        </center>
    </body>
</html>
