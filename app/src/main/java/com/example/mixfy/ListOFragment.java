package com.example.mixfy;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

import cz.msebera.android.httpclient.Header;


/**
 * A simple {@link Fragment} subclass.
 */
public class ListOFragment extends Fragment {
    OffersClass [] imagenes;
    ListView list;
    AsyncHttpClient client = new AsyncHttpClient();
    public ListOFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        FrameLayout fl = (FrameLayout)inflater.inflate(R.layout.fragment_list_o, container, false);
        list = fl.findViewById(R.id.listOffers);
        searchPromos();

        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, final int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
                builder.setTitle("Utilizar Promoción");
                builder.setMessage("¿Quieres utilizar esta promo?")
                        .setPositiveButton("Sí", new DialogInterface.OnClickListener(){
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                SharedPreferences preferences = getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
                                if(!preferences.getString("email", "error").equals("error")){
                                    client.post("http://192.168.1.98/mixfy/updatePromo.php?id=" + imagenes[position].getId(), new AsyncHttpResponseHandler() {
                                        @Override
                                        public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                                            Toast.makeText(getContext(), "Promoción cobrada", Toast.LENGTH_SHORT).show();
                                            searchPromos();
                                        }

                                        @Override
                                        public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                                            Toast.makeText(getContext(), "Hubo un error al procesar la solicitud, intentelo mas tarde", Toast.LENGTH_SHORT).show();
                                        }
                                    });
                                }else {
                                    Toast.makeText(getContext(), "Tienes que loguearte para poder cobrar la promoción", Toast.LENGTH_SHORT).show();
                                }
                            }
                        })
                        .setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                Toast.makeText(getContext(),"Cancelado...",Toast.LENGTH_SHORT).show();
                                dialog.dismiss();
                            }
                        })
                        .setCancelable(false)
                        .show();
            }
        });

        return fl;
    }
    public void resultquery(String r){
        try {
            JSONArray jsonArray = new JSONArray(r);
            imagenes=new OffersClass[jsonArray.length()];

            for (int i = 0; i<jsonArray.length();i++){
                imagenes[i]=new OffersClass(jsonArray.getJSONObject(i).getInt("id_cupon"),jsonArray.getJSONObject(i).getString("imagen"),
                        jsonArray.getJSONObject(i).getInt("disponible"));

            }

            list.setAdapter(new offers(getContext(), R.layout.layout_offers, imagenes));
        }catch(Exception e){
            e.printStackTrace();
            Toast.makeText(getContext(), "fail", Toast.LENGTH_SHORT).show();
        }
    }
    public void searchPromos (){
        client.post("http://192.168.1.98/mixfy/getPromo.php", new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200){
                    resultquery(new String (responseBody));
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });
    }
}
