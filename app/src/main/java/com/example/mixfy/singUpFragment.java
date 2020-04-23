package com.example.mixfy;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;


public class singUpFragment extends Fragment {
    EditText editname, editcel, editemail, editpass;
    String name, lastnamep, lastnamem, email, celphone;
    boolean session;
    Button  btnsignup ;
    public singUpFragment() {
        // Required empty public constructor
    }
    RequestQueue rq;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        RelativeLayout rl = (RelativeLayout)inflater.inflate(R.layout.fragment_sing_up, container, false);
        editname=rl.findViewById(R.id.editTextName);
        editemail=rl.findViewById(R.id.editTextEmail);
        editcel=rl.findViewById(R.id.editTextCel);
        editpass=rl.findViewById(R.id.editTextPass);
        btnsignup=rl.findViewById(R.id.cirLoginButton);

        btnsignup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                signUpUser("http://192.168.1.112/mixfy/insertUser.php");
            }
        });
        return rl;
    }

    private void signUpUser(String URL){
        StringRequest sr = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                user user= new user();
                JSONObject jsonObject=null;

                if (!response.isEmpty()){

                    login("http://192.168.1.112/mixfy/login.php");

                }else {
                    Toast.makeText(getContext(), "Error trying request a new user", Toast.LENGTH_SHORT).show();
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
                parameters.put("nombre", editname.getText().toString());
                parameters.put("apellidop", "");
                parameters.put("apellidom", "");
                parameters.put("correo", editemail.getText().toString());
                parameters.put("telefono", editcel.getText().toString());
                parameters.put("contrasena", editpass.getText().toString());
                return parameters;
            }
        };
        rq = Volley.newRequestQueue(getContext());
        rq.add(sr);
    }

    private void login (String URL){

        StringRequest sr = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                user user= new user();
                JSONObject jsonObject=null;

                if (!response.isEmpty()){

                    try {
                        jsonObject = new JSONObject(response);
                        Toast.makeText(getContext(), "Sucessfully access", Toast.LENGTH_SHORT).show();
                        name=(jsonObject.getString("nombre"));
                        lastnamep=(jsonObject.getString("apellidop"));
                        lastnamem=(jsonObject.getString("apellidom"));
                        email=(jsonObject.getString("correo"));
                        celphone=(jsonObject.getString("telefono"));
                        session =(true);
                        savePreference();
                        FragmentTransaction ft = getFragmentManager().beginTransaction();
                        startFragment startFragment= new startFragment();
                        ft.replace(R.id.frame, startFragment);
                        ft.commit();
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
                parameters.put("email", editemail.getText().toString());
                parameters.put("password", editpass.getText().toString());
                return parameters;
            }
        };
        rq = Volley.newRequestQueue(getContext());
        rq.add(sr);
    }

    private void savePreference (){
        SharedPreferences preferences = this.getActivity().getSharedPreferences("Login", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor =preferences.edit();
        editor.putString("name", name);
        editor.putString("lastnamep", lastnamep);
        editor.putString("lastnamem", lastnamem);
        editor.putString("email", email);
        editor.putString("celphone", celphone);
        editor.putBoolean("session", session);
        editor.commit();
    }
}
