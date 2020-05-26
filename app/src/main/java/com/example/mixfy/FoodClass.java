package com.example.mixfy;

public class FoodClass {

    private int img;
    private String name;
    private String last;

    public FoodClass(int img, String name, String last) {
        this.img = img;
        this.name = name;
        this.last = last;
    }

    public int getImg() {
        return img;
    }

    public String getName() {
        return name;
    }

    public String getLast() {
        return last;
    }
}
