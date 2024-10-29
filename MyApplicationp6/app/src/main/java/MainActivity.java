import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.example.myapplicationp6.R;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {

    Button mButton;
    TextView tv1;
    AlertDialog.Builder builder;
    String s;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize UI components
        mButton = findViewById(R.id.load_data);
        tv1 = findViewById(R.id.txtcname);
        final EditText et1 = findViewById(R.id.txtcode);

        // Setup AlertDialog
        builder = new AlertDialog.Builder(this);
        builder.setMessage("Are You Sure to Exit").setTitle("W3TechBlog");

        // Button click listener to load data
        mButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Check for internet connection
                ConnectivityManager cm = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
                NetworkInfo nInfo = cm.getActiveNetworkInfo();
                boolean connected = nInfo != null && nInfo.isConnected();

                if (connected) {
                    // Fetch the user input and make the API request
                    s = et1.getText().toString().trim();
                    String url = "https://w3techblog.com/tybca_example/showDetails.php?id=" + s;

                    JsonObjectRequest jsonRequest = new JsonObjectRequest(
                            Request.Method.GET, url, null,
                            new Response.Listener<JSONObject>() {
                                @Override
                                public void onResponse(JSONObject response) {
                                    try {
                                        // Parse the response JSON
                                        if (response.has("subject")) {
                                            JSONObject subject = response.getJSONObject("subject");

                                            String sname = subject.getString("cname");
                                            String cname = subject.getString("cincharge");

                                            if (sname.equals("0")) {
                                                tv1.setText("Record Not Found");
                                            } else if (sname.equals("-1")) {
                                                tv1.setText("Not using GET method");
                                            } else if (sname.equals("-2")) {
                                                tv1.setText("Error in Parameter");
                                            } else {
                                                tv1.setText("Course Name: " + sname + "\nCourse Incharge Name: " + cname);
                                            }
                                        } else {
                                            tv1.setText("Subject key not found in response.");
                                        }
                                    } catch (JSONException e) {
                                        tv1.setText("Error: " + e.getMessage());
                                    }
                                }
                            },
                            new Response.ErrorListener() {
                                @Override
                                public void onErrorResponse(VolleyError error) {
                                    builder.setMessage("Server is not Responding...").setTitle("W3TechBlog");
                                    builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                        public void onClick(DialogInterface dialog, int id) {
                                            // Dismiss dialog
                                        }
                                    });
                                    builder.show();
                                }
                            });

                    // Add the request to the Volley queue
                    Volley.newRequestQueue(MainActivity.this).add(jsonRequest);
                } else {
                    // Handle no internet connection
                    builder.setMessage("Internet is Off").setTitle("W3TechBlog");
                    builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            // Dismiss dialog
                        }
                    });
                    builder.show();
                }
            }
        });
    }

    // Override back press to show exit dialog
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        builder.setMessage("Are You Sure to Exit").setTitle("W3TechBlog");

        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                finish(); // Use finish() to exit the app gracefully
            }
        });
        builder.setNegativeButton("CANCEL", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                // User canceled the dialog
            }
        });

        builder.show();
    }
}
