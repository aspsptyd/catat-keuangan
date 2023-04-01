package ysoft.aspsptdy.moneyhabit.function;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import ysoft.aspsptdy.moneyhabit.LoginActivity;
import ysoft.aspsptdy.moneyhabit.dashboard.HomeActivity;

public class GeneralFunctions {

    private static GeneralFunctions instanceFunctions;
    private static Context contextFunctions;

    private GeneralFunctions(Context context) {
        contextFunctions = context;
    }

    public static synchronized GeneralFunctions getInstance(Context context) {
        if (instanceFunctions == null) {
            instanceFunctions = new GeneralFunctions(context);
        }
        return instanceFunctions;
    }

    public void toastModule(String message, boolean longOfToast) {
        if (longOfToast) { // True : LENGHT_LONG
            Toast.makeText(contextFunctions, message, Toast.LENGTH_LONG).show();
        } else { // false : LENGHT_SHORT
            Toast.makeText(contextFunctions, message, Toast.LENGTH_SHORT).show();
        }
    }

    public void checkUserSession(boolean status, Context context) {
        if (status) {
            context.startActivity(new Intent(context, HomeActivity.class));
        } else {
            context.startActivity(new Intent(context, LoginActivity.class));
        }
    }
}
