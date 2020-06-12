package com.example.mixfy;

import android.app.AlertDialog;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

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
        client.post("http://192.168.1.98/mixfy/getPlatillo.php", new AsyncHttpResponseHandler() {
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
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());

                LayoutInflater inflater = getLayoutInflater();

                View view1 = inflater.inflate(R.layout.dialog_rest,null);
                ImageView imager = view1.findViewById(R.id.imageView9);
                TextView txtname = view1.findViewById(R.id.textView5);

                int resID = getResId(f[position].getImg(), R.drawable.class);
                imager.setImageResource(resID);
                txtname.setText(f[position].getPlatillo());
                builder.setView(view1);

                final AlertDialog dialog = builder.create();
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

}
