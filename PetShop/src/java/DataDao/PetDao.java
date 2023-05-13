/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataDao;

import Object.Pet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class PetDao {

    public static ArrayList<Pet> getAllPet() throws Exception {
        ArrayList<Pet> kq = new ArrayList<Pet>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Pet p JOIN Category c ON p.IDCate=c.ID";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    Pet pet = new Pet(id, name, idCate, catename, img, price, des, status);
                    kq.add(pet);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Pet> getAllPetBySearch(String txtpet) throws Exception {
        ArrayList<Pet> kq = new ArrayList<Pet>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Pet p Join Category c On p.IDCate=c.ID\n"
                    + "where p.Name like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + txtpet + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    Pet pet = new Pet(id, name, idCate, catename, img, price, des, status);
                    kq.add(pet);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updatePet(String name, String img, String des, float price, int id, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Pet\n"
                    + "Set Name = ?, Image = ?, Description = ?, Price = ?, Status = ?\n"
                    + "where ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setString(2, img);
            pst.setNString(3, des);
            pst.setFloat(4, price);
            pst.setInt(5, status);
            pst.setInt(6, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertNewPet(String name, String img, String description, float price, int type, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Pet(Name,Description,Image,Price,Status,IDCate) values (?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setNString(2, description);
            pst.setString(3, img);
            pst.setFloat(4, price);
            pst.setInt(5, status);
            pst.setInt(6, type);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Pet> getAllCate() throws Exception {
        ArrayList<Pet> kq = new ArrayList<Pet>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Category";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String catename = rs.getNString("CategoryName");
                    Pet pet = new Pet(id, catename);
                    kq.add(pet);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Pet checkCate(String name) throws Exception {
        Pet kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Category\n"
                    + "where CategoryName = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String catename = rs.getNString("CategoryName");
                    kq = new Pet(id, catename);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertCate(String name) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Category(CategoryName) values(?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Pet checkPet(String name) throws Exception {
        Pet kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Pet p Join Category c On p.IDCate = c.ID\n"
                    + "where Name = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String namePet = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    kq = new Pet(id, namePet, idCate, catename, img, price, des, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Pet> getAllPetByCate(int id) throws Exception {
        ArrayList<Pet> kq = new ArrayList<Pet>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Pet p JOIN Category c ON p.IDCate = c.ID\n"
                    + "where c.ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String name = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    Pet pet = new Pet(id, name, idCate, catename, img, price, des, status);
                    kq.add(pet);
                }
            }
        }
        return kq;
    }

    public static Pet getPetById(int id) throws Exception {
        Pet kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Pet p JOIN Category c ON p.IDCate = c.ID\n"
                    + "where p.ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String namePet = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    kq = new Pet(id, namePet, idCate, catename, img, price, des, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Pet> get5Pet() throws Exception{
        ArrayList<Pet> kq = new ArrayList<Pet>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select top 5*\n"
                    + "from Pet p JOIN Category c ON p.IDCate=c.ID";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getNString("Name");
                    String img = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    String des = rs.getNString("Description");
                    int status = rs.getInt("Status");
                    int idCate = rs.getInt("IDCate");
                    String catename = rs.getString("CategoryName");
                    Pet pet = new Pet(id, name, idCate, catename, img, price, des, status);
                    kq.add(pet);
                }
            }
            cn.close();
        }
        return kq;
    }

}
