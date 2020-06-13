package com.example.mixfy;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import cz.msebera.android.httpclient.Header;


public class ListFFragment extends Fragment {
    FoodClass[] f;
    ListView list;
    AsyncHttpClient client = new AsyncHttpClient();
    ListView Listodo;
    int c;
    ArrayList<String> ingre;
    public ListFFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout fl = (LinearLayout) inflater.inflate(R.layout.fragment_list_f, container, false);
        list = fl.findViewById(R.id.listFoods);
        SharedPreferences numbercat = getActivity().getSharedPreferences("cat", Context.MODE_PRIVATE);
        int cat=numbercat.getInt("cat", 0);
        if (cat!=0){
            getDatabycat(cat);
        }else
        {client.post("http://192.168.1.98/mixfy/getRecipe.php", new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if(statusCode == 200){
                    resultquery(new String(responseBody));
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });}

        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, final int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());

                LayoutInflater inflater = getLayoutInflater();

                View view1 = inflater.inflate(R.layout.dialog_recipes,null);

                builder.setView(view1);

                TextView txtarea = view1.findViewById(R.id.textView7);

                Listodo= view1.findViewById(R.id.listIngre);

                TextView txtname = view1.findViewById(R.id.txtTitle);
                ImageButton btnFav = view1.findViewById(R.id.imageButton3);
                Button btnrea = view1.findViewById(R.id.btnRea),
                        btncan = view1.findViewById(R.id.btnCan);

                txtarea.setText(f[position].getDesc());

                getIngredientes(f[position].getId());
                txtname.setText(f[position].getName());

                final AlertDialog dialog = builder.create();

                btncan.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });

                btnFav.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        SharedPreferences preferences = getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
                        if (!preferences.getString("email", "error").equals("error")){
                            client.post("http://192.168.1.98/mixfy/insertfav.php?id_u=" + preferences.getString("id", "0") +
                                    "&id_r=" + f[position].getId(), new AsyncHttpResponseHandler() {
                                @Override
                                public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                                    Toast.makeText(getContext(), "Se ha agregado a favoritos", Toast.LENGTH_SHORT).show();
                                }

                                @Override
                                public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                                    Toast.makeText(getContext(), "Error inesperado intenetelo de nuevo", Toast.LENGTH_SHORT).show();
                                }
                            });


                        }else {
                            Toast.makeText(getContext(), "Tienes que loguearte para poder marcarlo como favorito", Toast.LENGTH_SHORT).show();
                        }
                    }
                });

                btnrea.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        SharedPreferences preferences = getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
                        if (!preferences.getString("email", "error").equals("error")){
                            Toast.makeText(getContext(), "Se ha marcado como realizada", Toast.LENGTH_SHORT).show();
                        }else {
                            Toast.makeText(getContext(), "Tienes que loguearte para marcarlo como realizada", Toast.LENGTH_SHORT).show();
                        }
                    }
                });

                dialog.show();
            }
        });
        return fl;
    }
    public void resultquery(String r){
        try {
            JSONArray jsonArray = new JSONArray(r);
            f=new FoodClass[jsonArray.length()];
            int c = jsonArray.length();
            for (int i = 0; i<jsonArray.length();i++){
                f[i]=new FoodClass(jsonArray.getJSONObject(i).getInt("id_rec"),jsonArray.getJSONObject(i).getString("imagen"),
                        jsonArray.getJSONObject(i).getString("nombrerec"), jsonArray.getJSONObject(i).getString("descripcion"),
                        String.valueOf(jsonArray.getJSONObject(i).getInt("timeprep")));

            }

            list.setAdapter(new FoodAdapter(getContext(), R.layout.layout_recipes, f));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void getDatabycat(int cat){

        switch (cat){
            case 1:
                getDatabycatphp(6);
                break;
            case 2:
                getDatabycatphp(10);
                break;
            case 3:
                getDatabycatphp(8);
                break;
            case 4:
                getDatabycatphp(7);
                break;
            case 5:
                getDatabycatphp(11);
                break;
            case 6:
                getDatabycatphp(3);
                break;
            case 7:
                getDatabycatphp(9);
                break;
            case 8:
                getDatabycatphp(1);
                break;
            case 9:
                getDatabycatphp(4);
                break;
            case 10:
                getDatabycatphp(5);
                break;
            default:
                Toast.makeText(getContext(), "error inesperado", Toast.LENGTH_SHORT).show();
        }
    }
    public void getDatabycatphp(int cat){
        client.post("http://192.168.1.98/mixfy/getrecipesbycat.php?cat="+cat, new AsyncHttpResponseHandler() {
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

    public void getIngredientes(int id){
        final ArrayList<String> listaRec = new ArrayList<>();
        client.post("http://192.168.1.98/mixfy/getingrerec.php?cat="+id, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if(statusCode == 200){
                    try {
                        JSONArray jsonArray = new JSONArray(new String(responseBody));
                        int c = jsonArray.length();
                        for (int i = 0; i<jsonArray.length();i++){
                            listaRec.add(jsonArray.getJSONObject(i).getString("nombreing"));
                        }

                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
                ArrayAdapter<String> adapter = new ArrayAdapter<String>(getContext(), android.R.layout.simple_list_item_1,listaRec);
                Listodo.setAdapter(adapter);
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });
    }


}

