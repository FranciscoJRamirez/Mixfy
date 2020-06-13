package com.example.mixfy;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;

public class FavActivity extends AppCompatActivity {
    AsyncHttpClient client=new AsyncHttpClient();
    ListView list;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fav);
        list=findViewById(R.id.lisfav);
        String id = getIntent().getStringExtra("id_user");
        Log.wtf("lamo", id);
        client.post("http://192.168.1.98/mixfy/getfav.php?id=" + getIntent().getStringExtra("id_user"), new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode==200){

                    try {
                        JSONArray jsonArray = new JSONArray(new String(responseBody));
                        ArrayList<String> s = new ArrayList<>();
                        for (int i =0; i<jsonArray.length(); i++){
                            s.add(jsonArray.getJSONObject(i).getString("nombrerec"));

                        }
                         ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, s);
                        list.setAdapter(adapter);
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }else{
                    Toast.makeText(FavActivity.this, "No se encontraron favoritos", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                Toast.makeText(FavActivity.this, "No se encontraron favoritos", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
