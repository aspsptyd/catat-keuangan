package ysoft.aspsptdy.moneyhabit;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.Handler;

import ysoft.aspsptdy.moneyhabit.function.GeneralFunctions;
import ysoft.aspsptdy.moneyhabit.preferences.PreferencesLogin;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        Handler tungguJeda = new Handler();
        tungguJeda.postDelayed(() -> GeneralFunctions.getInstance(SplashActivity.this).checkUserSession(PreferencesLogin.getInstance(SplashActivity.this).getSessionLogin(), SplashActivity.this), 2300);
    }
}