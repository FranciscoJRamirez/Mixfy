package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class ListOFragment extends Fragment {
    OffersClass [] imagenes={
            new OffersClass(R.drawable.pbuf1),
            new OffersClass(R.drawable.pbuf2),
            new OffersClass(R.drawable.pch1),
            new OffersClass(R.drawable.pch2),
            new OffersClass(R.drawable.pdom1),
            new OffersClass(R.drawable.pdom2)
    };
    ListView list;
    public ListOFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        FrameLayout fl = (FrameLayout)inflater.inflate(R.layout.fragment_list_o, container, false);
        list = fl.findViewById(R.id.listOffers);
        list.setAdapter(new offers(getContext(), R.layout.layout_offers, imagenes));

        return fl;
    }
}
