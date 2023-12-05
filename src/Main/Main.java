/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;
import java.sql.Connection;
import Connector.Connector;

/**
 *
 * @author ADMIN
 */
public class Main {
    public static void main(String[] args) {
        Connector conn = Connector.getInstance();
        
        System.out.println(conn.getConnection());
    }
}
