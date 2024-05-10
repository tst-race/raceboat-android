package com.twosixtech.raceboat;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    public native int main();

    static {
        System.loadLibrary("raceboat");
        System.loadLibrary("raceboat-driver");
    }

    private RaceboatClient raceboatClient;
    private EditText messageEditText;
    private Spinner modeSpinner;
    private TextView responseTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(getLayoutId(this, "activity_main"));

        main();
        raceboatClient = new RaceboatClient(this);

        messageEditText = findViewById(getId(this, "messageEditText", "id"));
        modeSpinner = findViewById(getId(this, "modeSpinner", "id"));
        responseTextView = findViewById(getId(this, "responseTextView", "id"));

        // Set up the spinner with communication modes
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                getStringArrayId(this, "modes_array"), android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        modeSpinner.setAdapter(adapter);

        // Set up item selection listener for the spinner
        modeSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String mode = parent.getItemAtPosition(position).toString();
                // Connect to the server with the selected mode
                raceboatClient.connectToServer(mode);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // Do nothing
            }
        });

        // Set up click listener for the send button
        Button sendButton = findViewById(getId(this, "sendButton", "id"));
        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String message = messageEditText.getText().toString();
                // Send the message to the server
                sendMessage(message);
            }
        });
    }

    private void sendMessage(String message) {
        try {
            raceboatClient.sendMessage(message);
            // Clear the message field after sending
            messageEditText.getText().clear();
            // Display the response from the server
            String response = raceboatClient.receiveMessage();
            responseTextView.setText(response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int getLayoutId(Context context, String resourceName) {
        return context.getResources().getIdentifier(resourceName, "layout", context.getPackageName());
    }

    private int getId(Context context, String resourceName, String resourceType) {
        return context.getResources().getIdentifier(resourceName, resourceType, context.getPackageName());
    }

    private int getStringArrayId(Context context, String resourceName) {
        return context.getResources().getIdentifier(resourceName, "array", context.getPackageName());
    }
}
