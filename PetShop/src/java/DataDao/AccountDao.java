/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataDao;

import Object.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AccountDao {

    public static Account getAccount(String account, String password) throws Exception {
        Connection cn = Utils.DBUtils.getConnection();
        Account kq = null;
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Account = ? and Password = ? Collate Latin1_General_CS_AI";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("Email");
                    String acc = rs.getString("Account");
                    String pwd = rs.getString("Password");
                    String name = rs.getNString("FullName");
                    String phone = rs.getString("Phone");
                    int role = rs.getInt("Role");
                    int status = rs.getInt("Status");
                    String address = rs.getNString("Address");
                    kq = new Account(id, email, acc, pwd, name, phone, role, status, address);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertAccount(String email, String name, String account, String password, String phone, int role, int status, String address) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Account(Email, FullName, Account, Password, Phone, Role, Status, Address) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            pst.setNString(2, name);
            pst.setString(3, account);
            pst.setString(4, password);
            pst.setString(5, phone);
            pst.setInt(6, role);
            pst.setInt(7, status);
            pst.setNString(8, address);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Account checkAccount(String account, String mail) throws Exception {
        Connection cn = Utils.DBUtils.getConnection();
        Account kq = null;
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Account = ? or Email = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            pst.setString(2, mail);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("Email");
                    String acc = rs.getString("Account");
                    String pwd = rs.getString("Password");
                    String name = rs.getNString("FullName");
                    String phone = rs.getString("Phone");
                    int role = rs.getInt("Role");
                    int status = rs.getInt("Status");
                    String address = rs.getNString("Address");
                    kq = new Account(id, email, acc, pwd, name, phone, role, status, address);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllAccount() throws Exception {
        ArrayList<Account> kq = new ArrayList<Account>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select * \n"
                    + "from Account";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("Email");
                    String acc = rs.getString("Account");
                    String pwd = rs.getString("Password");
                    String name = rs.getNString("FullName");
                    String phone = rs.getString("Phone");
                    int role = rs.getInt("Role");
                    int status = rs.getInt("Status");
                    String address = rs.getNString("Address");
                    Account user = new Account(id, email, acc, pwd, name, phone, role, status, address);
                    kq.add(user);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateRoleAndStatus(int role, int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account\n"
                    + "Set Role = ?, Status = ?\n"
                    + "where ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, role);
            pst.setInt(2, status);
            pst.setInt(3, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllAccountBySearch(String txt) throws Exception {
        ArrayList<Account> kq = new ArrayList<Account>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Fullname like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + txt + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("Email");
                    String acc = rs.getString("Account");
                    String pwd = rs.getString("Password");
                    String name = rs.getNString("FullName");
                    String phone = rs.getString("Phone");
                    int role = rs.getInt("Role");
                    int status = rs.getInt("Status");
                    String address = rs.getNString("Address");
                    Account user = new Account(id, email, acc, pwd, name, phone, role, status, address);
                    kq.add(user);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Account getAccountById(int id) throws Exception {
        Connection cn = Utils.DBUtils.getConnection();
        Account kq = null;
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String email = rs.getString("Email");
                    String acc = rs.getString("Account");
                    String pwd = rs.getString("Password");
                    String name = rs.getNString("FullName");
                    String phone = rs.getString("Phone");
                    int role = rs.getInt("Role");
                    int status = rs.getInt("Status");
                    String address = rs.getNString("Address");
                    kq = new Account(id, email, acc, pwd, name, phone, role, status, address);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeAccount(String account, String pwd, String name, String phone, String address, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account\n"
                    + "set Account =?, Password =?,FullName=?,Phone=?,Address=?\n"
                    + "where ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            pst.setString(2, pwd);
            pst.setNString(3, name);
            pst.setString(4, phone);
            pst.setNString(5, address);
            pst.setInt(6, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

}
