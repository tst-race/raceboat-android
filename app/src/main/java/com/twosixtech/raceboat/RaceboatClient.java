package com.twosixtech.raceboat;

import android.content.Context;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.google.android.material.tabs.TabLayout;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class RaceboatClient {
    private LocalSocket clientSocket;
    private Context context;
    private Handler uiHandler;

    public RaceboatClient(Context context) {
        this.context = context;
        uiHandler = new Handler(Looper.getMainLooper());
    }

    public void connectToServer(String mode) {
        try {
            clientSocket = createSocket();
            // Send the mode to the server
            sendMessage(mode);
            // Start communication in a separate thread
            startCommunicationThread();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendMessage(String message) {
        try {
            OutputStream outputStream = clientSocket.getOutputStream();
            outputStream.write(message.getBytes());
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String receiveMessage() {
        try {
            InputStream inputStream = clientSocket.getInputStream();
            List<Byte> buffer = new ArrayList<>();
            int data;
            while ((data = inputStream.read()) != -1) {
                buffer.add((byte) data);
            }
            byte[] byteArray = new byte[buffer.size()];
            for (int i = 0; i < buffer.size(); i++) {
                byteArray[i] = buffer.get(i);
            }
            return new String(byteArray);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private LocalSocket createSocket() throws Exception {
        LocalSocket socket = new LocalSocket();
        LocalSocketAddress address = new LocalSocketAddress(context.getFilesDir().getPath() + "/Raceboat/raceboat_socket.sock", LocalSocketAddress.Namespace.FILESYSTEM);
        Log.i("RaceboatClient", "createSocket: address: " + address.getName());
        socket.connect(address);
        return socket;
    }

    private void startCommunicationThread() {
        // Define a new Runnable implementation
        Runnable communicationTask = new Runnable() {
            @Override
            public void run() {
                try {
                    // Perform socket communication operations here
                    // For example, sending and receiving messages
                    while (true) {
                        // Receive message from the server
                        String response = receiveMessage();
                        if (response != null) {
                            // Update UI with the received message
                            uiHandler.post(new Runnable() {
                                @Override
                                public void run() {
                                    // Update the UI elements here
                                    // For example, set text to a TextView
                                    // responseTextView.setText(response);
                                    // not sure I need to put anything here as I think the main activity will handle
                                    // if not need to update this
                                }
                            });
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };

        // Create a new Thread with the Runnable task
        Thread thread = new Thread(communicationTask);

        // Start the thread
        thread.start();
    }
}

