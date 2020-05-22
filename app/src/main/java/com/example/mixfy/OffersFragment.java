package com.example.mixfy;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;


/**
 * A simple {@link Fragment} subclass.
 */
public class OffersFragment extends Fragment {
    RequestQueue rq;
    JsonRequest jr;
    public OffersFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        FrameLayout rl = (FrameLayout) inflater.inflate(R.layout.fragment_offers, container, false);
        getImg("http://192.168.1.98/mixfy/offers.php");

        return rl;
    }
    private void getImg (String URL){

        StringRequest sr = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                JSONObject jsonObject=null;

                if (!response.isEmpty()){

                    try {
                        jsonObject = new JSONObject(response);

                        String celphone=(jsonObject.getString("imagen"));
                        Toast.makeText(getContext(), jsonObject.getString("imagen"), Toast.LENGTH_SHORT).show();
                    }catch (JSONException e){

                    }

                }else {
                    Toast.makeText(getContext(), "User or password incorrect", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getContext(), "Server error", Toast.LENGTH_SHORT).show();
            }
        }
        ){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> parameters = new HashMap<String, String>();
                return parameters;
            }
        };
        rq = Volley.newRequestQueue(getContext());
        rq.add(sr);
    }
}
