/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gym;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 840
 */
public class Getconnection {
    public Connection co=null;
    public void getconnections()throws ClassNotFoundException,SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        co = DriverManager.getConnection("jdbc:mysql://localhost:3306/GymPack","root","");
    }
}
