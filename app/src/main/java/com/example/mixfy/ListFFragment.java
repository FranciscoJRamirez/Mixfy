package com.example.mixfy;

import android.app.AlertDialog;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;


public class ListFFragment extends Fragment {
    FoodClass[] f;
    ListView list;
    AsyncHttpClient client = new AsyncHttpClient();
    int c;
    public ListFFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        LinearLayout fl = (LinearLayout) inflater.inflate(R.layout.fragment_list_f, container, false);
        list = fl.findViewById(R.id.listFoods);
        client.post("http://192.168.1.98/mixfy/getRecipe.php", new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if(statusCode == 200){
                    resultquery(new String(responseBody));
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

                View view1 = inflater.inflate(R.layout.dialog_recipes,null);

                builder.setView(view1);

                TextView txtarea = view1.findViewById(R.id.txtArea);

                EditText txtLodo = view1.findViewById(R.id.txtingre);

                TextView txtname = view1.findViewById(R.id.txtTitle);

                txtname.setText(f[position].getName());

                final AlertDialog dialog = builder.create();
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
                /*f[i].setImg(1);
                f[i].setName(jsonArray.getJSONObject(i).getString("nombrerec"));
                f[i].setLast(String.valueOf(jsonArray.getJSONObject(i).getInt("timeprep")));*/
                f[i]=new FoodClass(jsonArray.getJSONObject(i).getString("imagen"), jsonArray.getJSONObject(i).getString("nombrerec"), String.valueOf(jsonArray.getJSONObject(i).getInt("timeprep")));

            }

            list.setAdapter(new FoodAdapter(getContext(), R.layout.layout_recipes, f));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

