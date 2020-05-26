package com.example.mixfy;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import com.google.android.material.tabs.TabLayout;

public class MainActivity extends AppCompatActivity {
    TabLayout tabLayout;
    ViewPager viewPager;
    PagerAdapter pagerAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tabLayout =  (TabLayout) findViewById(R.id.taplayout);
        viewPager = (ViewPager) findViewById(R.id.viewpager);
        user user = new user();
        pagerAdapter = new PagerAdapter(getSupportFragmentManager());
        pagerAdapter.addFragment(new ListOFragment(),"Ofertas");
        pagerAdapter.addFragment(new MenuFootsFragment(),"Comidas");
        pagerAdapter.addFragment(new ProfileFragment(), "Perfil");

        viewPager.setPageTransformer(true, new DepthPageTransformer());
        viewPager.setAdapter(pagerAdapter);

        tabLayout.setupWithViewPager(viewPager);

        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                switch (tab.getPosition()){
                    case 0:
                        getWindow().setStatusBarColor(Color.parseColor("#014E7D"));
                    case 1:
                        getWindow().setStatusBarColor(Color.parseColor("#014E7D"));
                    case 2:
                        getWindow().setStatusBarColor(Color.parseColor("#014E7D"));
                        break;
                }
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.option1) {
            System.exit(0);
            return true;
        }
        return super.onOptionsItemSelected(item);
    }



}
