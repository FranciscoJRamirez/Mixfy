package com.example.mixfy;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;


/**
 * A simple {@link Fragment} subclass.
 */
public class ProfileFragment extends Fragment {

    public ProfileFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        FrameLayout fl= (FrameLayout)inflater.inflate(R.layout.fragment_profile, container, false);
        SharedPreferences preferences = this.getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
        boolean session = preferences.getBoolean("session", false);
        if (!session) {
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            signInFragment singInFragment = new signInFragment();
            ft.replace(R.id.framel, singInFragment);
            ft.commit();
        }else{
            FragmentTransaction ft1 = getFragmentManager().beginTransaction();
            startFragment startFragment = new startFragment();
            ft1.replace(R.id.framel, startFragment);
            ft1.commit();
        }
        return fl;
    }
}
