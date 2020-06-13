package com.example.mixfy;

public class FoodClass {

    private int id;
    private String img;
    private String name;
    private String desc;
    private String last;


    public FoodClass(int id, String img, String name, String desc, String last) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.desc = desc;
        this.last = last;
    }

    public FoodClass() {
    }

    public String getImg() {
        return img;
    }

    public String getName() {
        return name;
    }

    public String getLast() {
        return last;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public int getId() {
        return id;
    }

    public String getDesc() {
        return desc;
    }
}
