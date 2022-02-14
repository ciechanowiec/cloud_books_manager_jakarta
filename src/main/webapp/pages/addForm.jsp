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
                <h3>Add a book</h3>                
            </header>
            <form method="get" action="addAction">
                <table border="" style="text-align: center; font-size: 18;">
                    <tr height="40px">
                        <td width="100"><b><label for="title">Title:</label></b></td>
                        <td width="300" ><input style="font-size: 18;" type="text" size="27" name="title" id="title" value="" maxlength="120" required/></td>
                    </tr>
                    <tr height="40px">
                        <td width="100"><b><label for="author">Author:</label></b></td>
                        <td width="300" ><input style="font-size: 18;" type="text" size="27" name="author" id="author" value="" maxlength="120" required/></td>
                    </tr>
                    <tr height="40px">
                        <td width="100"><b><label for="price">Price:</label></b></td>
                        <td align="left" width="300" >&nbsp<input style="font-size: 18; width: 130px;" step=0.01 max="999999999" type="number" name="price" id="price" value="" required/></td>                        
                    </tr>
                    <tr height="40px">
                        <td colspan="2"><input type="submit" value="Save" style="font-size: 18;"/></td>
                    </tr>
                </table>
            </form>            
        </center>
    </body>
</html>
