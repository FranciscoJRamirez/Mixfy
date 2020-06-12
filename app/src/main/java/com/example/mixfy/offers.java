package com.example.mixfy;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.util.ArrayList;

public class offers extends ArrayAdapter<OffersClass> {
    Context c;
    int r;
    OffersClass[] img;

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        ImageView imgen;

        if(convertView == null){
            LayoutInflater linflator = ((Activity)c).getLayoutInflater();
            convertView = linflator.inflate(r,parent,false);
        }

        imgen = convertView.findViewById(R.id.imageView2);
        int resID = getResId(img[position].getImage(), R.drawable.class);
        imgen.setImageResource(resID);

        return convertView;
    }



    public offers(Context c, int r, OffersClass[] img) {
        super(c,r,img);
        this.c = c;
        this.r = r;
        this.img = img;
    }
    public static int getResId(String resName, Class<?> c) {

        try {
            Field idField = c.getDeclaredField(resName);
            return idField.getInt(idField);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
