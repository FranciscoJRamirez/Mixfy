package com.example.mixfy;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.getbase.floatingactionbutton.FloatingActionButton;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;
import org.w3c.dom.Text;

import cz.msebera.android.httpclient.Header;


/**
 * A simple {@link Fragment} subclass.
 */
public class startFragment extends Fragment {
    TextView email, celphone,txtFavs,txtHelp, promo, real, visit;
    AsyncHttpClient client;
    String id_u;
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
        promo = r.findViewById(R.id.txtNPromos);
        real = r.findViewById(R.id.txtNRec);
        visit = r.findViewById(R.id.txtNRest);
        txtFavs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getContext(), FavActivity.class);
                intent.putExtra("id_user", id_u);
                startActivity(intent);

            }
        });
        txtHelp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getContext(), help.class);
                startActivity(intent);
            }
        });
        final SharedPreferences preferences = this.getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);

        email.setText(preferences.getString("email", "error"));
        celphone.setText(preferences.getString("celphone", "error"));
        id_u=preferences.getString("id", "0");
        promo.setText(preferences.getString("promo", "error"));
        real.setText(preferences.getString("realizadas", "error"));
        visit.setText(preferences.getString("visitadas", "error"));




        final FloatingActionButton fab_profile = (FloatingActionButton) r.findViewById(R.id.fab_profile);
        fab_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                UpdateProfileFragment help = new UpdateProfileFragment();
                ft.replace(R.id.rl, help);
                ft.commit();
            }
        });

        final FloatingActionButton fab_pass = (FloatingActionButton) r.findViewById(R.id.fab_pass);
        fab_pass.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                UpdatePassFragment help = new UpdatePassFragment();
                ft.replace(R.id.rl, help);
                ft.commit();
            }
        });
        final FloatingActionButton fab_exit = (FloatingActionButton) r.findViewById(R.id.fab_exit);
        fab_exit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                preferences.edit().clear().commit();
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                signInFragment singInFragment=new signInFragment();
                ft.replace(R.id.rl, singInFragment);
                ft.commit();
            }
        });

        return r;
    }
}
