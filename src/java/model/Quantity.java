/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author nueng
 */
@Entity
@Table(name = "QUANTITY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Quantity.findAll", query = "SELECT q FROM Quantity q"),
    @NamedQuery(name = "Quantity.findById", query = "SELECT q FROM Quantity q WHERE q.id = :id"),
    @NamedQuery(name = "Quantity.findByQuantity", query = "SELECT q FROM Quantity q WHERE q.quantity = :quantity"),
    @NamedQuery(name = "Quantity.findByIdcart", query = "SELECT q FROM Quantity q WHERE q.idcart = :idcart")})
public class Quantity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Size(max = 10)
    @Column(name = "QUANTITY")
    private String quantity;
    @Column(name = "IDCART")
    private Integer idcart;

    public Quantity() {
    }

    public Quantity(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Integer getIdcart() {
        return idcart;
    }

    public void setIdcart(Integer idcart) {
        this.idcart = idcart;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Quantity)) {
            return false;
        }
        Quantity other = (Quantity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Quantity[ id=" + id + " ]";
    }
    
}
