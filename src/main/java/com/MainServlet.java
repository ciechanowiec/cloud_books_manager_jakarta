package com;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.Book;
import com.logic.DataManager;

public class MainServlet extends HttpServlet {

    private DataManager dataManager;

    @Override
    public void init() throws ServletException {
        String dbURL = getServletContext().getInitParameter("dbURL");
        String dbUsername = getServletContext().getInitParameter("dbUsername");
        String dbPassword = getServletContext().getInitParameter("dbPassword");        
        this.dataManager = new DataManager(dbURL, dbUsername, dbPassword);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                          throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                         throws ServletException, IOException {        
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/addForm":                     
                    showAddForm(request, response);                    
                    break;
                case "/addAction":                    
                    addAction(request, response);
                    break;
                case "/editForm":                    
                    showEditForm(request, response);
                    break;
                case "/editAction":                    
                    editAction(request, response);
                    break;
                case "/deleteAction":                    
                    deleteAction(request, response);
                    break;
                default:                    
                    listBooks(request, response);            
            }             
        } catch (Exception e) {
            e.printStackTrace();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/errorPage.jsp");   

            dispatcher.forward(request, response);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
                           throws SQLException, ServletException, IOException {
        List<Book> booksList = this.dataManager.listAllBooks();
        request.setAttribute("booksList", booksList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/booksList.jsp");  

        dispatcher.forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) 
                             throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/addForm.jsp");       

        dispatcher.forward(request, response);
    }

    private void addAction(HttpServletRequest request, HttpServletResponse response) 
                           throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        Book book = new Book(title, author, price);
        this.dataManager.addBook(book);

        response.sendRedirect("mainservlet");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
                              throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("idForEdit"));
        Book book = this.dataManager.getBook(id);
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/editForm.jsp");     

        dispatcher.forward(request, response);
    }

    private void editAction(HttpServletRequest request, HttpServletResponse response) 
                            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        Book book = new Book(id, title, author, price);        
        this.dataManager.editBook(book);
        
        response.sendRedirect("mainservlet");
    }    
        
    private void deleteAction(HttpServletRequest request, HttpServletResponse response) 
                              throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("idForDelete"));
        Book book = this.dataManager.getBook(id);
        this.dataManager.deleteBook(book);

        response.sendRedirect("mainservlet");
    }
    
}