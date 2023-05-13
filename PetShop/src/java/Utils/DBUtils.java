/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ADMIN
 */
public class DBUtils {
    public static Connection getConnection() throws Exception{
        Connection cn = null;
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost:1433;databasename=PetShop";
        Class.forName(driver);
        cn = DriverManager.getConnection(url, "sa", "12345");
        return cn;
    }
}
