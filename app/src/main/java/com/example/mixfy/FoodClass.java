package com.example.mixfy;

public class FoodClass {

    private String img;
    private String name;
    private String last;

    public FoodClass(String img, String name, String last) {
        this.img = img;
        this.name = name;
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
}
