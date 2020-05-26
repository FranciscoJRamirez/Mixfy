package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

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
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        ListFFragment f = new ListFFragment();
        ft.replace(R.id.frameList, f);
        //ft.addToBackStack("back");
        ft.commit();
        res.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                res.setBackgroundResource(R.drawable.boton_select_left);
                rec.setBackgroundResource(R.drawable.boton_noselect_right);
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                ListRFragment r = new ListRFragment();
                ft.replace(R.id.frameList, r);
                //ft.addToBackStack("back");
                ft.commit();

            }
        });
        rec.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                rec.setBackgroundResource(R.drawable.boton_select);
                res.setBackgroundResource(R.drawable.boton_noselect);
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                ListFFragment f = new ListFFragment();
                ft.replace(R.id.frameList, f);
                //ft.addToBackStack("back");
                ft.commit();
            }
        });

        return ll;
    }
}
