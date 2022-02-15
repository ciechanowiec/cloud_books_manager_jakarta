<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.logic.Book"%>
<% List<Book> booksList = (List<Book>) request.getAttribute("booksList"); %> 
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Cloud Books Manager">
    <meta name="description" content="Cloud Books Manager which allows to browse and edit stored data.">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <meta property="og:title" content="Cloud Books Manager">
    <meta property="og:description" content="Cloud Books Manager which allows to browse and edit stored data.">
    <title>Cloud Books Manager</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" media="screen">    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/booksList.css" media="screen">    
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700">
    <meta name="theme-color" content="#4a5e8b">
    <meta property="og:type" content="website">
  </head>

  <body class="u-body u-xl-mode">
    <header class="u-clearfix u-header" id="sec-e826" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">
      <div class="u-clearfix u-sheet u-valign-middle-xs u-sheet-1">
          <h2 class="u-align-center u-text u-text-1">CLOUD BOOKS MANAGER</h2>
      </div>
    </header>
    <section class="u-clearfix u-section-1" id="sec-9a03">
      <div class="u-clearfix u-sheet u-valign-middle-sm u-valign-middle-xl u-valign-middle-xs u-sheet-1">    
        <a href="<%=request.getContextPath()%>/index.jsp" class="u-black u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-text-hover-white u-text-white u-btn-1">list all books</a>
        <a href="https://github.com/ciechanowiec/books_manager" class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-2" target="_blank">about</a>
        <a href="addForm" class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-3">add a new book</a>
      </div>
    </section>
    <section class="u-clearfix u-section-2" id="carousel_5be8">
      <div class="u-clearfix u-sheet u-valign-top-lg u-valign-top-xl u-sheet-1">
        <div class="u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="7.2%">
              <col width="30.55%">
              <col width="22.97%">
              <col width="18.21%">
              <col width="10.54%">
              <col width="10.54%">
            </colgroup>
            <thead class="u-align-center u-black u-custom-font u-heading-font u-table-header u-table-header-1">
              <tr style="height: 31px;">
                <th class="u-table-cell">id</th>
                <th class="u-table-cell">title</th>
                <th class="u-table-cell">author</th>
                <th class="u-table-cell">price</th>
                <th colspan="2" class="u-table-cell">actions</th>                
              </tr>
            </thead>
            <tbody class="u-align-center u-table-body u-text-black u-table-body-1">

                <% for (Book book : booksList) { %>              
                    <tr style="height: 71px;">

                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-7"><%= book.getId() %></td>
                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-8"><%= book.getTitle() %></td>
                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-9"><%= book.getAuthor() %></td>
                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-10">
                            <% double price = book.getPrice();
                               DecimalFormat priceFormatter = new DecimalFormat("#,###.00");
                               String priceFormatted = priceFormatter.format(price);
                            %>
                            $<%= priceFormatted %>
                        </td>
                        
                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-11">                  
                            <form method="get" action="editForm">
                                <button class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-btn-1"
                                type="submit" name="idForEdit" value="<%= book.getId() %>"                   
                                >edit</button>                                      
                            </form>            
                        </td>

                        
                        <td class="u-border-1 u-border-grey-70 u-border-no-left u-border-no-right u-table-cell u-table-cell-12">                  
                            <form method="get" action="deleteAction">
                                <button class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-btn-2"
                                type="submit" name="idForDelete" value="<%= book.getId() %>"                   
                                >delete</button>                                      
                            </form>      
                        </td>                

                    </tr>
                <% } %>

            </tbody>
          </table>
        </div>
      </div>
    </section>
  
    <footer class="u-align-center u-clearfix u-footer" id="sec-53d4"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>