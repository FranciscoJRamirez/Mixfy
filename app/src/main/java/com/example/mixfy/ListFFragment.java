package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;


public class ListFFragment extends Fragment {
    FoodClass[]food={
            new FoodClass(R.drawable.espaguetti, "Spaghetti", "25 minutos"),
            new FoodClass(R.drawable.gelatina, "Gelatina de yogurt", "10 minutos"),
    };
    ListView list;
    public ListFFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout fl = (LinearLayout) inflater.inflate(R.layout.fragment_list_f, container, false);
        list = fl.findViewById(R.id.listFoods);
        list.setAdapter(new FoodAdapter(getContext(), R.layout.layout_recipes, food));
        return fl;
    }
}
