package ysoft.aspsptdy.moneyhabit;

import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

import ysoft.aspsptdy.moneyhabit.dashboard.HomeActivity;
import ysoft.aspsptdy.moneyhabit.function.LoginFunctions;
import ysoft.aspsptdy.moneyhabit.preferences.PreferencesLogin;

public class LoginActivity extends AppCompatActivity {

    Context contextLogin;

    Button btnMasukAplikasi;

    EditText edtUsername, edtPasskey;

    TextView txvKeRegister, txvLblNotify;

    String getMessageResponse;

    ProgressBar loadingProgress;

    public static final String RESPONSE_REQUEST_LOGIN = "id.habit.money.RESPONSE_REQUEST_LOGIN";
    public static final String ENABLE_BUTTON_LOGIN = "id.habit.money.ENABLE_BUTTON_LOGIN";
    public static final String VISIBLE_PROGRESS_LOAD = "id.habit.money.VISIBLE_PROGRESS_LOAD";
    public static final String GONE_PROGRESS_LOAD = "id.habit.money.GONE_PROGRESS_LOAD";

    private final BroadcastReceiver broadcastLogin = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();

            switch (action) {
                case VISIBLE_PROGRESS_LOAD:
                    loadingProgress.setVisibility(View.VISIBLE);
                    break;
                case GONE_PROGRESS_LOAD:
                    loadingProgress.setVisibility(View.GONE);
                    break;
                case RESPONSE_REQUEST_LOGIN:
                    enableBtnLogin();

                    ArrayList<String> arrayRespon = PreferencesLogin.getInstance(contextLogin).getResponHeaderLogin();
                    Log.e("LOGIN_ACTIVITY", "ARRAY RESPON LOGIN >> " + arrayRespon);
                    getMessageResponse = arrayRespon.get(2);

                    if ((arrayRespon.get(0).contains("404"))) {
                        LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(GONE_PROGRESS_LOAD));

                        txvLblNotify.setVisibility(View.VISIBLE);
                        txvLblNotify.setText(getMessageResponse);

                        txvLblNotify.setBackgroundResource(R.drawable.bg_lbl_notice);
                        txvLblNotify.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_user_invalid, 0, 0, 0);
                        txvLblNotify.setPadding(40, 25, 40, 25);
                        txvLblNotify.setTextColor(Color.parseColor("#928E88"));

                        enableInputanDanAksi();
                    } else if ((arrayRespon.get(0).contains("500"))) {
                        LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(GONE_PROGRESS_LOAD));

                        txvLblNotify.setVisibility(View.VISIBLE);
                        txvLblNotify.setText(getMessageResponse);

                        txvLblNotify.setBackgroundResource(R.drawable.bg_lbl_danger);
                        txvLblNotify.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_cannot_define, 0, 0, 0);
                        txvLblNotify.setPadding(40, 25, 40, 25);
                        txvLblNotify.setTextColor(Color.parseColor("#ffffff"));

                        enableInputanDanAksi();
                    } else if ((arrayRespon.get(0).contains("503"))) {
                        LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(GONE_PROGRESS_LOAD));

                        txvLblNotify.setVisibility(View.VISIBLE);
                        txvLblNotify.setText(getMessageResponse);

                        txvLblNotify.setBackgroundResource(R.drawable.bg_lbl_danger);
                        txvLblNotify.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_cannot_define, 0, 0, 0);
                        txvLblNotify.setPadding(40, 25, 40, 25);
                        txvLblNotify.setTextColor(Color.parseColor("#ffffff"));

                        enableInputanDanAksi();
                    } else if ((arrayRespon.get(0).contains("405"))) {
                        LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(GONE_PROGRESS_LOAD));

                        txvLblNotify.setVisibility(View.VISIBLE);
                        txvLblNotify.setText(getMessageResponse);

                        txvLblNotify.setBackgroundResource(R.drawable.bg_lbl_danger);
                        txvLblNotify.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_cannot_define, 0, 0, 0);
                        txvLblNotify.setPadding(40, 25, 40, 25);
                        txvLblNotify.setTextColor(Color.parseColor("#ffffff"));

                        enableInputanDanAksi();
                    } else if ((arrayRespon.get(0).contains("200"))) {

                        txvLblNotify.setVisibility(View.VISIBLE);
                        txvLblNotify.setText(getMessageResponse);

                        txvLblNotify.setBackgroundResource(R.drawable.bg_lbl_success);
                        txvLblNotify.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_verified, 0, 0, 0);
                        txvLblNotify.setPadding(40, 25, 40, 25);
                        txvLblNotify.setTextColor(Color.parseColor("#ffffff"));

                        Handler accessKeDashboard = new Handler();
                        accessKeDashboard.postDelayed(() -> {
                            PreferencesLogin.getInstance(LoginActivity.this).setSessionLogin(true);

                            enableInputanDanAksi();

                            LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(GONE_PROGRESS_LOAD));
                            startActivity(new Intent(LoginActivity.this, HomeActivity.class));
                            finish();
                        }, 3000);
                    }

                    Handler hideNotifyLogin = new Handler();
                    hideNotifyLogin.postDelayed(() -> {
                        txvLblNotify.setVisibility(View.GONE);
                    }, 5000);
                    break;
                case ENABLE_BUTTON_LOGIN:
                    enableBtnLogin();
                    break;
            }
        }
    };

    private void registBroadcastLogin() {
        IntentFilter filterBroadcastLogin = new IntentFilter();
        filterBroadcastLogin.addAction(RESPONSE_REQUEST_LOGIN);
        filterBroadcastLogin.addAction(ENABLE_BUTTON_LOGIN);
        filterBroadcastLogin.addAction(VISIBLE_PROGRESS_LOAD);
        filterBroadcastLogin.addAction(GONE_PROGRESS_LOAD);
        LocalBroadcastManager.getInstance(contextLogin).registerReceiver(broadcastLogin, filterBroadcastLogin);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        contextLogin = LoginActivity.this;

        btnMasukAplikasi = findViewById(R.id.btMasukAplikasi);
        edtUsername = findViewById(R.id.etUsername);
        edtPasskey = findViewById(R.id.etPasskey);
        txvKeRegister = findViewById(R.id.tvToRegister);
        txvLblNotify = findViewById(R.id.lblNotifyLogin);
        loadingProgress = findViewById(R.id.progressLoading);

        registBroadcastLogin();

        btnMasukAplikasi.setOnClickListener(view -> {
            /*Disable Sementara Inputan dan Aksi*/
            edtUsername.setEnabled(false);
            edtPasskey.setEnabled(false);
            btnMasukAplikasi.setEnabled(false);
            btnMasukAplikasi.setBackgroundTintList(contextLogin.getResources().getColorStateList(R.color.silver));
            btnMasukAplikasi.setTextColor(Color.parseColor("#ACA3A3"));

            LocalBroadcastManager.getInstance(contextLogin).sendBroadcast(new Intent(VISIBLE_PROGRESS_LOAD));

            disableBtnLogin();

            String username = edtUsername.getText().toString().trim();
            String passkey = edtPasskey.getText().toString().trim();

            LoginFunctions.getInstance(contextLogin).prosesLogin(username, passkey);
        });

        txvKeRegister.setOnClickListener(view -> {
            Toast.makeText(contextLogin, "Fitur ini sedang dalam pengembangan, Belum tersedia!", Toast.LENGTH_SHORT).show();
        });
    }

    private void disableBtnLogin() {
        btnMasukAplikasi.setTextColor(Color.WHITE);
        btnMasukAplikasi.setEnabled(false);
        btnMasukAplikasi.setText("Harap tunggu...");
    }

    private void enableBtnLogin() {
        btnMasukAplikasi.setEnabled(true);
        btnMasukAplikasi.setText("Masuk ke Aplikasi");
    }

    private void enableInputanDanAksi() {
        edtUsername.setEnabled(true);
        edtPasskey.setEnabled(true);
        btnMasukAplikasi.setEnabled(true);
        btnMasukAplikasi.setBackgroundTintList(contextLogin.getResources().getColorStateList(R.color.green));
        btnMasukAplikasi.setTextColor(Color.parseColor("#ffffff"));
    }
}