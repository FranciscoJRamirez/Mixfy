package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;


/**
 * A simple {@link Fragment} subclass.
 */
public class MenuFootsFragment extends Fragment {
    Button rec, res;
    public MenuFootsFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout ll = (LinearLayout)inflater.inflate(R.layout.fragment_menu_foots, container, false);
        rec = ll.findViewById(R.id.btnRecipes);
        res = ll.findViewById(R.id.btnRest);

        res.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                res.setBackgroundResource(R.drawable.boton_select_left);
                rec.setBackgroundResource(R.drawable.boton_noselect_right);
            }
        });
        rec.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                rec.setBackgroundResource(R.drawable.boton_select);
                res.setBackgroundResource(R.drawable.boton_noselect);
            }
        });

        return ll;
    }
}
