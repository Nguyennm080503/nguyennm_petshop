/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class Pet implements Serializable{
    private int idPet;
    private String name;
    private int idCate;
    private String catename;
    private String img;
    private float price;
    private String des;
    private int status;

    public Pet() {
    }

    public Pet(int idPet, String name, int idCate, String catename, String img, float price, String des, int status) {
        this.idPet = idPet;
        this.name = name;
        this.idCate = idCate;
        this.catename = catename;
        this.img = img;
        this.price = price;
        this.des = des;
        this.status = status;
    }

    public Pet(int idCate, String catename) {
        this.idCate = idCate;
        this.catename = catename;
    }
    

    public int getIdPet() {
        return idPet;
    }

    public void setIdPet(int idPet) {
        this.idPet = idPet;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
