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


/**
 * A simple {@link Fragment} subclass.
 */
public class startFragment extends Fragment {
    TextView email, celphone;
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
                singInFragment singInFragment=new singInFragment();
                ft.replace(R.id.rl, singInFragment);
                ft.commit();
            }
        });
        return r;
    }
}
