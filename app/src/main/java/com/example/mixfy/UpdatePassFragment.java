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

public class UpdatePassFragment extends Fragment {
    Button btnSend;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        RelativeLayout re = (RelativeLayout) inflater.inflate(R.layout.fragment_update_pass, container, false);
        TextView txtBack = re.findViewById(R.id.txtBackProfile);
        btnSend = re.findViewById(R.id.btnSendNewPass);

        txtBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                startFragment profile = new startFragment();
                ft.replace(R.id.rl, profile);
                //ft.addToBackStack("back");
                ft.commit();
            }
        });

        btnSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "Enviar", Toast.LENGTH_SHORT).show();
            }
        });

        return re;
    }
}
