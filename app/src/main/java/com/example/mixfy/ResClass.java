package com.example.mixfy;

public class ResClass {
    private int img;
    private String nombreRes, platillo, precio;


    public ResClass(int img, String nombreRes, String platillo, String precio) {
        this.img = img;
        this.nombreRes = nombreRes;
        this.platillo = platillo;
        this.precio = precio;
    }

    public int getImg() {
        return img;
    }

    public String getNombreRes() {
        return nombreRes;
    }

    public String getPlatillo() {
        return platillo;
    }

    public String getPrecio() {
        return precio;
    }
}
