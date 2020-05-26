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


public class FoodAdapter extends ArrayAdapter<FoodClass> {

    Context c;
    int r;
    FoodClass[]a;

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        ImageView imgen;
        TextView n, l;

        if(convertView == null){
            LayoutInflater linflator = ((Activity)c).getLayoutInflater();
            convertView = linflator.inflate(r,parent,false);
        }

        imgen = convertView.findViewById(R.id.imgRec);
        n = convertView.findViewById(R.id.txtNombreRec);
        l = convertView.findViewById(R.id.txtTiempo);

        imgen.setImageResource(a[position].getImg());
        n.setText(a[position].getName());
        l.setText(a[position].getLast());
        return convertView;
    }

    public FoodAdapter(Context context, int resource, FoodClass[] objects) {
        super(context, resource, objects);
        this.c=context;
        this.r=resource;
        this.a = objects;

    }


}
