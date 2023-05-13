/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Order implements Serializable{

    public Order() {
    }
    
    private int id;
    private int quantity;
    private int idPet;
    private int idAcc;
    private int status;
    private Date datebook;
    private Date dateship;

    public Order(int id, int idAcc, int status, Date datebook, Date dateship) {
        this.id = id;
        this.idAcc = idAcc;
        this.status = status;
        this.datebook = datebook;
        this.dateship = dateship;
    }

    public Order(int id, int quantity, int idPet) {
        this.id = id;
        this.quantity = quantity;
        this.idPet = idPet;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdPet() {
        return idPet;
    }

    public void setIdPet(int idPet) {
        this.idPet = idPet;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDatebook() {
        return datebook;
    }

    public void setDatebook(Date datebook) {
        this.datebook = datebook;
    }

    public Date getDateship() {
        return dateship;
    }

    public void setDateship(Date dateship) {
        this.dateship = dateship;
    }
    
    
}
