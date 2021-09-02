package com.web.project.helper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class THE_CONNECTION {
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static final String username="root";
    private static final String password="7379538307@gM";
    private static final String dataconn="jdbc:mysql://localhost:3306/webproject";
    private static Connection con;
   

    public static Connection getConnection() {
        try {
            if(con==null){
                 Class.forName(driverName);
            try {
                con = DriverManager.getConnection(dataconn, username, password);
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
            }
           
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return con;
    }
}
    
    

