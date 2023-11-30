package Connector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
    private Connection conn = null;

    // Constructor
    public Connector() {
        initializeConnection();
    }

    // Method to initialize the database connection
    private void initializeConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try {
                conn = DriverManager.getConnection("jdbc:sqlserver://sql.bsite.net\\MSSQL2016;encrypt=false;databaseName=giakhuong0703_Cinema;user=giakhuong0703_Cinema;password=khuong@07032003");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get the initialized connection
    public Connection getConnection() {
        return conn;
    }

    // Method to close the connection
    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
