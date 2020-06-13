package com.example.mixfy;

public class OffersClass {
    private int id;
    private String image;
    private int available;

    public OffersClass(int id, String image, int available) {
        this.id = id;
        this.image = image;
        this.available = available;
    }

    public String getImage() {
        return image;
    }

    public int getId() {
        return id;
    }

    public int getAvailable() {
        return available;
    }
}
