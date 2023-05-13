/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataDao;

import Object.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ADMIN
 */
public class OrderDao {

    public static ArrayList<Order> getAllOrder() throws Exception {
        ArrayList<Order> kq = new ArrayList<Order>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Orders";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    Date datebook = rs.getDate("OrderDate");
                    Date dateship = rs.getDate("ShipDate");
                    int idAcc = rs.getInt("AccID");
                    int status = rs.getInt("Status");
                    Order order = new Order(id, idAcc, status, datebook, dateship);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Order> getAllOrderAndPet(int id, int idacc) throws Exception {
        ArrayList<Order> kq = new ArrayList<Order>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Orders o JOIN OrderDetail od ON o.ID =od.IDorders\n"
                    + "where o.Status = ? and o.AccID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setInt(2, idacc);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int idPet = rs.getInt("IDPet");
                    int quantity = rs.getInt("Quantity");
                    Order order = new Order(id, quantity, idPet);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Order> getAllOrderByStatus(int id, int idacc) throws Exception {
        ArrayList<Order> kq = new ArrayList<Order>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Orders\n"
                    + "where Status = ? and AccID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setInt(2, idacc);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    Date datebook = rs.getDate("OrderDate");
                    Date dateship = rs.getDate("ShipDate");
                    int status = rs.getInt("Status");
                    Order order = new Order(id, idacc, status, datebook, dateship);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateStatus(int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Orders\n"
                    + "set Status = ?\n"
                    + "where ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Order> getOrderByID(int id) throws Exception {
        ArrayList<Order> kq = new ArrayList<Order>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from OrderDetail\n"
                    + "where IDorders = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int idPet = rs.getInt("IDPet");
                    int quantity = rs.getInt("Quantity");
                    Order order = new Order(id, quantity, idPet);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertOrder(int id, HashMap<Integer, Integer> cart) throws Exception {
        int kq = 0;
        String s = "";
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            Date orderdate = new Date(System.currentTimeMillis());
            long orderTime = orderdate.getTime();
            long shipTime = orderTime + (5 * 24 * 60 * 60 * 1000);
            Date shipdate = new Date(shipTime);
            s = "insert into Orders(AccID,OrderDate,ShipDate,Status) values(?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setDate(2, orderdate);
            pst.setDate(3, shipdate);
            pst.setInt(4, 1);
            kq = pst.executeUpdate();
            if (kq == 1) {
                s = "select top 1 ID \n"
                        + "from Orders\n"
                        + "order by ID desc";
                PreparedStatement pst2 = cn.prepareStatement(s);
                ResultSet rs = pst2.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("ID");
                        for (int idPet : cart.keySet()) {
                            int quantity = cart.get(idPet);
                            s = "insert into OrderDetail(IDorders, IDPet, Quantity) values (?,?,?)";
                            PreparedStatement pst3 = cn.prepareStatement(s);
                            pst3.setInt(1, orderID);
                            pst3.setInt(2, idPet);
                            pst3.setInt(3, quantity);
                            kq = pst3.executeUpdate();
                        }
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static int insertInformation(String name, String phone, String address, int role, HashMap<Integer, Integer> cart) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            String s = "insert into Account(FullName, Phone, Address, Role) values (?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setString(2, phone);
            pst.setNString(3, address);
            pst.setInt(4, 2);
            kq = pst.executeUpdate();
            if (kq == 1) {
                s = "select top 1 ID\n"
                        + "from Account\n"
                        + "Order by ID desc";
                PreparedStatement pst2 = cn.prepareStatement(s);
                ResultSet rs = pst2.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idacc = rs.getInt("ID");
                        Date orderdate = new Date(System.currentTimeMillis());
                        long orderTime = orderdate.getTime();
                        long shipTime = orderTime + (5 * 24 * 60 * 60 * 1000);
                        Date shipdate = new Date(shipTime);
                        s = "insert into Orders(AccID,OrderDate,ShipDate,Status) values(?,?,?,?)";
                        PreparedStatement pst4 = cn.prepareStatement(s);
                        pst4.setInt(1, idacc);
                        pst4.setDate(2, orderdate);
                        pst4.setDate(3, shipdate);
                        pst4.setInt(4, 1);
                        kq = pst4.executeUpdate();
                        if (kq == 1) {
                            s = "select top 1 ID \n"
                                    + "from Orders\n"
                                    + "order by ID desc";
                            PreparedStatement pst3 = cn.prepareStatement(s);
                            rs = pst3.executeQuery();
                            if (rs != null) {
                                while (rs.next()) {
                                    int orderID = rs.getInt("ID");
                                    for (int idPet : cart.keySet()) {
                                        int quantity = cart.get(idPet);
                                        s = "insert into OrderDetail(IDorders, IDPet, Quantity) values (?,?,?)";
                                        PreparedStatement pst5 = cn.prepareStatement(s);
                                        pst5.setInt(1, orderID);
                                        pst5.setInt(2, idPet);
                                        pst5.setInt(3, quantity);
                                        kq = pst5.executeUpdate();
                                    }
                                }
                            }
                        }
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }
}
