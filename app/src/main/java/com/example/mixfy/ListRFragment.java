package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;


public class ListRFragment extends Fragment {

    ResClass[]listRes = {
      new ResClass(R.drawable.filete, "Mariscos Charly's", "Filete empanizado", "99"),
      new ResClass(R.drawable.pizza, "Domino's Funtes Mares", "Pizza", "80"),
      new ResClass(R.drawable.boneless, "Buffalucas Fuentes Mares", "Boneless", "100"),
      new ResClass(R.drawable.alitas, "Buffalucas Fuentes Mares", "Alitas", "100"),
      new ResClass(R.drawable.camarones, "Mariscos Charly's", "Camarones", "90"),
      new ResClass(R.drawable.hambu, "Buffalucas Fuentes Mares", "Hamburguesa", "40")


};
    ListView list;
    public ListRFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout fl = (LinearLayout) inflater.inflate(R.layout.fragment_list_r, container, false);
        list=fl.findViewById(R.id.listres);
        list.setAdapter(new ResAdapter(getContext(), R.layout.layout_rest, listRes));
        return fl;
    }
}
