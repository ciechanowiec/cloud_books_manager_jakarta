package com.logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataManager {

    private String dbURL;
    private String dbUsername;
    private String dbPassword;
    private Connection connection;

    public DataManager(String dbURL, String dbUsername, String dbPassword) {
        this.dbURL = dbURL;
        this.dbUsername = dbUsername;
        this.dbPassword = dbPassword;
    }

    private void connect() throws SQLException {
        if (this.connection == null || this.connection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {                
                e.printStackTrace();
            }
            this.connection = DriverManager.getConnection(this.dbURL, this.dbUsername, this.dbPassword);
        } 
    }

    private void disconnect() throws SQLException {
        if (this.connection != null || !this.connection.isClosed()) {
            this.connection.close();
        }        
    }
        
    public List<Book> listAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sqlCommand = "SELECT * FROM books;";
        connect();
        
        Statement statement = this.connection.createStatement();
        ResultSet results = statement.executeQuery(sqlCommand);
        
        while (results.next()) {
            int id = results.getInt("id");            
            String title = results.getString("title");
            String author = results.getString("author");
            double price = results.getDouble("price");
            books.add(new Book(id, title, author, price));
        }
        
        statement.close();
        results.close();
        disconnect();
        
        return books;        
    }
    
    public boolean addBook(Book book) throws SQLException {
        String sqlCommand = "INSERT INTO books(title, author, price) VALUES(?, ?, ?);";
        connect();

        PreparedStatement statement = this.connection.prepareStatement(sqlCommand);
        statement.setString(1, book.getTitle());
        statement.setString(2, book.getAuthor());
        statement.setDouble(3, book.getPrice());

        boolean isSuccessfulInsert = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        
        return isSuccessfulInsert;
    }

    public boolean editBook(Book book) throws SQLException {
        String sqlCommand = "UPDATE books SET title = ?, author = ?, price = ? WHERE id = ?;";
        connect();
        
        PreparedStatement statement = this.connection.prepareStatement(sqlCommand);
        statement.setString(1, book.getTitle());
        statement.setString(2, book.getAuthor());
        statement.setDouble(3, book.getPrice());
        statement.setInt(4, book.getId());

        boolean isSuccessfulUpdate = statement.executeUpdate() > 0;
        statement.close();
        disconnect();

        return isSuccessfulUpdate;
    }
    
    public boolean deleteBook(Book book) throws SQLException {
        String sqlCommand = "DELETE from books WHERE id = ?;";
        connect();

        PreparedStatement statement = this.connection.prepareStatement(sqlCommand);
        statement.setInt(1, book.getId());
        
        boolean isSuccessfulDeletion = statement.executeUpdate() > 0;        
        statement.close();
        disconnect();

        return isSuccessfulDeletion;
    }
    

    public Book getBook(int id) throws SQLException {
        Book book = null;
        String sqlCommand = "SELECT * FROM books WHERE id = ?;";        
        connect();

        PreparedStatement statement = this.connection.prepareStatement(sqlCommand);
        statement.setInt(1, id);

        ResultSet result = statement.executeQuery();
        if (result.next()) {
            String title = result.getString("title");
            String author = result.getString("author");
            double price = result.getDouble("price");
            book = new Book(id, title, author, price);
        }

        statement.close();
        result.close();
        disconnect();

        return book;
    }

    public void clearData() throws SQLException {
        connect();
        Statement statement = this.connection.createStatement();
        statement.executeUpdate("DELETE FROM books;");
        statement.executeUpdate("ALTER TABLE books AUTO_INCREMENT = 1");
        statement.close();
        disconnect();
    }

    public void insertDefaultData() throws SQLException {
        connect();
        Statement statement = this.connection.createStatement();
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('The World as Will and Representation', 'Arthur Schopenhauer', '78.99');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('Mathematical Principles of Natural Philosophy', 'Isaac Newton', '54.29');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('The Cosmic Connection', 'Carl Sagan', '43.39');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('The Count of Monte Cristo', 'Alexandre Dumas', '13.99');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('Dialogue Concerning the Two Chief World Systems', 'Galileo Galilei', '350.00');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('On the Revolutions of Heavenly Spheres', 'Nicolaus Copernicus', '150.00');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('Lucius Seneca', 'Moral Letters to Lucilius', '63.29');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('James Watson', 'The Double Helix: A Personal Account of the Discovery of the Structure of DNA', '35.99');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('Albert Einstein', 'Relativity: The Special and General Theory', '39.99');");
        statement.executeUpdate("INSERT INTO `bookstore`.`books` (`title`, `author`, `price`) VALUES ('Wolfgang Goethe', 'Faust', '67.19');");
        statement.close();
        disconnect();
    }
    
}
