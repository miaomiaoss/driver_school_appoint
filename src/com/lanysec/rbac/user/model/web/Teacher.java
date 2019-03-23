package com.lanysec.rbac.user.model.web;

public class Teacher {
    private String tea_id;
    private String car_id;
    private String tea_name;
    private Car car;
    public String getTea_id() {
        return this.tea_id;
    }

    public void setTea_id(String tea_id ) {
        this.tea_id = tea_id;
    }

    public String getCar_id() {
        return this.car_id;
    }

    public void setCar_id(String car_id ) {
        this.car_id = car_id;
    }

    public String getTea_name() {
        return this.tea_name;
    }

    public void setTea_name(String tea_name ) {
        this.tea_name = tea_name;
    }
    
    public Car getCar() {
        return this.car;
    }
    
    public void setCar(Car car ) {
        this.car = car;
    }
    
    @Override
    public String toString() {
        return "Teacher [tea_id=" + this.tea_id + ", car_id=" + this.car_id + ", tea_name=" + this.tea_name + ", car="
                + this.car + "]";
    }

    
}
