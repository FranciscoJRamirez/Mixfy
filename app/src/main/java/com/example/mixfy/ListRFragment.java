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
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;
import org.w3c.dom.Text;

import java.lang.reflect.Field;

import cz.msebera.android.httpclient.Header;


public class ListRFragment extends Fragment {
    ResClass []f;

    ListView list;
    AsyncHttpClient client = new AsyncHttpClient();
    public ListRFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout fl = (LinearLayout) inflater.inflate(R.layout.fragment_list_r, container, false);
        list=fl.findViewById(R.id.listres);
        SharedPreferences numbercat = getActivity().getSharedPreferences("cat", Context.MODE_PRIVATE);
        int cat=numbercat.getInt("cat", 0);
        if (cat!=0){
            getDatabycat(cat);
        }else
        {client.post("http://192.168.1.98/mixfy/getPlatillo.php", new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200){
                    resultquery(new String (responseBody));
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });}
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
                LayoutInflater inflater = getLayoutInflater();
                View view1 = inflater.inflate(R.layout.dialog_rest,null);
                ImageView imager = view1.findViewById(R.id.imageView9);
                TextView txtname = view1.findViewById(R.id.textView5);
                final TextView txctcant = view1.findViewById(R.id.textView6);
                ImageButton btnright = view1.findViewById(R.id.imageButton2);
                ImageButton btnleft = view1.findViewById(R.id.imageButton);
                Button btnPedir = view1.findViewById(R.id.button3);
                Button btnCancel = view1.findViewById(R.id.button4);
                int resID = getResId(f[position].getImg(), R.drawable.class);
                imager.setImageResource(resID);
                txtname.setText(f[position].getPlatillo());
                btnright.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txctcant.setText(String.valueOf(Integer.parseInt(txctcant.getText().toString())+1));
                    }
                });
                btnleft.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (Integer.parseInt(txctcant.getText().toString())<=0){
                            Toast.makeText(getContext(), "No baje el limite permitido", Toast.LENGTH_SHORT).show();
                        }else{
                            txctcant.setText(String.valueOf(Integer.parseInt(txctcant.getText().toString())-1));
                        }
                    }
                });
                builder.setView(view1);
                final AlertDialog dialog = builder.create();
                btnCancel.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });
                btnPedir.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        SharedPreferences preferences = getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
                        if (!preferences.getString("email", "error").equals("error")){
                            if (Integer.parseInt(txctcant.getText().toString())<=0){

                                Toast.makeText(getContext(), "Tienes que indicar la cantidad", Toast.LENGTH_SHORT).show();

                            }else{

                                Toast.makeText(getContext(), "EL pedido estará listo en 15 minutos", Toast.LENGTH_SHORT).show();
                                dialog.dismiss();

                            }
                        }else {
                            Toast.makeText(getContext(), "Tienes que loguearte para poder pedir", Toast.LENGTH_SHORT).show();
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
            f=new ResClass[jsonArray.length()];

            for (int i = 0; i<jsonArray.length();i++){
                f[i]=new ResClass(jsonArray.getJSONObject(i).getString("imagen"), jsonArray.getJSONObject(i).getString("restaurante"), String.valueOf(jsonArray.getJSONObject(i).getString("nombre")),
                        jsonArray.getJSONObject(i).getString("precio"));

            }

            list.setAdapter(new ResAdapter(getContext(), R.layout.layout_rest, f));
        }catch(Exception e){
            e.printStackTrace();
            Toast.makeText(getContext(), "fail", Toast.LENGTH_SHORT).show();
        }
    }
    public static int getResId(String resName, Class<?> c) {

        try {
            Field idField = c.getDeclaredField(resName);
            return idField.getInt(idField);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
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
        client.post("http://192.168.1.98/mixfy/getPlatillobycat.php?cat="+cat, new AsyncHttpResponseHandler() {
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
