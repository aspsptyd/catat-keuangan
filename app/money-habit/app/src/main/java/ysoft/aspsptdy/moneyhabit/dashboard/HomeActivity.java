package ysoft.aspsptdy.moneyhabit.dashboard;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import ysoft.aspsptdy.moneyhabit.R;
import ysoft.aspsptdy.moneyhabit.SplashActivity;
import ysoft.aspsptdy.moneyhabit.preferences.PreferencesLogin;

public class HomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        Log.e("CEK_SESSION_LOGIN", String.valueOf(PreferencesLogin.getInstance(HomeActivity.this).getSessionLogin()));
    }

    public void LogoutSekarang(View view) {
        PreferencesLogin.getInstance(HomeActivity.this).setSessionLogin(false);

        startActivity(new Intent(HomeActivity.this, SplashActivity.class));
        finish();
    }
}