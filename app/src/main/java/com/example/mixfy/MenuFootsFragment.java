package com.example.mixfy;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Toast;


/**
 * A simple {@link Fragment} subclass.
 */
public class MenuFootsFragment extends Fragment {
    Button rec, res;
    Spinner spinner, spinnerin;
    boolean slide=true;
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
        spinner = ll.findViewById(R.id.SpinnerCat);
        spinnerin = ll.findViewById(R.id.SpinnerIng);
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                SharedPreferences numberselected = getActivity().getSharedPreferences("cat", Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = numberselected.edit();
                editor.putInt("cat", position);
                editor.commit();
                slidelist();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        spinnerin.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        slidelist();
        res.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                res.setBackgroundResource(R.drawable.boton_select_left);
                rec.setBackgroundResource(R.drawable.boton_noselect_right);
                slide=false;
                slidelist();
            }
        });
        rec.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                rec.setBackgroundResource(R.drawable.boton_select);
                res.setBackgroundResource(R.drawable.boton_noselect);
                slide=true;
                slidelist();
            }
        });

        return ll;
    }
    public void slidelist(){
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        if(slide) {
            ListFFragment r = new ListFFragment();

            ft.replace(R.id.frameList, r);
        }else{
            ListRFragment f = new ListRFragment();
            ft.replace(R.id.frameList, f);
        }
        //ft.addToBackStack("back");
        ft.commit();
    }
}
