
package com.web.project.entities;


public class Category {
    private int cId;
    private String cName;
    private String cDiscription;

    public Category(int cId, String cName, String cDiscription) {
        this.cId = cId;
        this.cName = cName;
        this.cDiscription = cDiscription;
    }

    public Category() {
    }

    public Category(String cName, String cDiscription) {
        this.cName = cName;
        this.cDiscription = cDiscription;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDiscription() {
        return cDiscription;
    }

    public void setcDiscription(String cDiscription) {
        this.cDiscription = cDiscription;
    }
    
}
