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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/addForm.css" media="screen">    
    <link rel="icon" href="<%=request.getContextPath()%>/favicon/favicon.png">
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
    <section class="u-clearfix u-section-1" id="sec-afb9">
      <div class="u-clearfix u-sheet u-sheet-1">
        <a href="<%=request.getContextPath()%>/index.jsp" class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-1">list all books</a>
        <a href="https://github.com/ciechanowiec/books_manager" class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-2" target="_blank">about</a>
        <a href="addForm" class="u-black u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-text-hover-white u-text-white u-btn-3">add a new book</a>
      </div>
    </section>
    <section class="u-clearfix u-section-2" id="carousel_5be8">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width-xs u-form u-form-1">
          <form action="addAction" method="get" class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" style="padding: 10px" source="custom" name="form-4">
            <div class="u-form-group u-label-top u-form-group-1">
              <label for="text-bce7" class="u-label u-spacing-0 u-text-black u-label-1">Title:</label>
              <input type="text" id="text-bce7" name="title" maxlength="120" value="" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-6 u-text-black u-white" required="required" autofocus="autofocus">
            </div>
            <div class="u-form-group u-label-top u-form-group-2">
              <label for="text-3c56" class="u-label u-spacing-0 u-text-black u-label-2">Author:</label>
              <input type="text" id="text-3c56" name="author" value="" maxlength="120" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-6 u-text-black u-white" required="required">              
            </div>
            <div class="u-form-group u-label-top u-form-group-3">
              <label for="text-a15b" class="u-label u-spacing-0 u-text-black u-label-3">Price:</label>
              <input type="number" step=0.01 max="999999999" id="text-a15b" name="price" value="" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-6 u-text-black u-white" required="required">              
            </div>
            <div class="u-align-center u-form-group u-form-submit u-label-top">              
              <button class="u-border-2 u-border-black u-btn u-btn-submit u-button-style u-hover-black u-none u-btn-1"
              type="submit" value="save"
              >save</button>
            </div>
          </form>
        </div>
      </div>
    </section>
    
    <footer class="u-align-center u-clearfix u-footer" id="sec-53d4"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>

  </body>
</html>