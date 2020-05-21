package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

public class PasswordRFragment extends Fragment {

    Button btnSend;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        RelativeLayout re = (RelativeLayout) inflater.inflate(R.layout.fragment_password_r, container, false);
        TextView txtBack = re.findViewById(R.id.txtBack);
        btnSend = re.findViewById(R.id.cirSendButton);

        txtBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                signInFragment signIn = new signInFragment();
                ft.replace(R.id.frame, signIn);
                //ft.addToBackStack("back");
                ft.commit();
            }
        });

        btnSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "Se le enviará un mensaje para restablecer su contraseña.", Toast.LENGTH_SHORT).show();
            }
        });

        return re;
    }
}
