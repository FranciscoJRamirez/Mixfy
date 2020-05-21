package com.example.mixfy;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

import org.w3c.dom.Text;


/**
 * A simple {@link Fragment} subclass.
 */
public class startFragment extends Fragment {
    TextView email, celphone,txtFavs,txtHelp;
    Button btnSignout;
    public startFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        RelativeLayout r = (RelativeLayout)inflater.inflate(R.layout.fragment_start, container, false);
        user user = new user();
        txtFavs = r.findViewById(R.id.txtFavs);
        txtHelp = r.findViewById(R.id.txtAyuda);
        email = r.findViewById(R.id.txtCorreo);
        celphone = r.findViewById(R.id.txtCelular);
        btnSignout = r.findViewById(R.id.btnSignOut);
        final SharedPreferences preferences = this.getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);

        email.setText(preferences.getString("email", "error"));
        celphone.setText(preferences.getString("celphone", "error"));
        btnSignout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                preferences.edit().clear().commit();
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                signInFragment singInFragment=new signInFragment();
                ft.replace(R.id.rl, singInFragment);
                ft.commit();
            }
        });

        /*txtFavs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                FavsFragment favs = new FavsFragment();
                ft.replace(R.id.frame, favs);
                // ft.addToBackStack("back");
                ft.commit();
            }
        });

        txtHelp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                HelpFragment help = new HelpFragment();
                ft.replace(R.id.frame, help);
                // ft.addToBackStack("back");
                ft.commit();
            }
        });*/
        return r;
    }
}
