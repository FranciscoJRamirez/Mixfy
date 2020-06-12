package com.example.mixfy;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.reflect.Field;

public class ResAdapter extends ArrayAdapter<ResClass> {
    Context c;
    int r;
    ResClass[]rc;


    @NonNull
    @Override
    public View getView(int position, View convertView,  ViewGroup parent) {
        ImageView img;
        TextView nom, plat, prec;

        if(convertView == null){
            LayoutInflater linflator = ((Activity)c).getLayoutInflater();
            convertView = linflator.inflate(r,parent,false);
        }
        img=convertView.findViewById(R.id.imgRec);
        nom = convertView.findViewById(R.id.txtNombreRes);
        plat = convertView.findViewById(R.id.txtPlatillo);
        prec = convertView.findViewById(R.id.txtPrecio);


        int resID = getResId(rc[position].getImg(), R.drawable.class);
        img.setImageResource(resID);
        nom.setText(rc[position].getNombreRes());
        plat.setText(rc[position].getPlatillo());
        prec.setText(rc[position].getPrecio());


        return convertView;
    }

    public ResAdapter(@NonNull Context context, int resource, @NonNull ResClass[] objects) {
        super(context, resource, objects);
        this.c=context;
        this.r=resource;
        this.rc=  objects;
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
