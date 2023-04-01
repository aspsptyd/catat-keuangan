package ysoft.aspsptdy.moneyhabit.preferences;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;

public class PreferencesLogin {

    private static PreferencesLogin instancePrefLogin;
    private static Context contextPrefLogin;

    private static final String SHARED_PREF_NAME_LOGIN = "pref_login";

    private static final String KODE_RESPON_LOGIN = "kode_respon";
    private static final String STATUS_RESPON_LOGIN = "status_respon";
    private static final String MESSAGE_RESPON_LOGIN = "message_respon";
    private static final String STATUS_LOGIN = "status_login";

    private PreferencesLogin(Context context) {
        contextPrefLogin = context;
    }

    public static synchronized PreferencesLogin getInstance(Context context) {
        if (instancePrefLogin == null) {
            instancePrefLogin = new PreferencesLogin(context);
        }
        return instancePrefLogin;
    }

    public void setResponHeaderLogin(String kodeRespon,
                                   String statusRespon,
                                   String messageRespon){
        SharedPreferences sharedPreferences = contextPrefLogin.getSharedPreferences(SHARED_PREF_NAME_LOGIN, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();

        editor.putString(KODE_RESPON_LOGIN, kodeRespon);
        editor.putString(STATUS_RESPON_LOGIN, statusRespon);
        editor.putString(MESSAGE_RESPON_LOGIN, messageRespon);

        editor.apply();
    }

    public ArrayList<String> getResponHeaderLogin(){
        SharedPreferences sharedPreferences = contextPrefLogin.getSharedPreferences(SHARED_PREF_NAME_LOGIN, Context.MODE_PRIVATE);

        ArrayList<String> arrayDataHeaderLogin = new ArrayList<>();
        arrayDataHeaderLogin.add(sharedPreferences.getString(KODE_RESPON_LOGIN,null));
        arrayDataHeaderLogin.add(sharedPreferences.getString(STATUS_RESPON_LOGIN,null));
        arrayDataHeaderLogin.add(sharedPreferences.getString(MESSAGE_RESPON_LOGIN,null));

        return arrayDataHeaderLogin;
    }

    public void setSessionLogin(boolean statusLogin) {
        SharedPreferences sharedPreferences = contextPrefLogin.getSharedPreferences(SHARED_PREF_NAME_LOGIN, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();

        editor.putBoolean(STATUS_LOGIN, statusLogin);

        editor.apply();
    }

    public boolean getSessionLogin() {
        SharedPreferences sharedPreferences = contextPrefLogin.getSharedPreferences(SHARED_PREF_NAME_LOGIN, Context.MODE_PRIVATE);
        return sharedPreferences.getBoolean(STATUS_LOGIN, false);
    }
}
