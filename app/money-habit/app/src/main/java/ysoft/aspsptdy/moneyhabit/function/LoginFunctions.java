package ysoft.aspsptdy.moneyhabit.function;

import static ysoft.aspsptdy.moneyhabit.LoginActivity.ENABLE_BUTTON_LOGIN;
import static ysoft.aspsptdy.moneyhabit.LoginActivity.RESPONSE_REQUEST_LOGIN;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.android.volley.ClientError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NoConnectionError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;
import java.util.HashMap;
import java.util.Map;

import ysoft.aspsptdy.moneyhabit.preferences.PreferencesLogin;
import ysoft.aspsptdy.moneyhabit.server.EndPoints;

public class LoginFunctions {

    private static LoginFunctions instanceFunctions;
    private static Context contextFunctions;

    StringRequest stringRequest;
    RequestQueue queueRequest;

    private LoginFunctions(Context context) {
        contextFunctions = context;
    }

    public static synchronized LoginFunctions getInstance(Context context) {
        if (instanceFunctions == null) {
            instanceFunctions = new LoginFunctions(context);
        }
        return instanceFunctions;
    }

    public void prosesLogin(String userName, String passKey) {
        Log.e("PROSEDURE", "prosesLogin (" + EndPoints.ENDPOINT_LOGIN + ") >> " + userName + " - " + passKey);

        stringRequest = new StringRequest(Request.Method.POST, EndPoints.ENDPOINT_LOGIN,
                response -> {
                    try {
                        JSONObject responseLogin = new JSONObject(response);

                        String getCode = responseLogin.getString("code");
                        String getStatus = responseLogin.getString("status");
                        String getMessage = responseLogin.getString("message");

                        Log.e("RESPONSE_LOGIN", getCode);

                        PreferencesLogin.getInstance(contextFunctions).setResponHeaderLogin(getCode, getStatus, getMessage);
                        LocalBroadcastManager.getInstance(contextFunctions).sendBroadcast(new Intent(RESPONSE_REQUEST_LOGIN));

                    } catch (Exception error) {
                        Log.e("RESPONSE_LOGIN", "ERROR EXCEPTION >> " + error);
                    }
                },
                error -> {

                    Log.e("ERROR_NETWORK", "NETWORK ERROR : " + error);
                    if (error instanceof NoConnectionError) {

                    } else if (error instanceof ClientError) {

                    }
                    LocalBroadcastManager.getInstance(contextFunctions).sendBroadcast(new Intent(ENABLE_BUTTON_LOGIN));
                }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("username", userName);
                params.put("userkey", passKey);
                return params;
            }
        };

        stringRequest.setShouldCache(false);
        queueRequest = Volley.newRequestQueue(contextFunctions);
        stringRequest.setRetryPolicy(new DefaultRetryPolicy(
                60000,
                0,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        queueRequest.add(stringRequest);
    }

}
