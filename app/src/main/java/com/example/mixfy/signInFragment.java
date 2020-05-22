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
import android.widget.TextView;
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

public class signInFragment extends Fragment {

    private View.OnClickListener clic;
    Button btnSignin;
    EditText editemail, editpass;
    RequestQueue rq;
    JsonRequest jr;
    String email, pass, name, lastnamep, lastnamem, celphone;
    boolean session;

    public View.OnClickListener getClic() {
        return clic;
    }

    public void setClic(View.OnClickListener clic) {
        this.clic = clic;
    }

    public signInFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        RelativeLayout r = (RelativeLayout) inflater.inflate(R.layout.fragment_sign_in, container, false);
        TextView register = r.findViewById(R.id.textRegister);
        TextView password = r.findViewById(R.id.textPassR);
        btnSignin = r.findViewById(R.id.cirLoginButton);
        editemail = r.findViewById(R.id.editTextEmail);
        editpass = r.findViewById(R.id.editTextPassword);
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                signUpFragment signp = new signUpFragment();
                ft.replace(R.id.frame, signp);
                //ft.addToBackStack("back");
                ft.commit();
            }
        });

        password.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction ft = getFragmentManager().beginTransaction();
                PasswordRFragment pass = new PasswordRFragment();
                ft.replace(R.id.frame, pass);
               // ft.addToBackStack("back");
                ft.commit();
            }
        });

        btnSignin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                login("http://192.168.1.98/mixfy/login.php?email="+ editemail.getText().toString()+"" +
                        "&password="+editpass.getText().toString());

            }
        });

        return r;
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
