package Connector;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author macbook
 */
public class SingletonConnect {
    private static Connector instance;
    
    public static Connector getInstance() {
        if (instance == null) {
            instance = new Connector();
        }
        return instance;
    }
}
